#~/Library/Preferences/com.apple.Terminal.plist history terminal.app by menu click "new command"
#~/Library/Containers/com.coteditor.CotEditor/Data/Library/Preferences/com.coteditor.CotEditor.plist history "find & replace" CotEditor.app

#https://apps.apple.com/us/app/bandwidth/id490461369 #mac bandwidth monitor menu bar

sudo trimforce enable
#system settings
touch ~/.hushlogin #speedup terminal tab init
sudo pmset -a hibernatemode 0 # what is -a?
sudo pmset -a standbydelaylow 1800
sudo pmset -a standbydelayhigh 3600
#standbydelayhigh and standbydelaylow specify the delay, in seconds, before writing the hibernation image to disk and powering off memory for Standby. standbydelayhigh is used when the remaining battery capacity is high, and standbydelaylow is used when the remaining battery capacity is low.
#reboot
sudo rm -f /private/var/vm/sleepimage #remove
sudo touch /private/var/vm/sleepimage #create empty
sudo chflags uchg /private/var/vm/sleepimage  #set readonly
ls -la /private/var/vm  #check size of 0 bytes
#sudo pmset hibernatemode 0
#sudo rm /private/var/vm/sleepimage
#sudo rm -f /private/var/vm/sleepimage
#sudo touch /private/var/vm/sleepimage #create a blank sleepimage file
#sudo chflags uchg /private/var/vm/sleepimage #make it unwritable

#enable Airdrop on EVERY wifi device usb-wifi
# Then Restart Finder or restart your computer
#https://gist.github.com/vansteen/3199403
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
brew install --cask onyx
#upnp manager
https://github.com/kaklakariada/portmapper
https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot
#set TTL from 64 to 65 for mobile hotspot
sudo sysctl -w net.inet.ip.ttl=65
#for after restart TTL work too:
sudo touch /etc/sysctl.conf
sudo echo "net.inet.ip.ttl=65" > /etc/sysctl.conf

#timemachine
defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1 #use any drive for timemachine


#useful commands 
sudo update_dyld_shared_cache -force #update cahe links https://zer0-in.livejournal.com/19105.html
#disable notification update
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0 #https://apple.stackexchange.com/questions/344278/how-can-i-disable-the-red-software-update-notification-bubble-on-the-system-pref

sudo nvram bluetoothHostControllerSwitchBehavior=always #https://apple.stackexchange.com/questions/94402/force-os-x-to-use-bluetooth-dongle-instead-of-built-in-controller
defaults write -g com.apple.mouse.scaling -float 65.0 #magic mouse, 3.0 default
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g com.apple.trackpad.scaling -float 5.5 #magic trackpad sesitivity, default max 3.0
#defaults write -g com.apple.mouse.scaling 1

defaults write com.apple.menuextra.clock IsAnalog -bool true
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu"
killall SystemUIServer

defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null

brew update
brew upgrade

#https://github.com/jbtule/cdto #open terminal to current folder
brew install --cask cd-to

#brew install bash
#/usr/local/opt/bash/bin/bash
#sudo bash -c 'echo /usr/local/opt/bash/bin/bash >> /etc/shells'
#chsh -s /usr/local/opt/bash/bin/bash
#sudo chsh -s /usr/local/opt/bash/bin/bash
brew install fish
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish
set -U fish_user_paths /usr/local/bin $fish_user_paths

brew install mc
brew install htop

