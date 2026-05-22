echo "##############################################################"
echo "Starting website deployment..."
echo "##############################################################"

echo "##############################################################"
echo "Updating package lists and installing necessary packages..."
echo "##############################################################"
sudo apt update
sudo apt install wget unzip apache2 -y

echo "##############################################################"   
echo "Starting and enabling Apache web server..."
echo "##############################################################"
sudo systemctl start apache2
sudo systemctl enable apache2

#echo "Creating temporary directory for website files..."
mkdir -p /tmp/websites/
cd /tmp/websites/

echo "##############################################################"
echo "Downloading website template..."
echo "##############################################################"
wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip

echo "##############################################################"
echo "Unzipping downloaded website template..."
echo "##############################################################"
unzip 2129_crispy_kitchen.zip
sudo cp -r 2129_crispy_kitchen/* /var/www/html/

echo "##############################################################"   
echo "Restarting Apache web server to apply changes..."
echo "##############################################################"
sudo systemctl restart apache2


echo "##############################################################"
echo "Website deployment completed successfully!"
echo "You can access the website on your local browser at http://192.168.56.19"
echo "##############################################################"
cd /tmp/
sudo rm -rf /tmp/websites/

