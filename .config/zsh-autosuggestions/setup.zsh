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
