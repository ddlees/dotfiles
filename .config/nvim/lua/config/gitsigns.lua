return function()
	local ok, gitsigns = pcall(require, 'gitsigns')
	if not ok then
		return
	else
		gitsigns.setup()
	end
end