brew tap caskroom/cask
brew install --cask aldente #80% charge battery for long it life
brew install --cask find-any-file
brew install --cask disk-inventory-x #show large filess, easy clear space
brew install --cask omnidisksweeper #show large filess, easy clear space 2
brew install --cask hwsensors
#brew install --cask magicprefs #magic mouse
#brew install --cask licecap #screen2gif recorder -< in new catalina mac os may be not need
brew install --cask the-unarchiver
#brew install --cask google-chrome
brew install --cask tor-browser
brew install --cask monitorcontrol
brew install --cask diffmerge #file difference tools
#brew install --cask waterfox-classic
brew install --cask eloston-chromium #chrome without google service
#https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
#https://greasyfork.org/en/scripts/19993-ru-adlist-js-fixes
brew install --cask firefox
brew tap homebrew/cask-versions
brew install --cask firefox-developer-edition
brew install --cask telegram
brew install --cask whatsapp
brew install --cask WordService
brew install --cask background-music #volume control by app and record audio by quick time from source
brew install --cask libreoffice #for read large >2mb xls files
#brew install --cask bbedit      #for large files edit
brew install --cask bbedit
brew install --cask coteditor
#brew install --cask bbedit
#https://gist.github.com/isao/8983629 #BBEdit Codeless Language Module for Nginx Configuration files
#copy to /Users/USERNAME/Library/Application Support/BBEdit/Language Modules/
brew install --cask qbittorrent
#brew install --cask vlc
brew install --cask soda-player
#brew install --cask qlvideo #preview on finder for h.265 and over video files
#brew install --cask vscodium #bbedit instead
#brew install --cask visual-studio-code
#https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
#brew install --cask karabiner-elements
brew install --cask skype
brew install --cask sequel-pro
brew install --cask hex-fiend
brew install --cask cyberduck
#brew install --cask cyberduck@6.6.1 - don't respond @buy me!
brew install --cask gimp
brew install --cask handbrake #video converter
brew install --cask fontforge #fonts editor
#brew install --cask file-juicer #Extract images from PDF, PowerPoint, Word, Excel and other Files
#https://www.macports.org/install.php
# sudo port install inkscape
# brew install --cask xquartz #need enter sudo pass!
# brew install --cask inkscape
brew install --cask calibre
brew install --cask fbreader
brew install --cask iterm2
brew install --cask thunderbird
#https://addons.thunderbird.net/en-US/thunderbird/addon/thunderhtmledit/
brew install --cask seamonkey --language=en-US
brew install --cask plistedit-pro
#brew install --cask apppolice
brew install --cask amorphousdiskmark #ssd perfomance check
brew install --cask coconutbattery
brew install --cask adium
brew install --cask controlplane
brew install --cask openmtp #android file transfer
#https://www.fosshub.com/Audacity.html/audacity-macos-2.3.1.dmg
###!!!!brew install --cask clean-me - break system!
#brew install wine  $El capitan
brew tap gcenx/wine
brew install --cask --no-quarantine wine-crossover
brew install wget
brew install telnet
brew install hudochenkov/sshpass/sshpass
brew install mosh #for connect over LTE with change IP without reconnect
#brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
#https://superuser.com/a/1366790/594495
#brew install e2fsprogs #hdd repair/scan #diskutil list #/usr/local/Cellar/e2fsprogs/1.44.3/sbin/badblocks -v /dev/diskX
#packet_write_wait: Connection to *.*.*.* port 22: Broken pipe
brew install proxychains-ng -s #Where the -s tells brew to compile from source.
#proxychains4 node app.js --name=xParserDaemon
#/usr/local/etc/proxychains.conf
brew install --cask motrix #perfect download manager

#sudo nano /etc/ssh/ssh_config
#Host *
#    ServerAliveInterval 120
#for 4g ssh norm connection

brew cleanup 
echo 'export VISUAL=nano; export EDITOR="$VISUAL"' >> ~/.bashrc

#ram-disk for safari
#https://github.com/zafarella/OSX-RAMDisk
#https://github.com/imothee/tmpdisk/releases

#xcode
#https://developer.apple.com/download/more/
#macOS 10.12.6 sierra - xcode ver: 9.2.1

#Mac App Store command line interface
brew install mas
mas install easyres #set custom hdpi resolution
###brew install --cask avibrazil-rdm #Utility to set a Retina display to custom resolutions
bash -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)" #add retina resolution hidpi to any monitor
https://github.com/syscl/Enable-HiDPI-OSX #add custom hidpi resolution
https://github.com/Eun/DisableMonitor #disable monitor by click

