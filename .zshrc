# Path to dotfiles
export DOTFILES=$HOME/Library/Mobile\ Documents/com\~apple~CloudDocs/dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

ZSH_CUSTOM=$DOTFILES

plugins=(git git-flow-avh npm docker aws gcloud)

source $ZSH/oh-my-zsh.sh

# Configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

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
  eval "$(pyenv init -)"
fi
