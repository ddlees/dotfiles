################################################################################
#                                    Zinit                                     #
################################################################################
if ! [[ -f "${XDG_CONFIG_HOME}/zsh/plugins/zinit/zinit.zsh" ]]; then
	command git -C "$GIT_DOTFILES" submodule update --init --recursive --jobs 8
fi

source "${XDG_CONFIG_HOME}/zsh/plugins/zinit/zinit.zsh"

################################################################################
#                                Zinit Annexes                                 #
################################################################################

zinit load zinit-zsh/z-a-bin-gem-node

################################################################################
#                                  Binaries                                   #
################################################################################

# Order of execution of related Ice-mods:
# atinit -> atpull! -> make'!!' -> mv -> cp -> make! -> atclone/atpull -> make ->
# (plugin script loading) ->
# src -> multisrc -> atload

export MAKEFLAGS=""

zinit id-as'perl' as'program' atpull'%atclone' make'install' \
	atclone"ziextract --auto --move && ./Configure -des -Dprefix=${ZPFX}/perl/5.32.0 -Dprivlib=${ZPFX}/perl/5.32.0/perl5/5.32.0 -Dsitelib=${ZPFX}/perl/5.32.0/perl5/site_perl/5.32.0 -Dotherlibdirs=/usr/local/lib/perl5/site_perl/5.32.0 -Duseshrplib -Duselargefiles -Dusethreads -Dsed=/usr/bin/sed" \
	for https://www.cpan.org/src/5.0/perl-5.32.0.tar.xz

# zinit id-as'openssl' as'program' atpull'%atclone' make'depend install' \
# 	atclone"
#   ziextract --auto --move && \
#     perl ./Configure --prefix=$ZPFX --openssldir=$ZPFX \
#     shared darwin64-x86_64-cc no-ssl3 no-ssl3-method no-zlib enable-ec_nistp_64_gcc_128 no-ssl2 no-ssl3 no-comp '-Wl,-rpath,$(LIBRPATH)'" \
# 	for https://www.openssl.org/source/openssl-1.1.1g.tar.gz

gnu_programs=(
	id-as'autoconf' https://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.xz
	id-as'automake' https://ftp.gnu.org/gnu/automake/automake-1.16.2.tar.xz
	id-as'binutils' https://ftp.gnu.org/gnu/binutils/binutils-2.35.tar.xz
	id-as'coreutils' https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
	id-as'libtool' https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
	id-as'gmp' atclone'ziextract --auto --move && ./configure --enable-static --prefix=$ZPFX'
	https://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.xz
	id-as'mpfr' atclone'ziextract --auto --move && ./configure --enable-static --prefix=$ZPFX --with-gmp=$ZPFX'
	https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz
	id-as'mpc' atclone'ziextract --auto --move && ./configure --enable-static --prefix=$ZPFX --with-gmp=$ZPFX --with-mpfr=$ZPFX'
	https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
	# id-as'elfutils' atclone'ziextract --auto --move && ./configure --prefix=$ZPFX'
	# https://sourceware.org/elfutils/ftp/elfutils-latest.tar.bz2
	id-as'make' https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
	id-as'gcc' atclone'ziextract --auto \
    && "${PWD}/gcc-10.2.0/configure" --prefix=$ZPFX \
    --with-gmp=$ZPFX \
    --with-mpfr=$ZPFX \
    --with-mpc=$ZPFX \
    --with-fpmath=sse \
    --enable-languages=all' make'-j install'
	https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz
	id-as'diffutils' atclone'ziextract --auto --move && ./configure --prefix=$ZPFX --disable-dependency-tracking'
	https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz
	id-as'gettext' https://ftp.gnu.org/gnu/gettext/gettext-0.19.7.tar.xz
	id-as'texinfo' https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz
	id-as'parallel' https://ftp.gnu.org/gnu/parallel/parallel-latest.tar.bz2
	id-as'findutils' https://ftp.gnu.org/pub/gnu/findutils/findutils-4.7.0.tar.xz
	# id-as'wget' atclone'ziextract --auto --move && ./configure --prefix=$ZPFX --with-ssl=openssl --with-libssl-prefix=/usr/local/Cellar/openssl@1.1/1.1.1g gl_cv_func_ftello_works=yes --disable-debug --disable-pcre --disable-pcre2 --without-libpsl'
	https://ftp.gnu.org/gnu/wget/wget-latest.tar.gz
)
zinit as'program' atclone'ziextract --auto --move && ./configure --prefix=$ZPFX' \
	atpull'%atclone' make'install' for "${gnu_programs[@]}"

