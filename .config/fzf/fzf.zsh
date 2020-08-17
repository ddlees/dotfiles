# Use tmux.
export FZF_TMUX=1

if type "rg" >/dev/null; then

	# export RG_PREFIX='rg --files --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*" --glob "!node_modules/*"'
	# RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
	# INITIAL_QUERY="foobar"
	# FZF_DEFAULT_COMMAND='"$RG_PREFIX" fzf --bind change:reload:"$RG_PREFIX" {q} || true --ansi --phony'

	export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*" --glob "!node_modules/*"'
	# export FZF_DEFAULT_COMMAND='rg --no-ignore --hidden --glob "!.git/*" --glob "!.cache/*" --glob "!node_modules/*"'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND | xargs dirname | uniq -u"
fi

# Setup default options.
function fzf_default_options() {
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
