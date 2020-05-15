export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CACHE_HOME="$HOME/.cache"

##
# Editor Configuration
#
# Preference order:
# nvim -> vim -> vi.
##
if type 'nvim' > /dev/null; then
  export EDITOR='nvim'
elif type 'vim' > /dev/null; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

###
# PATH/MANPATH Precedence
#
# 1. ~/.local/bin
# 2. ~/bin
# 3. misc
# 4. (yarn|npm|go|rust|etc)
# 5. nix
# 6. snap
# 7. local
###

##
# Package manager configuration
##

# local
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/share/man:/usr/share/man"

# Snap
export PATH="/snap/bin:${PATH}"

# Nix
export PATH="$HOME/.nix-profile/bin:$PATH"

##
# Misc. binary configuration
##

# pyenv
export PATH="$HOME/.pyenv/shims:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# Golang
export GOPATH="$HOME/dev"
export GOROOT="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# n - NodeJS version manager
export N_PREFIX=$HOME/.n
export PATH="$N_PREFIX/bin:$PATH"
export N_USE_XZ=true

# Java
if type /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
else
  if type /usr/bin/javac; then
    export JAVA_HOME="$(dirname $(dirname $(readlink -- /usr/bin/javac)))"
  fi
fi

if [[ -d "$JAVA_HOME" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

##
# Self managed binary configuration
##

# ~/bin
export PATH="$HOME/bin:$PATH"

# ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Set ZDOTDIR following all resolved symlinks
SOURCE="${(%):-%N}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE" )" >/dev/null && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

export ZDOTDIR="$(cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd)"