zinit id-as'kubectl' as'program' pick'kubectl' atclone'kubectl completion zsh > _kubectl' atpull'%atclone' for \
	https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/darwin/amd64/kubectl

zinit id-as'fzf' as'program' pick='$ZPFX/bin/(fzf|fzf-tmux)' atclone'$XDG_CONFIG_HOME/fzf/setup.zsh' \
	make='PREFIX=$ZPFX install' atpull'%atclone' multisrc'shell/key-bindings.zsh $XDG_CONFIG_HOME/fzf/fzf.zsh' for \
	junegunn/fzf

################################################################################
#                                Instant Prompt                                #
################################################################################

zinit atload'!source ${XDG_CONFIG_HOME:-$HOME/.config}/p10k/.p10k.zsh' lucid nocd for \
	romkatv/powerlevel10k

################################################################################
#                                    Setopts                                   #
################################################################################

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

################################################################################
#                                   Bindkeys                                   #
################################################################################

################################################################################
#                                    Modules                                   #
################################################################################

# zmodload -i zsh/complist

################################################################################
#                                   Autoloads                                  #
################################################################################

autoload -U colors && colors
autoload run-help

################################################################################
#                                  Zsh Plugins                                 #
################################################################################

packages=(
	pyenv
	zsh
	system-completions
)
zplugin wait lucid pack for "${packages[@]}"

completions=(
	OMZ::plugins/cargo/_cargo
	OMZ::plugins/docker/_docker
	zsh-users/zsh-completions
)
zinit wait blockf lucid atpull'zinit creinstall -q .' as'completion' for "${completions[@]}"

plugins=(
	atinit"zicompinit; zicdreplay"
	zdharma/fast-syntax-highlighting
	atclone"dircolors -b LS_COLORS > clrs.zsh"
	atpull'%atclone' pick"clrs.zsh" nocompile'!'
	atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
	trapd00r/LS_COLORS
	OMZ::plugins/colored-man-pages
	svn
	OMZ::plugins/emoji
	OMZ::plugins/git/git.plugin.zsh
	atload'unalias kaf'
	OMZ::plugins/kubectl/kubectl.plugin.zsh
	atload'bindkey "^R" fzf-history-widget'
	OMZ::plugins/vi-mode
	atload'!_zsh_autosuggest_start && source $XDG_CONFIG_HOME/zsh-autosuggestions/setup.zsh'
	zsh-users/zsh-autosuggestions
)
zinit wait lucid for "${plugins[@]}"

################################################################################
#                                    Aliases                                   #
################################################################################

unalias run-help
alias help=run-help
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vim="nvim"
alias vi="nvim"
alias ll="ls -al --color=auto"
alias ls="ls --color=auto"
alias icat="kitty +kitten icat"

# Utility functions
bin_exists() {
	type "$1" >/dev/null
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

# ! path_exists $TMUX_CONF &&
#   cd $ZDOTDIR &&
#   git submodule update --remote --merge &&
#   cd $HOME &&
#   ln -s $ZDOTDIR/.tmux &&
#   ln -s $ZDOTDIR/.tmux.conf

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
# export ZSH=$HOME/.oh-my-zsh
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
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# plugins=(
# )

# source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration
# ZSH_TMUX_AUTOSTART="true"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases

bin_exists "kaf" && source <(kaf completion zsh)
bin_exists "plz" && source <(plz --completion_script)
# bin_exists "skaffold" && source <(skaffold completion zsh)

# added by travis gem
# [ -f /Users/ddleesus.ibm.com/.travis/travis.sh ] && source /Users/ddleesus.ibm.com/.travis/travis.sh

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
	. /Users/ddleesus.ibm.com/.nix-profile/etc/profile.d/nix.sh
fi

###
## AWS CLI Configuration
###
#if type "aws" > /dev/null; then
#  function _aws() {
#    local options="${@}"
#    local aws_options=()
#    # If `CLOUD_OBJECT_STORAGE_ENDPOINT` is defined then use it as the S3
#    # endpoint.
#    [ ! -z "${CLOUD_OBJECT_STORAGE_ENDPOINT}" ] &&
#      aws_options+=('--endpoint-url' "${CLOUD_OBJECT_STORAGE_ENDPOINT}")
#    # Replace `cos://` with `s3://`.
#    local search='cos://'
#    local replace='s3://'
#    options="${options/"${search}"/"${replace}"}"
#    # Remove `us-south/` if it's present.
#    local search='://us-south/'
#    local replace='://'
#    options="${options/"${search}"/"${replace}"}"
#    aws_options+=("${options}")
#    aws ${aws_options}
#  }
#  alias aws="_aws"
#  alias s3="aws s3"
#fi
