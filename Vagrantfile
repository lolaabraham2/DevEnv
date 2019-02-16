Vagrant.configure(2) do |config|
	config.vm.define "devops-box" do |devops|
		devops-box.vm.box = "ubuntu/xenial64"
    		devops-box.vm.network "private_network", ip: "192.168.33.50"
    		#devops-box.vm.network "public_network", bridge: "wlo1"
    		devops.vm.hostname = "devops-box"
      		devops.vm.provision "shell", path: "scripts/install.sh"
    		devops.vm.provider "virtualbox" do |v|
    		  v.memory = 2048
    		  v.cpus = 1
    		end
	end
end
