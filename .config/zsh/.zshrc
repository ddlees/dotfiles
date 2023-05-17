#!/usr/bin/env zsh

# Set ZPROF=1 to profile
[ -z "$ZPROF" ] || zmodload zsh/zprof

################################################################################
#                                Instant Prompt                                #
################################################################################

# Enables Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -z "$ZPROF" && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################################################################
#                               Utility Functions                              #
################################################################################

typeset -gU FPATH fpath
fpath=( "${XDG_CONFIG_HOME:-$HOME/.config}"/zsh/functions(N) $fpath )
autoload -Uz "${XDG_CONFIG_HOME:-$HOME/.config}"/zsh/functions/**/*

################################################################################
#                                 Completions                                  #
################################################################################

builtin setopt COMPLETE_IN_WORD
builtin setopt ALWAYS_TO_END
builtin setopt PATH_DIRS
builtin setopt AUTO_MENU
builtin setopt AUTO_LIST
builtin setopt AUTO_PARAM_SLASH
builtin unsetopt MENU_COMPLETE
builtin unsetopt FLOW_CONTROL

builtin zstyle ':completion:*:*:-command-:*:*' group-order functions builtins commands

################################################################################
#                                    Zinit                                     #
################################################################################
if ! file.exists "${ZINIT[BIN_DIR]}"; then
    log.info "downloading zinit..."
    command git -C "$GIT_DOTFILES" submodule update --init --recursive || (log.error "failed to clone zinit repository" && return 1)
fi

if [[ "$(file.mode ${ZINIT[BIN_DIR]} | cut -c 5-7)" != "---" ]]; then
    log.info "setting zinit permissions..."
    command chmod g= "${ZINIT[BIN_DIR]}"
fi

if ! file.exists "${ZINIT[BIN_DIR]}/zinit.zsh" ]]; then
    log.error "unable to locate zinit"
    return 1
fi

if ! file.exists "${ZINIT[BIN_DIR]}/zinit.zsh.zwc"; then
    log.info "compiling zinit..."
    zcompile "${ZINIT[BIN_DIR]}/zinit.zsh"
fi

source "${ZINIT[BIN_DIR]}/zinit.zsh" || (log.error "unable to load zinit" && return 1)

# In case compinit is called before sourcing zinit
autoload -Uz _zinit && (( ${+_comps} )) && _comps[zinit]=_zinit

################################################################################
#                   Automatic Plugin/Script Compilation                        #
################################################################################

if file.exists "${ZINIT[PLUGIN_DIR]}/z-shell---zpmod/Src/zi/zpmod.so"; then
    module_path+=( "/Users/dlees/.zi/zmodules/zpmod/Src" )
    zmodload zi/zpmod
fi

################################################################################
#                           Compile Zsh from Source                            #
################################################################################

zinit wait light-mode lucid as'null' depth=1 atpull'%atclone' nocompile \
    atclone'./.preconfig; log.info "Building zsh..."; \
    CPPFLAGS="-I/usr/include -I/usr/local/include" CFLAGS="-g -O2 -Wall" LDFLAGS="-L/usr/lib -L/usr/local/lib" ./configure --prefix="$ZPFX" && \
    make install.bin install.fns install.modules && \
    sudo cp -vf Src/zsh /usr/local/bin/zsh && \
    log.info zsh build complete! || \
    log.error zsh build failed!' for \
    @zsh-users/zsh

################################################################################
#                           Compile zpmod                                      #
################################################################################

zinit wait light-mode lucid as'null' depth=1 atpull'%atclone' nocompile \
    atclone'log.info "Building zpmod..."; \
    file.exists Makefile && make distclean; \
    ./configure --enable-cflags="-g -Wall -O3" --disable-gdbm --without-tcsetpgrp && \
    make --jobs=$(getconf _NPROCESSORS_ONLN || sysctl -n hw.ncpu || echo 1) && \
    cp -vf Src/zi/zpmod.so Src/zi/zpmod.bundle && \
    log.info zpmod build complete! || \
    log.error zpmod build failed!' for \
    @z-shell/zpmod

################################################################################
#                                Prompt                                        #
################################################################################

zinit depth=1 light-mode lucid nocd atload'!source ${XDG_CONFIG_HOME:-$HOME/.config}/p10k/.p10k.zsh' for romkatv/powerlevel10k

################################################################################
#                                Zinit Annexes                                 #
################################################################################

zi light-mode for zdharma-continuum/zinit-annex-{"bin-gem-node","binary-symlink","patch-dl","rust"}

################################################################################
#                                  Binaries                                   #
################################################################################

zinit wait light-mode lucid from'gh-r' nocompile blockf for \
    lbin'!exa -> ls' @ogham/exa \
    lbin'!rg' @BurntSushi/ripgrep \
    lbin'!jq* -> jq' @stedolan/jq \
    lbin'!nvim' nocompletions @neovim/neovim \
    lbin'!krew* -> krew' @kubernetes-sigs/krew \
    lbin'!' @casey/just

zinit wait light-mode lucid from'gh-r' nocompile completions blockf \
    lbin'!' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -> _fzf_completion' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -> key-bindings.zsh' \
    dl'https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1 -> $ZPFX/man/man1/fzf.1' \
    src'key-bindings.zsh' \
    for @junegunn/fzf

zinit wait light-mode lucid nocompile blockf lbin'!' for \
    @tj/n \
    @ddlees/g

private ostype="${$(uname -s):l}"
private arch="${$(uname -m):l:s/x86_/amd}"
zinit wait light-mode lucid id-as'kubectl' as'program' atclone'kubectl completion zsh > _kubectl' blockf nocompile atpull'%atclone' for \
    "https://dl.k8s.io/release/$(curl -L -s "https://dl.k8s.io/release/stable.txt")/bin/$ostype/$arch/kubectl"

zinit wait light-mode lucid id-as'skaffold' as'program' pick'skaffold' atclone'chmod a+x skaffold && ./skaffold completion zsh > _skaffold' atpull'%atclone' for \
	"https://storage.googleapis.com/skaffold/releases/latest/skaffold-$ostype-$arch"

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
#                                   Autoloads                                  #
################################################################################

autoload -U colors && colors
autoload run-help

################################################################################
#                                  Zsh Plugins                                 #
################################################################################

zinit wait lucid pack for system-completions

plugins=(
	OMZ::plugins/colored-man-pages
    atload'unalias g'
	OMZ::plugins/git/git.plugin.zsh
)
zinit wait light-mode lucid for "${plugins[@]}"

zinit wait light-mode lucid atload'!_zsh_autosuggest_start
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold"
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    bindkey "^ " autosuggest-accept
    bindkey "^f" forward-word' \
    for zsh-users/zsh-autosuggestions

zinit wait light-mode lucid atload'FAST_HIGHLIGHT[chroma-man]=' atpull'%atclone' \
    compile'.*fast*~*.zwc' nocompletions \
    atinit'zicompinit; zicdreplay' \
    atclone'(){ local f; cd -q →*; for f (*~*.zwc){ zcompile -Uz -- ${f}};}' \
    for zdharma-continuum/fast-syntax-highlighting

################################################################################
#                                    Aliases                                   #
################################################################################

unalias run-help
alias help=run-help
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vim="nvim"
alias vi="nvim"
alias ll="ls -al"
alias icat="kitty +kitten icat"

# Setup development source paths
! file.exists "$HOME/dev" && mkdir -p "$HOME/dev/src/github.com"

[ -z "$ZPROF" ] || zprof
