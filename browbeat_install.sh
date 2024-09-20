#!/bin/bash
git clone https://opendev.org/x/browbeat
cd browbeat
cat>vars.yaml<<EOF
browbeat_network: "9870ffb0-8e91-4770-92cd-8238c39b1fd3"
kubeconfig_path: /home/zuul/.kube/config
dns_server: "10.75.5.25"
grafana_host: "norton.perf.lab.eng.rdu2.redhat.com"
graphite_host: "norton.perf.lab.eng.rdu2.redhat.com"
graphite_prefix: "PerfCI-OSP18.0-network-ovn"
install_browbeat_workloads: true
# TODO(ykarel) Switch to some other internal location
octavia_test_bin_path: "https://ykarel.fedorapeople.org/octavia/test_server.bin"
octavia_test_bin_download_cmd: "curl -O --insecure"
browbeat_user: "zuul"
is_rhoso_deployment: true
python_interpreter: "auto"
browbeat_workloads:
  octavia:
    name: custom-cirros
    src: custom-cirros.file
    dest: "/home/stack/browbeat/custom-cirros.file"
    image: cirro5
    enabled: true
    flavor: m1.tiny-cirros
EOF


ansible-playbook ansible/install/browbeat.yml  -e @./vars.yaml
