# Path to dotfiles
export ICLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
export DOTFILES="$ICLOUD_DRIVE/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH="$ICLOUD_DRIVE/.oh-my-zsh"

ZSH_THEME="ys"

ZSH_CUSTOM=$DOTFILES/zsh

plugins=(
  macos
  git
  gh
  zsh-autosuggestions
  zsh-syntax-highlighting
  npm
  docker
  gcloud
)

source $ZSH/oh-my-zsh.sh

# Configure Hombebrew on Silicon Macs
if [ -s "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Configure Android SDK
if [ -s "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
  export PATH=$ANDROID_HOME/build-tools/$(ls $ANDROID_HOME/build-tools | sort -V | tail -n 1):$PATH
  export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
fi

# Configure Gradle
if [ -s "$HOME/.gradle" ]; then
  export GRADLE_USER_HOME=$HOME/.gradle
fi

# Configure pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# Configure ruby/gem
if command -v rbenv 1>/dev/null 2>&1; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  eval "$(rbenv init -)"
fi

# Configure 1Password CLI
if [ -s "$HOME/.config/op" ]; then
  source $HOME/.config/op/plugins.sh
fi

# Configure pqlib
if [ -s "/opt/homebrew/opt/libpq/bin" ]; then
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi

# Configure Node
if [ -s "/opt/homebrew/opt/node" ]; then
  export PATH="/opt/homebrew/opt/node/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/node/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/node/include"
fi

# Load Angular CLI autocompletion.
if command -v ng 1>/dev/null 2>&1; then
  source <(ng completion script)
fi
