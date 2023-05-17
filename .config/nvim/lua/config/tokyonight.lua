return function()
	local ok, tokyonight = pcall(require, 'tokyonight')
	if not ok then
		return
	else
		tokyonight.setup({ style = 'moon' })
		vim.api.nvim_command('colorscheme tokyonight')
	end
end
