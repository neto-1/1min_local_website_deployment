Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
    config.vm.box_version = "20241002.0.0"

    # Private network configuration
    config.vm.network "private_network", ip: "192.168.56.19"

    # public network configuration
    config.vm.network "public_network", bridge: "en0: Ethernet"

    # Provisioning with a shell script
    config.vm.synced_folder "./scripts", "/opt/scripts"

    # virtualbox configuration
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 2
    end

end