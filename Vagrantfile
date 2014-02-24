# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP. This IP is used in the example Ansible inventory file.
  #config.vm.network :private_network, ip: "192.168.222.111"

  # For information on available options for Ansible provisioning, please visit:
  # http://docs.vagrantup.com/v2/provisioning/ansible.html
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "setup.yml"
    #ansible.inventory_path = "ansible_hosts"
    ansible.verbose = "vvv"
  end

  # For information on available options for the Virtualbox provider, please visit:
  # http://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider :virtualbox do |vb, override|
    override.ssh.username = "vagrant"
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    override.vm.network :forwarded_port, guest: 80, host: 3000
    #override.vm.network :private_network, ip: "192.168.222.111"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # This configuration is for our EC2 instance
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    # ubuntu AMI
    #aws.ami = "ami-ad184ac4"
    aws.ami = "ami-a73264ce"
    aws.instance_type = "t1.micro"
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    aws.security_groups = ["default"]

    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV['AWS_SSH_PRIVATE_KEY_PATH']
  end
end
