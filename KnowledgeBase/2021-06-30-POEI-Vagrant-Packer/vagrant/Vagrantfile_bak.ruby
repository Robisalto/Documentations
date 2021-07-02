Vagrant.configure("2") do |config|                          
  # On charge le fichier de values.yaml
  require 'yaml'                                           
  if File.file?('values.yaml')                             
    conf = YAML.load_file('values.yaml')                
  else                                                     
    raise "Configuration file 'values.yaml' does not exist"
  end         
  config.ssh.private_key_path = File.expand_path('/mnt/c/Users/Admin stagiaire.DESKTOP-8967908/GitHub/Documentations/KnowledgeBase/2021-06-30-POEI-Vagrant-Packer/vagrant/.vagrant.d/insecure_private_key')                                             

  if ARGV[1] and ARGV[1] != '-f' and ARGV[1] != 'save' and ARGV[1] != 'restore' and ARGV[1] != 'delete'  
    conf['machines'] = [
      [
        ARGV[1],
        ARGV[2] || '0.0.0.0',
        ARGV[3] || '256',
        ARGV[4] || '1',
        ARGV[5] || 'ubuntu/focal64',
        ARGV[6] || '80'
      ]
    ]
  end
                                                           
  # Les ressources
  conf['machines'].each do |name, ip ,memory, cpus, box, port|
    config.vm.define "#{name}" do |vm|
      vm.vm.hostname = "#{name}"
      vm.vm.box = "#{box}" || 'ubuntu/focal64'
      vm.vm.network :private_network, ip: "#{ip}"                                                                      
      vm.vm.provider "virtualbox" do |v|                     
        v.memory = conf['memory']                            
        v.cpus = conf['cpus']                                
        v.name = conf['name']   
        v.port = conf['port']                             
      end 
      vm.vm.provision :shell do |shell|
        shell.inline = "echo $1"
        shell.args = " 'Super Formation !!!' "
      end
      vm.vm.provision :shell do |shell|
        shell.path = conf['script_path'] + '\common-bootstrap.sh'
      end
      vm.vm.provision :shell do |shell|
        puts conf['script_path'] + "\\#{name}.sh"
        if conf['script_path'] + "\\#{name}.sh"
          shell.path = conf['script_path'] + "\\#{name}.sh"
        else
          shell.inline = "echo __END__"
        end
      end
      if "#{name}" == 's1.formation.lan'
        vm.vm.synched_folder "./www", "/var/www/html"
      end
      vm.vm.network "forwarded_port", guest: 80, host: "#{port}"
    end
    config.vm.provision :ansible do |ansible|
      ansible.verbose = "v"
      ansible.limit = "all"
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "provisioning/playbook.yml"
      ansible.inventory.path = "provisioning/hosts.ini"
      ansible.become = true
    end
  end
    config.trigger.before [ :up, :provision] do |trigger|
      trigger.name = ['ANSIBLE']
      trigger.info = 'Syntax check'
      trigger.run = {inline: 'ansible-playbook provisioning/playbook.yml --inventory provisioning/hosts.ini --syntax-check'}
    end
end