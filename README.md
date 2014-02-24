# The Angular-Dropwizard provisioner 

An [Ansible](http://www.ansible.com/home) provisioner for [AngularJS](http://angularjs.org) and [Dropwizard](http://dropwizard.codahale.com).

This provisioner installs the [Angular-Dropwizard generator](https://github.com/rayokota/generator-angular-dropwizard) and all prerequisites.  Currently it only supports Ubuntu 12.0.4.

## Usage with AWS

Set up AWS environment variables as follows:

    export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXXX"    
	export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXX"
	export AWS_KEYPAIR_NAME="my-keypair-name"
	export AWS_SSH_PRIVATE_KEY_PATH="/path/to/my-keypair.pem"

Run Vagrant:

    vagrant up --provider=aws

Connect to the VM:

    vagrant ssh
    
Destroy the VM when done:

    vagrant destroy

## Usage with VirtualBox

Run Vagrant:

    vagrant up --provider=virtualbox

Connect to the VM:

    vagrant ssh
    
Destroy the VM when done:

    vagrant destroy

