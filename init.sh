sudo pmset hibernatemode 0
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
brew tap caskroom/cask
brew cask install google-chrome
brew cask install firefox
brew cask install telegram
brew cask install whatsapp
brew cask install WordService
brew cask install coteditor
brew cask install qbittorrent
brew cask install visual-studio-code
brew cask install karabiner-elements
brew cask install teamviewer
brew cask install skype
brew install mc
brew cleanup 
echo 'export VISUAL=vim; export EDITOR="$VISUAL"' >> ~/.bashrc


https://github.com/rugarciap/Turbo-Boost-Switcher/issues/4#issuecomment-398014403
