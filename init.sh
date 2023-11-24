#~/Library/Preferences/com.apple.Terminal.plist history terminal.app by menu click "new command"
#~/Library/Containers/com.coteditor.CotEditor/Data/Library/Preferences/com.coteditor.CotEditor.plist history "find & replace" CotEditor.app

#This command stopped mediaanalysisd.
#launchctl unload -w /System/Library/LaunchAgents/com.apple.photoanalysisd.plist && launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaanalysisd.plist

#https://apps.apple.com/us/app/bandwidth/id490461369 #mac bandwidth monitor menu bar
#https://apps.apple.com/ru/app/telephone/id406825478?l=en-GB&mt=12  #nice sip client
#https://apps.apple.com/app/id1611378436 # always paste match style
#https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12 clipboard history paste copy

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
brew install --cask --no-quarantine onyx
#upnp manager
https://github.com/kaklakariada/portmapper
brew install openjdk@11
brew link openjdk@11
java -jar portmapper.jar
#https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot
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

#install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

#https://github.com/jbtule/cdto #open terminal to current folder
brew install --cask --no-quarantine cd-to

#brew install bash
#/usr/local/opt/bash/bin/bash
#sudo bash -c 'echo /usr/local/opt/bash/bin/bash >> /etc/shells'
#chsh -s /usr/local/opt/bash/bin/bash
#sudo chsh -s /usr/local/opt/bash/bin/bash
brew install fish
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish
set -U fish_user_paths /usr/local/bin $fish_user_paths

# node@10 by nvm in fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
nvm list
nvm install v10
nvm use v10
gulp

#run fulp:
nvm use v10
gulp

brew install mc
brew install htop

brew tap caskroom/cask
brew install --cask --no-quarantine aldente #80% charge battery for long it life
brew install --cask --no-quarantine find-any-file
brew install --cask --no-quarantine disk-inventory-x #show large filess, easy clear space
brew install --cask --no-quarantine omnidisksweeper #show large filess, easy clear space 2
brew install --cask --no-quarantine hwsensors
#brew install --cask --no-quarantine magicprefs #magic mouse
#brew install --cask --no-quarantine licecap #screen2gif recorder -< in new catalina mac os may be not need
#brew install --cask --no-quarantine the-unarchiver
brew install --cask --no-quarantine keka
#brew install --cask --no-quarantine google-chrome
brew install --cask --no-quarantine tor-browser
brew install --cask --no-quarantine monitorcontrol #brightness contrast monitor control
brew install --cask --no-quarantine diffmerge #file difference tools
#brew install --cask --no-quarantine waterfox-classic
brew install --cask --no-quarantine eloston-chromium #chrome without google service
#https://chrome.google.com/webstore/detail/dump-dom/nipefhlejmpdmpmemlhjcoakmomemkkd #chrome workspace save html dom
#https://stackoverflow.com/questions/49406359/chrome-devtools-save-changes-made-in-the-elements-tab-to-your-workspace
#https://stackoverflow.com/questions/28151446/chrome-dev-tools-export-elements-html/66978187#66978187

#https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
#https://greasyfork.org/en/scripts/19993-ru-adlist-js-fixes
brew install --cask --no-quarantine firefox
brew tap homebrew/cask-versions
brew install --cask --no-quarantine firefox-developer-edition
brew install --cask --no-quarantine firefox-nightly
brew install --cask --no-quarantine telegram
brew install --cask --no-quarantine whatsapp
brew install --cask --no-quarantine viber
brew install --cask --no-quarantine WordService
brew install --cask --no-quarantine background-music #volume control by app and record audio by quick time from source
brew install --cask --no-quarantine libreoffice #for read large >2mb xls files
#brew install --cask --no-quarantine bbedit      #for large files edit
brew install --cask --no-quarantine bbedit
brew install --cask --no-quarantine coteditor
#brew install --cask --no-quarantine bbedit
#https://gist.github.com/isao/8983629 #BBEdit Codeless Language Module for Nginx Configuration files
#copy to /Users/USERNAME/Library/Application Support/BBEdit/Language Modules/
brew install --cask --no-quarantine qbittorrent
brew install --cask --no-quarantine vlc
#brew install --cask --no-quarantine soda-player
#brew install --cask --no-quarantine qlvideo #preview on finder for h.265 and over video files
#brew install --cask --no-quarantine vscodium #bbedit instead
#brew install --cask --no-quarantine visual-studio-code
#https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
#brew install --cask --no-quarantine karabiner-elements
brew install --cask --no-quarantine skype
#brew install --cask --no-quarantine sequel-pro #mysql client macos
brew install --cask --no-quarantine sequel-ace #mysql client macos
brew install --cask --no-quarantine hex-fiend
brew install --cask --no-quarantine cyberduck
#brew install --cask --no-quarantine cyberduck@6.6.1 - don't respond @buy me!
brew install --cask --no-quarantine gimp
brew install --cask --no-quarantine handbrake #video converter
brew install --cask --no-quarantine fontforge #fonts editor
#brew install --cask --no-quarantine file-juicer #Extract images from PDF, PowerPoint, Word, Excel and other Files
#https://www.macports.org/install.php
# sudo port install inkscape
# brew install --cask --no-quarantine xquartz #need enter sudo pass!
# brew install --cask --no-quarantine inkscape
brew install --cask --no-quarantine calibre
brew install --cask --no-quarantine fbreader #fb2 reader
brew install --cask --no-quarantine iterm2
brew install --cask --no-quarantine thunderbird
#https://addons.thunderbird.net/en-US/thunderbird/addon/thunderhtmledit/
brew install --cask --no-quarantine seamonkey --language=en-US
brew install --cask --no-quarantine plistedit-pro
#brew install --cask --no-quarantine apppolice
brew install --cask --no-quarantine amorphousdiskmark #ssd perfomance check
brew install --cask --no-quarantine coconutbattery
brew install --cask --no-quarantine adium
brew install --cask --no-quarantine controlplane
brew install --cask --no-quarantine openmtp #android file transfer
#https://www.fosshub.com/Audacity.html/audacity-macos-2.3.1.dmg
###!!!!brew install --cask --no-quarantine clean-me - break system!
#brew install wine  $El capitan
brew tap gcenx/wine
brew install --cask --no-quarantine --no-quarantine wine-crossover
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
brew install --cask --no-quarantine motrix #perfect download manager
brew install --cask --no-quarantine spotify

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
mas lucky pages
mas lucky numbers
mas install easyres #set custom hdpi resolution
###brew install --cask --no-quarantine avibrazil-rdm #Utility to set a Retina display to custom resolutions
bash -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)" #add retina resolution hidpi to any monitor
https://github.com/syscl/Enable-HiDPI-OSX #add custom hidpi resolution
https://github.com/Eun/DisableMonitor #disable monitor by click

