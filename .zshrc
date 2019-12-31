autoload -U colors && colors

# Utility functions

bin_exists() {
  type "$1" > /dev/null
}

path_exists() {
  [[ -d "$1" || -f "$1" ]]
}

# Mac OS setup
if [[ "$(uname 2> /dev/null)" == "Darwin" ]]; then

  # Setup Iterm2 shell integration
  if ! path_exists "$HOME/.iterm2_shell_integration.zsh"; then
    echo -n "$fg_bold[blue]Downloading iterm2 shell integration... \033[s" &&
      (curl -sL https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh > /dev/null) &&
      echo "\033[u$fg_bold[green]Done!$reset_color"
  fi

  source "$HOME/.iterm2_shell_integration.zsh"

  # Setup Homebrew
  [[ "$(uname 2> /dev/null)" == "Darwin" ]] &&
    ! bin_exists "brew" &&
    echo -n "$fg_bold[blue]Installing homebrew... \033[s" &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null &&
    echo "\033[u$fg_bold[green]Done!$reset_color"

  # Setup standard GNU utils
  OPT="/usr/local/opt"
  GNU_BIN="/libexec/gnubin"
  GNU_MAN="/libexec/gnuman"

  FIND_UTILS="$OPT/findutils"
  ! path_exists $FIND_UTILS &&
    echo -n "$fg_bold[blue]Installing GNU findutils... \033[s" &&
    (brew install findutils) &> /dev/null &&
    echo "\033[u$fg_bold[green]Done!$reset_color"

  export PATH=$FIND_UTILS$GNU_BIN:$PATH
  export MANPATH=$FIND_UTILS$GNU_MAN:$MANPATH

  CORE_UTILS="$OPT/coreutils"
  ! path_exists $CORE_UTILS &&
    echo -n "$fg_bold[blue]Installing GNU coreutils... \033[s" &&
    (brew install coreutils) &> /dev/null &&
    echo "\033[u$fg_bold[green]Done!$reset_color"

  export PATH=$CORE_UTILS$GNU_BIN:$PATH
  export MANPATH=$CORE_UTILS$GNU_MAN:$MANPATH

fi

# Setup pyenv
! path_exists "$HOME/.pyenv/bin/pyenv" &&
  echo -n "$fg_bold[blue]Installing pyenv... \033[s" &&
  (curl -s https://pyenv.run | bash 2> /dev/null) &&
  echo "\033[u$fg_bold[green]Done!$reset_color"

export PATH=$($HOME/.pyenv/bin/pyenv root)/shims:$PATH

# Setup g
export GOPATH=$HOME/dev
export GOROOT=$HOME/.go
export PATH=$GOPATH/bin:$PATH
! bin_exists "g" &&
  echo -n "$fg_bold[blue]Installing g... \033[s" &&
  (curl -sL https://raw.githubusercontent.com/ddlees/g/master/bin/g -o /usr/local/bin/g) &> /dev/null &&
  chmod a+x /usr/local/bin/g &&
  echo "\033[u$fg_bold[green]Done!$reset_color"

# Setup golang
latest_go_version="$(g list-all | tail -n 2 | sed 's/[[:space:]>]//g')"
[[ $(g list) != *"$latest_go_version"* ]] &&
  echo -n "$fg_bold[blue]Installing golang v$latest_go_version... \033[s" &&
  (g install latest) &> /dev/null &&
  echo "\033[u$fg_bold[green]Done!$reset_color"

# Setup n
! bin_exists "n" &&
  echo -n "$fg_bold[blue]Installing n... \033[s" &&
  (curl -sL https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n) &> /dev/null &&
  echo "\033[u$fg_bold[green]Done!$reset_color"

export N_PREFIX=$HOME/.n &&
  export PATH=$N_PREFIX/bin:$PATH &&
  export N_USE_XZ=true

# Install latest Node LTS
[[ $(n ls) != *"$(n --lts)"* ]] &&
  echo -n "$fg_bold[blue]Installing NodeJS v$(n --lts)... \033[s" &&
  (n -q lts &> /dev/null) &&
  echo "\033[u$fg_bold[green]Done!$reset_color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# If .oh-my-zsh isn't where it should be...
ZSHRC_DIR="$(dirname $(readlink -e ${(%):-%N}))"
! path_exists $ZSH &&
  cd $ZSHRC_DIR &&
  git submodule update --remote --merge &&
  ln -frs plugins/* .oh-my-zsh/custom/plugins/ &&
  ln -frs themes/* .oh-my-zsh/custom/themes &&
  cd $HOME &&
  ln -s $ZSHRC_DIR/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="mylambda"

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
  brew
  cargo
  docker
  emoji
  emoji-clock
  encode64
  gem
  git
  gradle
  grunt
  gulp
  helm
  iterm2
  kube-ps1
  kube-ps1-patch
  kubectl
  ng
  node
  npx
  pip
  pyenv
  python
  redis-cli
  rust
  sbt
  scala
  vault
  vscode
  xcode
  zsh-completions
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

unalias g
bin_exists "plz" && source <(plz --completion_script)
