sudo echo 'modify template Vagrantfile...'

sudo sed -i '/config.ssh.forward_agent = true/a # SHELL' /opt/vagrant/embedded/gems/gems/vagrant-2.4.3/templates/commands/init/Vagrantfile.erb
sudo sed -i '/config.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_version: "4", nfs_udp: false/a # SHELL' /opt/vagrant/embedded/gems/gems/vagrant-2.4.3/templates/commands/init/Vagrantfile.erb