https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12
#disable turbo-boost for longest battery work and low noise fan
https://s3.amazonaws.com/turbo-boost-switcher/Turbo+Boost+Switcher_2.8.0.zip
https://github.com/rugarciap/Turbo-Boost-Switcher/issues/4#issuecomment-398014403
#driver for favorite audio-card
https://github.com/Wouter1/EMU-driver/releases #Creative EMU 0202 follow instuctions for version MACos https://github.com/Wouter1/EMU-driver/blob/master/Install.md
https://www.readpixel.com/downloads/files/WakeOnLan1.0.zip

#web-server
brew install nginx
brew tap shivammathur/php
#brew install php@7.2
#brew install php@7.4
brew install shivammathur/php/php@7.1
brew install shivammathur/php/php@7.2
brew install shivammathur/php/php@7.3
brew install shivammathur/php/php@7.4
brew tap shivammathur/extensions
brew install imagick@7.4
#port install imagemagick  -- work .webp
#sudo pecl install imagick  -- work .webp
brew install composer
#mkdir /usr/local/var/run/php/
#sudo nano /etc/synthetic.conf
#jail    /Users/alex/jail
mkdir /Users/alex/jail
echo 'jail    /Users/alex/jail' | sudo tee /etc/synthetic.conf

#https://github.com/phpredis/phpredis/issues/1341#issuecomment-402798590
#https://github.com/Homebrew/homebrew-core/issues/26408#issuecomment-381417328
#brew install imagemagick
#brew install pkg-config
#pecl install imagick
#rm /usr/local/lib/php/pecl
#ln -s /usr/local/Cellar/php@7.1/7.1.27/pecl /usr/local/lib/php/pecl
php -v
sudo brew services restart php@7.2

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
https://www.dirk-froehling.de/resources/Software/Hosts-App-1.4.5.zip
https://www.dirk-froehling.de/downloads/downloads.html

#ansible
brew install python
sudo mount -uw /
which python
sudo unlink /usr/bin/python
sudo ln -s /usr/local/Cellar/python@3.8/3.8.5/bin/python3 /usr/bin/python
python -V
#Python 3.8.5
curl https://bootstrap.pypa.io/get-pip.py > get-pip.py
python get-pip.py
#sudo pip install ansible==2.1.1
pip install ansible
pip install passlib
pip install mysqlclient
pip install google_images_download
python3 -m pip install PyMySQL
python3 -m pip install passlib

#gulp
npm install --global gulp-cli
#npm install --global coffee-script
brew install bower
#bower install foundation-sites-6.6.3=foundation-sites#6.6.3  ----install version of package to specific folder
#Yarn and Parcel need
npm install ttf2woff2 -g #ttf2woff2 converter: cat FuturaDemiC.ttf | ttf2woff2 >> FuturaDemiC.woff2

#clean unneeded dependencies
brew bundle dump
brew bundle --force cleanup

#repo that need chouse version
brew install node

#repo that need root pass
#brew install --cask xquartz
brew install --cask teamviewer
brew install --cask zoomus
brew install --cask maccy
#brew install --cask dash #for read docs for Zurb Foundation 6.2.4
#brew install --cask virtualbox;

#repo not in brew
https://inkscape.org/release/inkscape-1.0/
https://github.com/stefansl/image-shrinker/releases #optimize images jpg svg gif
#brew install --cask adobe-air
#http://toki-woki.net/p/Shrink-O-Matic/ #rotate image by EXIF info
brew install exiftran
find . -type f -name "*.jpg" -exec exiftran -ai "{}" \;

#create jail folder at root in Catalina+
echo -e 'jail\tSystem/Volumes/Data/jail' | sudo tee -a /etc/synthetic.conf

#if process WindowServer hate more cpu (catalina 10.15 +)
launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaanalysisd.plist

#drivers
#wacom cte-440 - download "v5.3.0-3 for Graphire 4 tablets" from
#https://github.com/thenickdude/wacom-driver-fix/releases

#Color picker
#brew install --cask colorpicker-hex
brew install --cask colorpicker-antetype
http://download.panic.com/picker/
http://wafflesoftware.net/hexpicker/
https://superuser.com/questions/372855/an-application-to-easily-pick-a-color-in-mac-os-x-and-get-the-hex-value
