#! /bin/zsh
# the official probablyhades setup script certified 100% real
set -e  # Exit on error

# **Install Homebrew**
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed"
fi

# **Install Formulae Dependencies**
echo "Installing dependencies..."
brew install --cask android-platform-tools

# **Install Formulae**
echo "Installing Formulae..."
brew install ffmpeg
brew install htop
brew install imagemagick
brew install neofetch
brew install macchina
brew install scrcpy
brew install yt-dlp
brew install mas
brew install wget

# **Install Casks**
echo "Installing Casks..."
brew install --cask raycast
brew install --cask 1password
brew install --cask ableton-live-lite
brew install --cask adobe-dng-converter
brew install --cask altserver
brew install --cask audacity
brew install --cask balenaetcher
brew install --cask bartender
brew install --cask betterdisplay
brew install --cask chatgpt
brew install --cask cleanshot
brew install --cask coconutbattery
brew install --cask ente-auth
brew install --cask google-chrome
brew install --cask handbrake
brew install --cask iina
brew install --cask imageoptim
brew install --cask karabiner-elements
brew install --cask keka
brew install --cask latest
brew install --cask mos
brew install --cask one-switch
brew install --cask openmtp
brew install --cask transmission
brew install --cask rectangle
brew install --cask sdformatter
brew install --cask signal
brew install --cask stats
brew install --cask warp
brew install --cask windscribe
brew install --cask zed
brew install --cask zen-browser

# **Install App Store Apps**
echo "Installing App Store apps..."
mas install 639968404 # Parcel
mas install 899247664 # TestFlight
mas install 1627843786 # Captionator
mas install 1440147259 # AdGuard
mas install 1355679052 # Dropover
mas install 6504193234 # PolyCapture
mas install 1502505482 # Splitter
mas install 1289197285 # MindNode
mas install 1487937127 # Craft
mas install 6714467650 # Perplexity
mas install 1569813296 # 1Password for Safari
mas install 1278508951 # Trello
mas install 1573461917 # SponsorBlock
mas install 1289583905 # Pixelmator Pro
mas install 516538625 # Disk Decipher
mas install 1475387142 # Tailscale
mas install 966085870 # TickTick

# **Install web apps**
echo "Downloading apps from web..."
echo "These apps will need to be installed manually."
mkdir -p ~/Downloads/macSetup || { echo "Failed to create setup directory"; exit 1; }
wget -P ~/Downloads/macSetup "https://replay-sleeve-distribution.s3.amazonaws.com/latest/Sleeve.dmg" # Sleeve
wget -P ~/Downloads/macSetup "https://dl.paragon-software.com/demo/ntfsmac17_trial.dmg" # Paragon NTFS
wget -q -O - https://api.github.com/repos/stemrollerapp/stemroller/releases/latest | awk -F': ' '/browser_download_url/ && /-mac\.zip/ {gsub(/"/, "", $(NF)); system("wget -P ~/Downloads/macSetup " $(NF))}' # StemRoller

# Copy config files
echo "Copying config files..."
mkdir -p ~/.config && cp .config ~/.config

# Finalising setup
open -a "Zen Browser" --new --args -silent -nosplash -setDefaultBrowser # set Zen as default browser
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=dev.zed.Zed;}' # set Zed as default editor

# Can't be installed prompt
echo "You'll need to install the following manually:"
echo "From App Store:"
echo "- Authy"
echo "- Musicboard"
echo "- Real"
echo "Reason: Mobile apps"
mas open

# Final steps
macchina # Display system fetch
cat final.txt
