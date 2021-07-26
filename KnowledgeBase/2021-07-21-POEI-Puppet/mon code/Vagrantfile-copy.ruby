Vagrant.configure("2") do |config|
  #int = "eth0"
  range = "172.16.8.1"
  cidr = "255.255.255.0"
  [
    ["ppmaster.formation.lan", "#{range}1", "3048", 'psable/ppmaster' ],
  ].each do |vmname,ip,mem,os|
    config.vm.define "#{vmname}" do |machine|

      machine.vm.provider "virtualbox" do |v|
        v.memory = "#{mem}"
        v.cpus = 1
        v.name = "#{vmname}"
        v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
      end

      machine.vm.box = "#{os}"
      machine.vm.hostname = "#{vmname}"
      machine.vm.network "public_network",#bridge: "#{int}",
        ip: "#{ip}",
        netmask: "#{cidr}"
    end
  end
end