https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12
#disable turbo-boost for longest battery work and low noise fan
https://s3.amazonaws.com/turbo-boost-switcher/Turbo+Boost+Switcher_2.8.0.zip
https://github.com/rugarciap/Turbo-Boost-Switcher/issues/4#issuecomment-398014403
#driver for favorite audio-card
https://github.com/Wouter1/EMU-driver/releases #Creative EMU 0202 follow instuctions for version MACos https://github.com/Wouter1/EMU-driver/blob/master/Install.md
#https://www.readpixel.com/downloads/files/WakeOnLan1.0.zip
#http://web.archive.org/web/20210205171405if_/http://www.readpixel.com/downloads/files/WakeOnLan1.0.zip
brew install wakeonlan
wakeonlan 5C:9A:D8:63:72:CD

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
echo 'jail	/Users/alex/jail' | sudo tee /etc/synthetic.conf

#https://github.com/phpredis/phpredis/issues/1341#issuecomment-402798590
#https://github.com/Homebrew/homebrew-core/issues/26408#issuecomment-381417328
#brew install imagemagick
#brew install pkg-config
#pecl install imagick
#rm /usr/local/lib/php/pecl
#ln -s /usr/local/Cellar/php@7.1/7.1.27/pecl /usr/local/lib/php/pecl
php -v
brew services restart php@7.2

#brew install percona-server
brew install mysql@5.7
brew link mysql@5.7 --force
mysqld --initialize
mysqld_safe --skip-grant-tables #start mysql with ok for login root without password
#on another terminal
mysql -u root -p
mysql> flush privileges;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'password_here';
mysql> flush privileges;
mysql> quit
pkill mysqld
brew services start mysql@5.7

##/usr/local/etc/my.cnf
#[mysqld]
# Only allow connections from localhost
#bind-address = 127.0.0.1
#validate_password_special_char_count=0 ## <----

#brew services start mysql@5.7
#mysql_secure_installation
#mysql -u root -p
#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';
#mysql -uUSER -p -e 'SHOW VARIABLES WHERE Variable_Name LIKE "%dir"' show place databases
#mysql.server start
#mysqld stop
#brew services start percona-server
#mysql_secure_installation
sudo brew services start nginx
sudo brew services start php@7.1
brew link php@7.1 --force
brew services list
https://github.com/downloads/specialunderwear/Hosts.prefpane/Hosts-1.3.pkg
https://www.dirk-froehling.de/resources/Software/Hosts-App-1.4.5.zip
https://www.dirk-froehling.de/downloads/downloads.html

#ansible moterey
pip3 install ansible
pip3 install 'jinja2>=3.0.0,<3.0.2'

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
#brew install --cask --no-quarantine xquartz
brew install --cask --no-quarantine teamviewer
brew install --cask --no-quarantine zoomus
brew install --cask --no-quarantine maccy
#brew install --cask --no-quarantine bluesnooze #off bluetouch on lid close - on sleep
brew install sleepwatcher # script .sleep .wakeup https://www.kodiakskorner.com/log/258
brew install blueutil #bluetouch off/on disconnect/connect from cmd
brew install --cask --no-quarantine shifty #night shift switcher control
#brew install --cask --no-quarantine dash #for read docs for Zurb Foundation 6.2.4
#brew install --cask --no-quarantine virtualbox;
brew install --cask --no-quarantine rambox #whatsapp telegramm multiaccaunt app
brew install --cask --no-quarantine gyroflow #gopro stabilizer
brew install --cask --no-quarantine sigil #epub mac editor
brew install --cask --no-quarantine radiola #online radio player

#repo not in brew
https://inkscape.org/release/inkscape-1.0/
https://github.com/stefansl/image-shrinker/releases #optimize images jpg svg gif
#brew install --cask --no-quarantine adobe-air
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
#brew install --cask --no-quarantine colorpicker-hex
brew install --cask --no-quarantine colorpicker-antetype
http://download.panic.com/picker/
http://wafflesoftware.net/hexpicker/
https://superuser.com/questions/372855/an-application-to-easily-pick-a-color-in-mac-os-x-and-get-the-hex-value

#hilink app ventura
https://github.com/pwnpsasin/catalina_e3372

#android remote control if screen cracked
HOMEBREW_NO_AUTO_UPDATE=1 brew install scrcpy
brew install android-platform-tools
scrcpy --no-audio --turn-screen-off --lock-video-orientation=0 --display-buffer=10 --video-bit-rate=1M --print-fps --hid-mouse --hid-keyboard
scrcpy --no-audio --turn-screen-off --lock-video-orientation=0 --display-buffer=1 --hid-mouse --hid-keyboard #лучше вариант
