return function()
	local ok, indent_blankline = pcall(require, 'indent_blankline')
	if not ok then
		return
	else
		indent_blankline.setup({
			show_current_context = true,
			show_current_context_start = true,
		})
	end
end
