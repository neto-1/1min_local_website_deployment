# Automated Apache Website Deployment with Vagrant & Bash

This project demonstrates a practical DevOps workflow using:

- Vagrant
- VirtualBox
- Ubuntu Server
- Apache2
- Bash scripting
- Cron jobs

The project provisions an Ubuntu virtual machine, deploys a static website automatically, and implements a monitoring script to ensure the Apache2 web service remains available.

## Project Overview

This project was created to demonstrate:

- Linux system administration
- Infrastructure provisioning
- Apache web server deployment
- Bash scripting automation
- Cron job scheduling
- Basic service monitoring and self-healing
- DevOps fundamentals

The deployment process is fully automated using shell scripts.

## Technologies Used

- Ubuntu Jammy 64
- Vagrant
- VirtualBox
- Apache2
- Bash
- Cron
- Linux Networking

## 📁 Project Structure

```text
project-folder/
│
├── Vagrantfile
├── README.md
│
└── scripts/
    ├── website_deployment.sh
    └── apache_monitor.sh
```

## Prerequisites

Install the following tools on your host machine:

- Vagrant
- VirtualBox
- Git

### Hint (how to install the window package manager tool `chocolatey` and subsequently `vagrant` using chocolatey )
- To install the package manager tool "chocolatey" on windows, visit [Chocolatey Installation Guide](https://chocolatey.org/install) or Open powershell as admin and run the command under:

```bash
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

- To install vagrant, etc using choco on windows
```bash
    choco install virtualbox --version=7.2.6 -y
	choco install vagrant --version=2.4.9 -y
	choco install git -y
	choco install vscode -y

```

## Deployment Steps

### Host Machine Steps

#### 1️⃣ Clone the Repository

open git bash and run the following commands

```bash
    mkdir projects
    cd projects
    git clone <https://github.com/neto-1/1min_local_website_deployment.git>
    cd <1min_local_website_deployment>
```

#### 2️⃣ Start the Virtual Machine

Run the following command inside the folder containing the `Vagrantfile`:

```bash
    vagrant up
```

This command will:

- Download the Ubuntu image
- Create the virtual machine
- Configure networking
- Mount the shared `scripts` folder inside the VM

#### 3️⃣ Connect to the VM

```bash
    vagrant ssh
```

### VM Configuration Steps

#### 4️⃣ Become Root User

```bash
    sudo -i
```

####  Optional: Change the Hostname

```bash
    vim /etc/hostname
```
Inside this file, replace the content with the hostname of your choice e.g `web01`, save and quit. The run: 

```bash
    hostname web01
```

Verify the hostname via:

```bash
    hostname
```


#### 5️⃣ Navigate to the Shared Scripts Folder

```bash
    cd /opt/scripts/
```

#### 6️⃣ Verify Script Permissions

```bash
    ls -l
```

If the deployment script is not executable, make it executable:

```bash
    chmod +x website_deployment.sh
```


### Website Deployment

#### 7️⃣ Run the Deployment Script

```bash
    ./website_deployment.sh
```

The script automatically performs the following tasks:

- Updates package repositories
- Installs Apache2, wget, and unzip
- Starts and enables Apache2
- Downloads a website template from the [tooplate website](https://www.tooplate.com/)
- Extracts the template
- Copies website template files to `/var/www/html/`
- Restarts Apache2

---

###  Access the Website

Retrieve the VM IP address:

```bash
    ip addr show
```

Look for the address at this section (or similar):

```text
    enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu
```

Then open the website in your browser:

```text
    http://192.168.56.19
```


## Apache Auto-Restart Monitoring

This project also includes a monitoring script called:

```text
    apache_monitor.sh
```

The purpose of this script is to keep the website available at all times.

The script checks every minute whether the Apache2 service is running.

If Apache2 stops for any reason, the script automatically restarts it.

This demonstrates basic service reliability and self-healing concepts commonly used in DevOps and production environments.


## Configure Crontab with apache2 monitoring script

Open the root crontab:

```bash
    crontab -e
```

Add the following line at the bottom:

```bash
* * * * * /opt/scripts/apache_monitor.sh
```

This executes the monitoring script every minute.

Save and exit.

---

# ✅ Verify Cron Configuration

Check active cron jobs:

```bash
crontab -l
```

You should see:

```bash
* * * * * /opt/scripts/apache_monitor.sh
```

---

### Test the Monitoring System

Stop Apache2 manually:

```bash
    systemctl stop apache2
```

Wait approximately one minute.

Then verify Apache2 status:

```bash
systemctl status apache2
```

If the cron monitoring works correctly, Apache2 should automatically restart.

You can also inspect the monitoring logs:

```bash
cat /var/log/apache_monitor.log
```

## Deployment Script Summary

The `website_deployment.sh` script performs:

✅ Package updates  
✅ Apache2 installation  
✅ Website template download  
✅ Website deployment  
✅ Apache restart  

---

## Monitoring Script Summary

The `apache_monitor.sh` script performs:

✅ Apache2 health check  
✅ Automatic restart if service fails  
✅ Logging to `/var/log/apache_monitor.log`  
✅ Automated execution every minute using cron  

---

## DevOps Skills Demonstrated

This project demonstrates practical DevOps skills such as:

- Infrastructure provisioning
- Linux administration
- Apache web server deployment
- Bash scripting
- Service monitoring
- Cron automation
- Infrastructure reliability
- Troubleshooting
- Virtualization with Vagrant and VirtualBox
- Networking Configuration

The VM uses:

*Private Network*

```text
    192.168.56.19
```

Used for browser access from the host machine.

*Public Network*

Bridged adapter enabled for external communication.

## Useful Commands

## Host Machine

```bash
vagrant up     # To power ON the VM
vagrant ssh    # To access the VM via SSH
vagrant halt    # To power OFF the VM
vagrant destroy # To delete the VM
```

## Author

Nelson Todem

Aspiring DevOps & Cloud Engineer passionate about:

- Linux
- Automation
- Docker
- Kubernetes
- AWS
- Infrastructure as Code
- Cloud technologies
- System reliability