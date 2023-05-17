# Defer compinit until done changing fpath
skip_global_compinit=1

# Set "sane" soft limit for file descriptors
ulimit -n 1024

################################################################################
#                         XDG Base Directory Spec values                       #
################################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

################################################################################
#                            PATH/MANPATH Precedence                           #
################################################################################
#                                                                              #
# 1. ~/.local/bin (highest)                                                    #
# 2. ~/bin                                                                     #
# 3. misc                                                                      #
# 4. (yarn|npm|go|rust|etc)                                                    #
# 5. nix                                                                       #
# 6. macports
# 7. snap                                                                      #
# 8. local (lowest)                                                            #
#                                                                              #
################################################################################

# local
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/share/man:/usr/share/man"

# Snap
export PATH="/snap/bin:${PATH}"

# Macports
export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
export MANPATH="/opt/local/share/man:${MANPATH}"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/local/lib"

# Nix
export PATH="$HOME/.nix-profile/bin:$PATH"

##############
# begin misc #
##############

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
export N_USE_XZ=true

# Java
if type /usr/libexec/java_home &> /dev/null; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
elif type /Library/Java/JavaVirtualMachines/openjdk15/Contents/Home &> /dev/null; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk15/Contents/Home
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

# dotnet
if type /usr/local/share/dotnet/dotnet &> /dev/null; then
  export  DOTNET_HOME="/usr/local/share/dotnet"
fi

# mono
if type /Library/Frameworks/Mono.framework/Versions/Current/bin/mono &> /dev/null; then
  export MONO_HOME="/Library/Frameworks/Mono.framework/Versions/Current"
fi

if [[ -d "$MONO_HOME" ]]; then
  export PATH="$MONO_HOME/bin:$PATH"
fi

############
# end misc #
############

# ~/bin
export PATH="$HOME/bin:$PATH"

# ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

################################################################################
#                              Editor Configuration                            #
################################################################################
if command -v 'nvim' > /dev/null 2>&1; then
  export EDITOR='nvim'
elif command -v 'vim' > /dev/null 2>&1; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

################################################################################
#                                 zsh variables                                #
################################################################################

# Set ZDOTDIR following all resolved symlinks
SOURCE="${(%):-%N}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE" )" >/dev/null && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done

export ZDOTDIR="$(cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd)"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

## History command configuration
export HISTFILE="$XDG_DATA_HOME/zsh/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000


################################################################################
#                                 zinit variables                              #
################################################################################

export ZINIT_HOME="${XDG_CONFIG_HOME}/zsh/plugins/zinit"

typeset -gAH ZINIT;
ZINIT[BIN_DIR]="${XDG_CONFIG_HOME}/zsh/plugins/zinit"
ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZINIT[HOME_DIR]}/zcompdump"
ZINIT[COMPINIT_OPTS]="-C"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1
export ZPFX="${ZINIT[HOME_DIR]}/polaris"

# zinit prefix for compiled programs
export ZPFX="${HOME}/.zinit/polaris"

################################################################################
#                                misc. variables                               #
################################################################################
export GIT_DOTFILES="$(dirname $(dirname "$ZDOTDIR"))"

# Ensure default kubernetes config is set
[[ -z "$KUBECONFIG" ]] && export KUBECONFIG="$HOME/.kube/config"

# Add each k3s configuration to KUBECONFIG
K3S_KUBECONFIGS=$(find "$HOME/.k3s" -type f \( -iname '*.yml' -o -iname '*.yaml' \))
while read -r K3S_KUBECONFIG; do
  [[ ":$KUBECONFIG:" != *":$K3S_KUBECONFIG:"* ]] && export KUBECONFIG="$KUBECONFIG:$K3S_KUBECONFIG"
done <<< "$K3S_KUBECONFIGS"

[[ -d "${XDG_CONFIG_HOME}/tmux" ]] && export TMUX_CONF="$XDG_CONFIG_HOME/tmux"

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.work/env" ]] && source "$HOME/.work/env"
