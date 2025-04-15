sudo echo 'modify template Vagrantfile...'

sudo sed -i -e '/^  # SHELL/a   config.ssh.forward_agent = true' /opt/vagrant/embedded/gems/gems/vagrant-2.4.3/templates/commands/init/Vagrantfile.erb
sudo sed -i -e '/^  # SHELL/a   config.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_version: "4", nfs_udp: false' /opt/vagrant/embedded/gems/gems/vagrant-2.4.3/templates/commands/init/Vagrantfile.erb