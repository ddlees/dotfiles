return function()
	local ok, lualine = pcall(require, 'lualine')
	if not ok then
		return
	else
		lualine.setup({
			options = {
				theme = 'tokyonight',
				disabled_filetypes = {
					statusline = {
						'NvimTree'
					},
				}
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
		})
	end
end
