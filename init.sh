#~/Library/Preferences/com.apple.Terminal.plist history terminal.app by menu click "new command"
#~/Library/Containers/com.coteditor.CotEditor/Data/Library/Preferences/com.coteditor.CotEditor.plist history "find & replace" CotEditor.app

#create .plist that run script after reboot with sudo
#https://github.com/rugarciap/Turbo-Boost-Switcher/issues/4#issuecomment-398014403

#This command stopped mediaanalysisd.
#launchctl unload -w /System/Library/LaunchAgents/com.apple.photoanalysisd.plist && launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaanalysisd.plist


#spotlight off (when replace text in many files)
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
#or
sudo mdutil -a -i off
#spotlight on
sudo launchctl load -wF /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
sudo mdutil -a -i on

#spotlight show what files indexing now
sudo opensnoop -n mdworker
#add spotlight disable indexing
/Library/
/System/Library/
~/Library/
~/Downloads/
~/work/node_modules/
~/Parallels/
~/Pictures/
#in one line fish:
for dir in ~/Library/ ~/work/node_modules/ ~/Pictures/ ~/Parallels/ ~/Downloads/; mkdir -p "$dir"; touch "$dir/.metadata_never_index"; end
#bash: 
for dir in {~/Library/,~/work/node_modules/,~/Pictures/,~/Parallels/,~/Downloads/}; do mkdir -p "$dir" && touch "$dir/.metadata_never_index"; done

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
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine onyx
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
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine cd-to

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
nvm use v10; gulp
nvm use v10
gulp

brew install mc
brew install htop
brew install stress-ng # stress test cpu : 
#stress-ng --matrix 0

brew tap caskroom/cask
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine aldente #80% charge battery for long it life

#https://github.com/vrunkel/F3XSwift/releases/download/v1.0.3/F3XSwift.app.zip gui f3 microsd test
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine find-any-file
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine disk-inventory-x #show large filess, easy clear space
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine omnidisksweeper #show large filess, easy clear space 2
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine hwsensors
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine magicprefs #magic mouse
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine licecap #screen2gif recorder -< in new catalina mac os may be not need
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine the-unarchiver
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine keka
HOMEBREW_NO_AUTO_UPDATE=1 brew install --force --cask --no-quarantine google-chrome
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine tor-browser
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine monitorcontrol #brightness contrast monitor control
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine lumen #brightness auto control
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine diffmerge #file difference tools
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine waterfox-classic
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine eloston-chromium #chrome without google service
#https://chrome.google.com/webstore/detail/dump-dom/nipefhlejmpdmpmemlhjcoakmomemkkd #chrome workspace save html dom
#https://stackoverflow.com/questions/49406359/chrome-devtools-save-changes-made-in-the-elements-tab-to-your-workspace
#https://stackoverflow.com/questions/28151446/chrome-dev-tools-export-elements-html/66978187#66978187

#https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
#https://greasyfork.org/en/scripts/19993-ru-adlist-js-fixes

#brew tap homebrew/cask-versions
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine clipy #clipboard history paste copy
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine firefox@developer-edition
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine firefox@nightly
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine firefox
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine firefox@esr #Extended Support Release - за место обычного можно ставить
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine firefox@beta # - тоже за место обычного ставится, хрень
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine telegram
open -n -a /Applications/Telegram.app #open new windows of telegramm
https://superuser.com/a/1850276 # - open 2 whatsapp accaunt
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine rambox #whatsapp telegramm multiaccaunt app
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine whatsapp #not work - need use: mas lucky
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine viber
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine WordService
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine background-music #volume control by app and record audio by quick time from source
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine proxy-audio-device #volume control on all usb audio card
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine libreoffice #for read large >2mb xls files
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine bbedit      #for large files edit
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine bbedit
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine coteditor
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine bbedit
#https://gist.github.com/isao/8983629 #BBEdit Codeless Language Module for Nginx Configuration files
#copy to /Users/USERNAME/Library/Application Support/BBEdit/Language Modules/
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine qbittorrent
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine vlc
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine soda-player
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine qlvideo #preview on finder for h.265 and over video files
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine vscodium #bbedit instead
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine visual-studio-code
#https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine karabiner-elements
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine skype
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine sequel-pro #mysql client macos
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine sequel-ace #mysql client macos
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine dbeaver-community #mysql client macos new!! not checked
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine hex-fiend
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine cyberduck
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine cyberduck@6.6.1 - don't respond @buy me!
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine gimp
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine handbrake #video converter
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine fontforge #fonts editor
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine file-juicer #Extract images from PDF, PowerPoint, Word, Excel and other Files
#https://www.macports.org/install.php
# sudo port install inkscape
# HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine xquartz #need enter sudo pass!
# HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine inkscape
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine calibre #kindle epub fb3 uploader/converter
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine fbreader #fb2 reader
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine iterm2
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine thunderbird
#https://addons.thunderbird.net/en-US/thunderbird/addon/thunderhtmledit/
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine seamonkey --language=en-US #wysiwyg html editor macos
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine plistedit-pro
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine apppolice
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine amorphousdiskmark #ssd perfomance check
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine coconutbattery
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine adium
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine controlplane
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine openmtp #android file transfer
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine librecad #autocad free alternative
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine switchresx #custom herz on monitor
HOMEBREW_NO_AUTO_UPDATE=1 brew install spoofdpi #Simple and fast anti-censorship tool written in Go youtube rutracker unblock
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine audacity

