IMAGE_NAME = "ubuntu/jammy64"
K8S_VERSION = "1.33"
CALICO_VERSION = "3.30.0"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.box = IMAGE_NAME

    config.vm.define "master" do |master|
        master.vm.hostname = "master"
        master.vm.network "private_network", ip: "10.0.0.10"
        master.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
        end
        master.vm.provision "ansible" do |ansible|
            ansible.compatibility_mode = "2.0"
            ansible.playbook = "setup-playbook.yaml"
            ansible.inventory_path = "inventory.ini"
            ansible.extra_vars = {
                CALICO_VERSION: CALICO_VERSION,
                K8S_VERSION: K8S_VERSION,
                node_ip: "10.0.0.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.hostname = "node-#{i}"
            node.vm.network "private_network", ip: "10.0.0.#{i + 10}"
            node.vm.provider "virtualbox" do |v|
                v.memory = 2048
                v.cpus = 1
            end
            node.vm.provision "ansible" do |ansible|
                ansible.compatibility_mode = "2.0"
                ansible.playbook = "setup-playbook.yaml"
                ansible.inventory_path = "inventory.ini"
                ansible.extra_vars = {
                    CALICO_VERSION: CALICO_VERSION,
                    K8S_VERSION: K8S_VERSION,
                    node_ip: "10.0.0.#{i + 10}",
                }
            end
        end
    end
end

