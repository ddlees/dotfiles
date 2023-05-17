return function()
	local ok, scrollbar = pcall(require, 'scrollbar')
	if not ok then
		return
	else
		scrollbar.setup()
	end
end