#LEGO bricks editor
https://www.leocad.org/download.html # .ldr

#.spoofdpi/bin/spoofdpi -system-proxy=false
##https://www.fosshub.com/Audacity.html/audacity-macos-2.3.1.dmg
###!!!!HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine clean-me - break system!
#brew install wine  $El capitan
brew tap gcenx/wine
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine --no-quarantine wine-crossover
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
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine motrix #perfect download manager
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine spotify
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine docker

#sudo nano /etc/ssh/ssh_config
#Host *
#    ServerAliveInterval 120
#for 4g lte ssh norm connection

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
mas lucky wireguard
mas install easyres #set custom hdpi resolution
mas lucky telephone #https://apps.apple.com/ru/app/telephone/id406825478?l=en-GB&mt=12  #nice sip client
mas lucky "Microsoft Remote Desktop"
mas lucky "whatsapp messenger"

#https://apps.apple.com/us/app/bandwidth/id490461369 #mac bandwidth monitor menu bar
#https://apps.apple.com/app/id1611378436 # always paste match style
#https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12 clipboard history paste copy

###HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine avibrazil-rdm #Utility to set a Retina display to custom resolutions
https://github.com/usr-sse2/RDM
bash -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)" #add retina resolution hidpi to any monitor
https://github.com/syscl/Enable-HiDPI-OSX #add custom hidpi resolution
###https://github.com/Eun/DisableMonitor #disable monitor by click
https://github.com/epalzeolithe/DisableMonitor-3.0 #disable monitor by click

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
sudo chown -vhR $USER:admin /usr/local/var/run/nginx && nginx -s reopen ## [crit] 648#0: *62 open() "/usr/local/var/run/nginx/client_body_temp/0000000003" failed (13: Permission denied),
brew tap shivammathur/php
#brew install php@7.2
#brew install php@7.4
HOMEBREW_NO_AUTO_UPDATE=1 brew install shivammathur/php/php@7.1
HOMEBREW_NO_AUTO_UPDATE=1 brew install shivammathur/php/php@7.2
HOMEBREW_NO_AUTO_UPDATE=1 brew install shivammathur/php/php@7.3
HOMEBREW_NO_AUTO_UPDATE=1 brew install shivammathur/php/php@7.4
HOMEBREW_NO_AUTO_UPDATE=1 brew install shivammathur/php/php@8.2
HOMEBREW_NO_AUTO_UPDATE=1 brew tap shivammathur/extensions
HOMEBREW_NO_AUTO_UPDATE=1 brew install imagick@7.4
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
brew services start nginx
brew services start php@7.1
brew link php@7.1 --force
brew services list
https://github.com/downloads/specialunderwear/Hosts.prefpane/Hosts-1.3.pkg
https://www.dirk-froehling.de/resources/Software/Hosts-App-1.4.5.zip
https://www.dirk-froehling.de/downloads/downloads.html

#ansible moterey
#pip3 install ansible
pip3 install ansible --break-system-packages
pip3 install pymysql --break-system-packages
pip3 install 'jinja2>=3.0.0,<3.0.2'
#pip3 freeze #see installed packages python3

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
#before start bower use command: (if have error dyld[4482]: Library not loaded: /usr/local/opt/icu4c/lib/libicuuc.73.dylib)
nvm use v10
#bower install foundation-sites-6.6.3=foundation-sites#6.6.3  ----install version of package to specific folder
#bower install https://github.com/flatpickr/flatpickr.git --- install driectly from github repo
#Yarn and Parcel need
npm install ttf2woff2 -g #ttf2woff2 converter: cat FuturaDemiC.ttf | ttf2woff2 >> FuturaDemiC.woff2

#clean unneeded dependencies
brew bundle dump
brew bundle --force cleanup

#repo that need chouse version
brew install node

#repo that need root pass
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine xquartz
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine teamviewer
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine zoomus
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine maccy #clipboard history paste copy
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine bluesnooze #off bluetouch on lid close - on sleep
brew install sleepwatcher # script .sleep .wakeup https://www.kodiakskorner.com/log/258
brew install blueutil #bluetouch off/on disconnect/connect from cmd
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine shifty #night shift switcher control
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine dash #for read docs for Zurb Foundation 6.2.4
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine virtualbox;
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine gyroflow #gopro stabilizer
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine sigil #epub mac editor
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine radiola #online radio player
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine bluestacks #android emulator
https://github.com/abbasnaqdi/nekoray-macos/releases #VLESS VPN
#~/Library/Preferences/nekoray/config/groups/nekoray.json nekoray config file

#repo not in brew
https://inkscape.org/release/inkscape-1.0/
https://github.com/stefansl/image-shrinker/releases #optimize images jpg svg gif
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine adobe-air
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
#HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine colorpicker-hex
HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --no-quarantine colorpicker-antetype
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


#appletv
https://github.com/bsharper/atv-desktop-remote #remote control appletv (pause/play)

#dpi work norm socket 5 1080
git clone https://github.com/hufrea/byedpi.git
cd byedpi
run make
run ./ciadpi --oob 2
setup socks 5 proxy firefox

#previos version of imove
https://support.apple.com/kb/index?page=search&src=support_docs_serp&locale=en_US&doctype=DOCUMENTATIONS&q=iMovie
https://support.apple.com/en-us/docs
