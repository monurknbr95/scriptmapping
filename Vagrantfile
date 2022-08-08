# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Build a Domain Controller
  config.vm.define "dir1" do |dir1|

    # Source box and VM config
    dir1.vm.box = "StefanScherer/windows_2019"
    dir1.vm.guest = "windows"
    dir1.vm.hostname = "DIR1"

    # Network config
    dir1.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    dir1.vm.network :private_network, ip: "192.168.0.5", netmask: "255.255.252.0"

    # WinRM config
    dir1.vm.communicator = "winrm"
    dir1.winrm.transport = :plaintext
    dir1.winrm.basic_auth_only = true
    dir1.winrm.username = "vagrant"
    dir1.winrm.password = "vagrant"

    # VirtualBox config
    dir1.vm.provider :virtualbox do |v|
      v.gui = true
      v.name = "DIR1"
      v.linked_clone = true
      v.cpus = 4
      v.memory = 4096
    end

    # Install Active Directory
    dir1.vm.provision "shell", path: "./files/install-active-directory.ps1"
    dir1.vm.provision "shell", reboot: true
  
  end

  # Build a generic server
  config.vm.define "srv1" do |srv1|

    # Source box and VM config
    srv1.vm.box = "StefanScherer/windows_2019"
    srv1.vm.guest = "windows"
    srv1.vm.hostname = "SRV1"

    # Network config
    srv1.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    srv1.vm.network :private_network, ip: "192.168.2.3", netmask: "255.255.252.0"

    # WinRM config
    srv1.vm.communicator = "winrm"
    srv1.winrm.transport = :plaintext
    srv1.winrm.basic_auth_only = true
    srv1.winrm.username = "vagrant"
    srv1.winrm.password = "vagrant"

    # VirtualBox config
    srv1.vm.provider :virtualbox do |v|
      v.gui = true
      v.name = "SRV1"
      v.linked_clone = true
      v.cpus = 4
      v.memory = 4096
    end

    # Join Active Directory
    srv1.vm.provision "shell", path: "./files/join-domain.ps1"
    srv1.vm.provision "shell", reboot: true
  end


end