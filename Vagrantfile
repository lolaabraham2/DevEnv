Vagrant.configure(2) do |config|
	config.vm.define "automation-King" do |automation|
		automation.vm.box = "ubuntu/xenial64"
    		automation.vm.network "private_network", ip: "192.168.33.50"
    		#auto-box.vm.network "public_network", bridge: "wlo1"
    		automation.vm.hostname = "automation-box"
      		automation.vm.provision "shell", path: "scripts/install.sh"
    		automation.vm.provider "virtualbox" do |v|
    		  v.memory = 2048
    		  v.cpus = 1
    		end
	end
end
