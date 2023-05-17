return function()
	local ok, builtin = pcall(require, 'telescope.builtin')
	if not ok then
		return
	else
		local telescope = require('telescope')
		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
					theme = 'dropdown'
				},
				live_grep = {
					theme = 'dropdown',
					additional_args = function()
						return { "--hidden" }
					end
				},
				buffers = {
					theme = 'dropdown'
				}
			},
			extensions = {
				coc = {
					prefer_locations = true,
				}
			},
		})
		telescope.load_extension('fzf')
		telescope.load_extension('coc')

		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, opts)
		vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

		local coc = telescope.extensions.coc
		vim.keymap.set('n', '<leader>fdef', function() coc.definitions {} end, {})
		vim.keymap.set('n', '<leader>fdec', function() coc.declarations {} end, opts)
		vim.keymap.set('n', '<leader>ftd', function() coc.type_definitions {} end, opts)
		vim.keymap.set('n', '<leader>far', function() coc.references {} end, opts)
		vim.keymap.set('n', '<leader>fur', function() coc.references_used {} end, opts)
		vim.keymap.set('n', '<leader>fdd', function() coc.diagnostics {} end, opts)
		vim.keymap.set('n', '<leader>fwd', function() coc.workspace_diagnostics {} end, opts)
		vim.keymap.set('n', '<leader>fds', function() coc.document_symbols {} end, opts)
		vim.keymap.set('n', '<leader>fws', function() coc.workspace_symbols {} end, opts)
		vim.keymap.set('n', '<leader>fcac', function() coc.code_actions {} end, opts)
		vim.keymap.set('n', '<leader>fcal', function() coc.line_code_actions {} end, opts)
		vim.keymap.set('n', '<leader>fcaf', function() coc.file_code_actions {} end, opts)
	end
end
