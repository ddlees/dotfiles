# Ensure at least zinit submodule has been pulled
if ! [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zinit/zinit.zsh" ]]; then
  command git -C "$GIT_DOTFILES" submodule update --init --recursive --jobs 8
fi

# Enable Powerlevel10k instant prompt. Should stay near the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zinit/zinit.zsh"

zinit wait lucid for \
  atload'_zsh_autosuggest_start' \
      zsh-users/zsh-autosuggestions \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
      zinit light zsh-users/zsh-completions \
  atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    trapd00r/LS_COLORS

zinit atload'!source ${XDG_CONFIG_HOME:-$HOME/.config}/p10k/.p10k.zsh' lucid nocd for \
    romkatv/powerlevel10k

autoload -U colors && colors

unalias run-help
autoload run-help

# Utility functions
bin_exists() {
  type "$1" > /dev/null
}

path_exists() {
  [[ -d "$1" || -f "$1" ]]
}

# Setup development source paths
if ! path_exists "$HOME/dev"; then
  mkdir -p "$HOME/dev/src/github.com"
  mkdir -p "$HOME/dev/src/github.ibm.com"
fi

# Setup nix package manager
# if ! bin_exists "nix-env"; then
#   sh <(curl https://nixos.org/nix/install) --no-daemon
# fi

# source ${ZDOTDIR}/settings/gnu/coreutils.zsh
# source ${ZDOTDIR}/settings/mac/homebrew.zsh
# source ${ZDOTDIR}/settings/gnu/tar.zsh
# source ${ZDOTDIR}/settings/manpath.zsh

# Mac OS setup
if [[ "$(uname 2> /dev/null)" == "Darwin" ]]; then

  # Setup standard GNU utils
  OPT="/usr/local/opt"
  GNU_BIN="/libexec/gnubin"
  GNU_MAN="/libexec/gnuman"

  FIND_UTILS="$OPT/findutils"
  # ! path_exists $FIND_UTILS &&
  #   echo -n "$fg_bold[blue]Installing GNU findutils... \033[s" &&
  #   (brew install findutils) &> /dev/null &&
  #   echo "\033[u$fg_bold[green]Done!$reset_color"

  export PATH=$FIND_UTILS$GNU_BIN:$PATH
fi


# Setup tmux
# TMUX_SRC="$HOME/dev/src/github.com/tmux/tmux"
# ! bin_exists "tmux" &&
#   echo -n "$fg_bold[blue]Installing tmux... \033[s" &&
#   (mkdir -p "$TMUX_SRC" &&
#   git clone --branch '3.0a' --single-branch https://github.com/tmux/tmux.git "$TMUX_SRC" &&
#   cd "$TMUX_SRC" &&
#   sh autogen.sh &&
#   ./configure &&
#   make &&
#   mv tmux /usr/local/bin/tmux &&
#   cd "$HOME") &> /dev/null &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"

TMUX_CONF=$HOME/.tmux
# ! path_exists $TMUX_CONF &&
#   cd $ZDOTDIR &&
#   git submodule update --remote --merge &&
#   cd $HOME &&
#   ln -s $ZDOTDIR/.tmux &&
#   ln -s $ZDOTDIR/.tmux.conf

# Setup pyenv
# ! path_exists "$HOME/.pyenv/bin/pyenv" &&
#   echo -n "$fg_bold[blue]Installing pyenv... \033[s" &&
#   (curl -s https://pyenv.run | bash 2> /dev/null) &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"

# Setup rbenvy

bin_exists "rbenv" &&
  eval "$(rbenv init -)"

# Setup g
# ! bin_exists "g" &&
#   echo -n "$fg_bold[blue]Installing g... \033[s" &&
#   (curl -sL https://raw.githubusercontent.com/ddlees/g/master/bin/g -o /usr/local/bin/g) &> /dev/null &&
#   chmod a+x /usr/local/bin/g &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"

# Setup golang
# latest_go_version="$(g list-all | tail -n 2 | sed 's/[[:space:]>]//g')"
# [[ $(g list) != *"$latest_go_version"* ]] &&
#   echo -n "$fg_bold[blue]Installing golang v$latest_go_version... \033[s" &&
#   (g install latest) &> /dev/null &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"

# ! bin_exists "bazelisk" &&
#   echo -n "$fg_bold[blue]Installing bazelisk... \033[s" &&
#   (go get github.com/bazelbuild/bazelisk) &> /dev/null &&
#   ln -s
#   echo "\033[u$fg_bold[green]Done!$reset_color"

# Setup n
# ! bin_exists "n" &&
#   echo -n "$fg_bold[blue]Installing n... \033[s" &&
#   (curl -sL https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n) &> /dev/null &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"


# Install latest Node LTS
# [[ $(n ls) != *"$(n --lts)"* ]] &&
#   echo -n "$fg_bold[blue]Installing NodeJS v$(n --lts)... \033[s" &&
#   (n -q lts &> /dev/null) &&
#   echo "\033[u$fg_bold[green]Done!$reset_color"



# If things are not where they should be...

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# ! path_exists $ZSH &&
#   cd $ZDOTDIR &&
#   git submodule update --remote --merge &&
#   ln -frs plugins/* .oh-my-zsh/custom/plugins/ &&
#   ln -frs themes/* .oh-my-zsh/custom/themes &&
#   cd $HOME &&
#   ln -s $ZDOTDIR/.oh-my-zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  emoji
  git
  kube-ps1
  kube-ps1-patch
  pyenv
  vi-mode
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration
ZSH_TMUX_AUTOSTART="true"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

###
# Zsh Autosuggestions
#
# https://github.com/zsh-users/zsh-autosuggestions
###
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold"
export ZSH_AUTOSUGGEST_USE_ASYNC='true'
# Ctrl + f: Accepts a word.
bindkey '^f' forward-word
# Ctrl + SPACE: Accepts the full suggestion.
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vim="nvim"
alias vi="nvim"
alias ll="ls -al --color=auto"
alias ls="ls --color=auto"

unalias g
bin_exists "kaf" && source <(kaf completion zsh)
bin_exists "plz" && source <(plz --completion_script)
# bin_exists "skaffold" && source <(skaffold completion zsh)

# added by travis gem
# [ -f /Users/ddleesus.ibm.com/.travis/travis.sh ] && source /Users/ddleesus.ibm.com/.travis/travis.sh


# Fuzzy Finder Configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/fzf.zsh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/fzf.zsh"
fi
if type "fzf" > /dev/null; then
  # Use tmux.
  export FZF_TMUX=1
  # Default to The Silver Searcher.
  if type "ag" > /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --color --color-path "00;22" --filename-pattern ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  elif type "rg" > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*" --glob "!node_modules/*"'
    # export FZF_DEFAULT_COMMAND='rg --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*" --glob "!node_modules/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
  # Setup default options.
  function fzf_default_options () {
    # Bat options
    bat_options=('--color always'
                 '--italic-text always'
                 '--style numbers,header,changes,grid'
                 '--paging never'
                 '--line-range :$LINES'
                 '--theme \"One Dark\"'
    )
    # Fzf preview options.
    fzf_preview_options=('"[[ $(file --mime {}) =~ binary ]]'
                         '&& echo {} is a binary file'
                         "|| (bat {} $bat_options || cat {})"
                         '2> /dev/null"'
    )
    # Fzf color options - 'one' theme.
    fzf_color_options=('--color dark'
                       '--color fg:-1'
                       '--color bg:-1'
                       '--color hl:#c678dd'
                       '--color fg+:#ffffff'
                       '--color bg+:-1'
                       '--color hl+:#d858fe'
                       '--color info:#98c379'
                       '--color border:#282c34'
                       # '--color border:-1'
                       '--color prompt:#61afef'
                       '--color pointer:#be5046'
                       '--color marker:#e5c07b'
                       '--color spinner:#61afef'
                       '--color header:#61afef'
    )
    # Vim keybinding.
    # Couldn't get this working.
    fzf_vim_bindings=('"ctrl-v:execute(vim {} < /dev/tty)"')
    # Fzf options
    fzf_options=(
      '--reverse'
      # '--inline-info'
      '--ansi'
      '--preview-window right:0%'
      "--preview $fzf_preview_options"
      # "--bind $fzf_vim_bindings"
      "$fzf_color_options"
    )
    echo -n "$fzf_options"
  }
  export FZF_DEFAULT_OPTS=$(fzf_default_options)
  export FZF_CTRL_T_OPTS='--preview-window right:70%'
  export FZF_CTRL_R_OPTS='--preview-window right:0%'
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . /Users/ddleesus.ibm.com/.nix-profile/etc/profile.d/nix.sh;
fi

##
# AWS CLI Configuration
##
if type "aws" > /dev/null; then
  function _aws () {
    local options="${@}"
    local aws_options=()
    # If `CLOUD_OBJECT_STORAGE_ENDPOINT` is defined then use it as the S3
    # endpoint.
    [ ! -z "${CLOUD_OBJECT_STORAGE_ENDPOINT}" ] \
      && aws_options+=( '--endpoint-url' "${CLOUD_OBJECT_STORAGE_ENDPOINT}")
    # Replace `cos://` with `s3://`.
    local search='cos://'
    local replace='s3://'
    options="${options/"${search}"/"${replace}"}"
    # Remove `us-south/` if it's present.
    local search='://us-south/'
    local replace='://'
    options="${options/"${search}"/"${replace}"}"
    aws_options+=( "${options}" )
    aws ${=aws_options}
  }
  alias aws="_aws"
  alias s3="aws s3"
fi

alias icat="kitty +kitten icat"

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
if [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/p10k/.p10k.zsh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/p10k/.p10k.zsh"
fi
