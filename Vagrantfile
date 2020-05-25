Vagrant.configure("2") do |config|

  # All server set
  config.vm.box = "centos/7"
  config.vm.box_check_update = true

  # Create cent1
  config.vm.define "cent1" do |cent1|
    cent1.vm.hostname = "cent1"
    cent1.vm.network "private_network", ip: "172.18.1.91"
    cent1.vm.provider "virtualbox" do |v|
      v.name = "cent1"
      v.memory = 512
      v.cpus = 2
      v.linked_clone = true
      v.gui = false
    end

    cent1.vm.provision "file", source: ".", destination: "/tmp/vagrant"
    cent1.vm.provision "shell", inline: <<-SHELL
      mv /tmp/vagrant /vagrant
      useradd worker    
      sudo yum -y install net-tools gcc.x86_64 gcc-c++.x86_64 wget.x86_64 bzip2-devel.x86_64 pkgconfig.x86_64 openssl-devel.x86_64 make.x86_64 man.x86_64 nasm.x86_64 gmp.x86_64 gdbm-devel.x86_64 readline-devel.x86_64 compat-readline43.x86_64 ncurses-devel.x86_64 db4-devel.x86_64 automake* autoconf* pcre-devel.x86_64 tcl-devel.x86_64 tcl.x86_64
      sudo yum -y update
    SHELL
    cent1.vm.provision "shell", path: "SHELL/install_redis.sh"
    cent1.vm.provision "shell", path: "SHELL/start_redis.sh"
  end

  # Create cent2
  config.vm.define "cent2" do |cent2|
    cent2.vm.hostname = "cent2"
    cent2.vm.network "private_network", ip: "172.18.1.92"
    cent2.vm.provider "virtualbox" do |v|
      v.name = "cent2"
      v.memory = 512
      v.cpus = 2
      v.linked_clone = true
      v.gui = false
    end

    cent2.vm.provision "file", source: ".", destination: "/tmp/vagrant"
    cent2.vm.provision "shell", inline: <<-SHELL
      mv /tmp/vagrant /vagrant
      useradd worker
      sudo yum -y install net-tools gcc.x86_64 gcc-c++.x86_64 wget.x86_64 bzip2-devel.x86_64 pkgconfig.x86_64 openssl-
devel.x86_64 make.x86_64 man.x86_64 nasm.x86_64 gmp.x86_64 gdbm-devel.x86_64 readline-devel.x86_64 compat-readline43.x
86_64 ncurses-devel.x86_64 db4-devel.x86_64 automake* autoconf* pcre-devel.x86_64 tcl-devel.x86_64 tcl.x86_64
      sudo yum -y update
    SHELL
    cent2.vm.provision "shell", path: "SHELL/install_redis.sh"
    cent2.vm.provision "shell", path: "SHELL/start_redis.sh"
  end

  # Create cent3
  config.vm.define "cent3" do |cent3|
    cent3.vm.hostname = "cent3"
    cent3.vm.network "private_network", ip: "172.18.1.93"
    cent3.vm.provider "virtualbox" do |v|
      v.name = "cent3"
      v.memory = 512
      v.cpus = 2
      v.linked_clone = true
      v.gui = false
    end

    cent3.vm.provision "file", source: ".", destination: "/tmp/vagrant"
    cent3.vm.provision "shell", inline: <<-SHELL
      mv /tmp/vagrant /vagrant
      useradd worker
      sudo yum -y install net-tools gcc.x86_64 gcc-c++.x86_64 wget.x86_64 bzip2-devel.x86_64 pkgconfig.x86_64 openssl-
devel.x86_64 make.x86_64 man.x86_64 nasm.x86_64 gmp.x86_64 gdbm-devel.x86_64 readline-devel.x86_64 compat-readline43.x
86_64 ncurses-devel.x86_64 db4-devel.x86_64 automake* autoconf* pcre-devel.x86_64 tcl-devel.x86_64 tcl.x86_64
      sudo yum -y update
    SHELL
    cent3.vm.provision "shell", path: "SHELL/install_redis.sh"
    cent3.vm.provision "shell", path: "SHELL/start_redis.sh"
  end
end
