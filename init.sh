#system settings
sudo pmset hibernatemode 0
sudo rm /private/var/vm/sleepimage
#sudo rm -f /private/var/vm/sleepimage
#sudo touch /private/var/vm/sleepimage #create a blank sleepimage file
#sudo chflags uchg /private/var/vm/sleepimage #make it unwritable

sudo nvram bluetoothHostControllerSwitchBehavior=always #https://apple.stackexchange.com/questions/94402/force-os-x-to-use-bluetooth-dongle-instead-of-built-in-controller
defaults write -g com.apple.mouse.scaling -float 65.0 #magic mouse, 3.0 default
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g com.apple.mouse.scaling 1

defaults write com.apple.menuextra.clock IsAnalog -bool true
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu"
killall SystemUIServer

defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

brew update
brew upgrade

user$ brew install bash
user$ /usr/local/opt/bash/bin/bash
user$ sudo bash -c 'echo /usr/local/opt/bash/bin/bash >> /etc/shells'
user$ chsh -s /usr/local/opt/bash/bin/bash
user$ sudo chsh -s /usr/local/opt/bash/bin/bash
brew install mc

brew tap caskroom/cask
brew cask install magicprefs #magic mouse
brew cask install licecap #screen2gif recorder
brew cask install the-unarchiver
brew cask install google-chrome
brew cask install tor-browser
brew cask install firefox
brew cask install telegram
brew cask install whatsapp
brew cask install WordService
brew cask install libreoffice #for read large >2mb xls files
#brew cask install coteditor
brew cask install bbedit
#https://gist.github.com/isao/8983629 #BBEdit Codeless Language Module for Nginx Configuration files
#copy to /Users/USERNAME/Library/Application Support/BBEdit/Language Modules/
brew cask install qbittorrent
#brew cask install vlc
brew cask install mplayerx #replace vlc
brew cask install qlvideo #preview on finder for h.265 and over video files
brew cask install vscodium
#brew cask install visual-studio-code
#https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
brew cask install karabiner-elements
brew cask install teamviewer
brew cask install skype
brew cask install sequel-pro
brew cask install hex-fiend
brew cask install cyberduck
#brew cask install cyberduck@6.6.1 - don't respond @buy me!
brew cask install gimp
brew cask install calibre
brew cask install iterm2
brew cask install virtualbox;
brew cask install thunderbird
https://addons.thunderbird.net/en-US/thunderbird/addon/thunderhtmledit/
brew cask install seamonkey --language=en-US
brew cask install plistedit-pro
brew cask install amorphousdiskmark #ssd perfomance check
#https://www.fosshub.com/Audacity.html/audacity-macos-2.3.1.dmg
brew cask install clean-me
brew install wine
brew install node
brew install wget
brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
brew cleanup 
echo 'export VISUAL=nano; export EDITOR="$VISUAL"' >> ~/.bashrc

#ram-disk for safari
#https://github.com/zafarella/OSX-RAMDisk
https://github.com/imothee/tmpdisk/releases

#xcode
https://developer.apple.com/download/more/
#macOS 10.12.6 sierra - xcode ver: 9.2.1

#Mac App Store command line interface
brew install mas
https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12

#disable turbo-boost for longest battery work and low noise fan
https://s3.amazonaws.com/turbo-boost-switcher/Turbo+Boost+Switcher_2.8.0.zip
https://github.com/rugarciap/Turbo-Boost-Switcher/issues/4#issuecomment-398014403
#driver for favorite audio-card
https://github.com/Wouter1/EMU-driver/releases
https://www.readpixel.com/downloads/files/WakeOnLan1.0.zip

#web-server
brew install nginx
brew install php@7.1

#https://github.com/phpredis/phpredis/issues/1341#issuecomment-402798590
#https://github.com/Homebrew/homebrew-core/issues/26408#issuecomment-381417328
#brew install imagemagick
#brew install pkg-config
#pecl install imagick
#rm /usr/local/lib/php/pecl
#ln -s /usr/local/Cellar/php@7.1/7.1.27/pecl /usr/local/lib/php/pecl
php -v
sudo brew services restart php@7.1

#brew install percona-server
brew install mysql@5.7
brew link mysql@5.7 --force
brew services start mysql@5.7
mysql_secure_installation
#mysql -u root -p
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';
#mysql -uUSER -p -e 'SHOW VARIABLES WHERE Variable_Name LIKE "%dir"' show place databases
#mysql.server start
#mysqld stop
#brew services start percona-server
mysql_secure_installation
sudo brew services start nginx
sudo brew services start php@7.1
brew link php@7.1 --force
brew services list
https://github.com/downloads/specialunderwear/Hosts.prefpane/Hosts-1.3.pkg

#ansible
brew install python
curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
sudo python get-pip.py
#sudo pip install ansible==2.1.1
sudo pip install ansible
sudo pip install passlib
sudo pip install mysqlclient
sudo pip install google_images_download

#gulp
npm install --global gulp-cli
#npm install --global coffee-script
brew install bower
#Yarn and Parcel need
