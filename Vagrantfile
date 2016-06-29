# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "relativkreativ/centos-7-minimal"

  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.customize ['modifyvm', :id, '--cpus', 1, '--memory', 256]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvvv"
    ansible.playbook = "tests/test.yml"
  end

  config.vm.provision "shell", privileged: false, inline: <<-END
    command -v bats >/dev/null 2>&1 || {
    sudo yum install -qq -y bats
    }
    bats /vagrant/tests/check.bats
  END
end
