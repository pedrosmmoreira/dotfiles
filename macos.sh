#!/bin/bash
# macOS sensible defaults for development
# Run once on a fresh machine, then restart.

echo "==> Applying macOS defaults..."

# ----------------------------------------
# Keyboard
# ----------------------------------------
# Fastest key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
# Shortest delay before repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable press-and-hold for accents (enables key repeat everywhere)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Full keyboard access in all dialogs (tab through buttons)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# ----------------------------------------
# Trackpad
# ----------------------------------------
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# ----------------------------------------
# Dock
# ----------------------------------------
# Autohide
defaults write com.apple.dock autohide -bool true
# No delay before showing
defaults write com.apple.dock autohide-delay -float 0
# Faster hide/show animation
defaults write com.apple.dock autohide-time-modifier -float 0.3
# Minimise with scale effect (faster than genie)
defaults write com.apple.dock mineffect -string "scale"
# Don't show recent apps
defaults write com.apple.dock show-recents -bool false
# Smaller icon size
defaults write com.apple.dock tilesize -int 48

# ----------------------------------------
# Finder
# ----------------------------------------
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Disable warning when emptying trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# ----------------------------------------
# Screenshots
# ----------------------------------------
# Save to ~/Screenshots instead of Desktop
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
# Save as PNG
defaults write com.apple.screencapture type -string "png"
# Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# ----------------------------------------
# Text & autocorrect
# ----------------------------------------
# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalisation
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable period on double space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ----------------------------------------
# Misc
# ----------------------------------------
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Disable the "Are you sure you want to open this app?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ----------------------------------------
# Restart affected apps
# ----------------------------------------
echo "==> Restarting affected apps..."
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "$app" &>/dev/null || true
done

echo ""
echo "==> Done! Some changes need a logout/restart to take effect."
echo "    (Keyboard repeat settings in particular.)"
