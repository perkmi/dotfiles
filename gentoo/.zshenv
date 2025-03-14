export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE="-"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export STREAMDECK_UI_CONFIG="$XDG_CONFIG_HOME/streamdeck-ui/streamdeck.json"
export WINEPREFIX="$XDG_DATA_HOME"/wine
export KDEHOME="$XDG_CONFIG_HOME"/kde
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons
export CONAN_USER_HOME="$XDG_CONFIG_HOME"
export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp

export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin

export BROWSER="brave"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
