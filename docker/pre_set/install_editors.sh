sudo apt-get install -y geany
sudo apt-get install -y jedit
sudo apt-get install -y gedit
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
