# Path to dotfiles
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
export DOTFILES="$ICLOUD_DRIVE/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH="$ICLOUD_DRIVE/.oh-my-zsh"

ZSH_THEME="ys"

ZSH_CUSTOM=$DOTFILES

plugins=(git npm docker gcloud)

source $ZSH/oh-my-zsh.sh

# Configure Hombebrew on Silicon Macs
if [ -s "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Configure Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/$(ls $ANDROID_HOME/build-tools | sort -V | tail -n 1):$PATH
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

# Configure Gradle
export GRADLE_USER_HOME=$HOME/.gradle

# Configure pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# Configure ruby/gem
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

if [ -s "$HOME/.config/broot" ]; then
  source $HOME/.config/broot/launcher/bash/br
fi
