# Vagrant Commands

Box = Operating System Image

```bash
vagrant box shortenedURL    #will download the necessary files for vagrant
vagrant                     #will list options available
vagrant init USER/BOX       #will create the vagrant file
vagrant ssh [VM]            #Will ssh into the virtual machine --------exit-------- will terminate the ssh session
vagrant box add USER/BOX    #will download and store the box in local system
vagrant up [VM]             #will start the VM specified, if none specified, will start all of the vms listed in the config
vagrant status [VM]         #will check the status of the specified virtual machine
vagrant halt [VM]           #will stop the VM specified, if none specified, will stop all of the vms listed in the config. 
                            #No data will be lost in this process
vagrant reload [VM]         
                     # will restart the virtual machine reading the vagrantfile and make necessary changes

vagrant suspend [VM]        #will suspend the VM specified, if none specified, will suspend all of the vms listed in the config.
vagrant resume [VM]         #will resume the VM specified, if none specified, will resume all of the vms listed in the config
vagrant destroy [VM]        #will destroy the VM specified, if none specified, will destroy all of the vms listed in the config

```

## Vagrant configuration file

**Single Machine Setup:**

```vagrantfile
Vagrant.configure(2) do |config|
    config.vm.box = "USER/BOX"
    config.vm.hostname = "HOSTNAME"
    config.vm.network "private_network", ip: "1.1.1.1" #for assigning the virtual box a static ip
#-----------------------------For post installation instruction--------------------------------------
    config.vm.provision "shell", path: "setup.sh"
#----------------------------------------------------------------------------------------------------
#------------------- Default Configuration settings--------------------------------------------------
    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "1024"
    end
#----------------------------------------------------------------------------------------------------
end
```

**Mullti Machine Setup:**

```vagrantfile
Vagrant.configure(2) do |config|
    config.vm.box = "USER/BOX"
    
    config.vm.define "server1" do |server1|
        server1.vm.hostname = "server1"
        server1.vm.network "private_network", ip: "1.1.1.1"
    end
    
    config.vm.define "server2" do |server2|
        server2.vm.hostname = "server2"
        server2.vm.network "private_network", ip: "1.1.1.2"
    end
end
```
