sudo echo 'modify template Vagrantfile...'

VERSION=`vagrant -v | cut -d\  -f2`
TEMPLATE_FILE="/opt/vagrant/embedded/gems/gems/vagrant-""$VERSION""/templates/commands/init/Vagrantfile.erb"
sudo sed -i -e '/^  # SHELL/a \  config.ssh.forward_agent = true' $TEMPLATE_FILE
sudo sed -i -e '/^  # SHELL/a \  config.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_version: "4", nfs_udp: false' $TEMPLATE_FILE
