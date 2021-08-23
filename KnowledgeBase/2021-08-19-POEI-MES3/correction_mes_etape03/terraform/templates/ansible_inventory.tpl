[app]
%{ for instance in app_instances ~}
${instance.name} ansible_host=${instance.public_ip} _private_ip=${regex("[^/]*", instance.private_ip)}
%{ endfor ~}

[es_cluster]
%{ for instance in es_cluster_instances ~}
${instance.name} ansible_host=${instance.public_ip} _private_ip=${regex("[^/]*", instance.private_ip)}
%{ endfor ~}
