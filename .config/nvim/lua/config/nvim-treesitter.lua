return function()
	local ok, nvimTreesitter = pcall(require, 'nvim-treesitter.configs')
	if not ok then
		return
	else
		nvimTreesitter.setup({
			ensure_installed = 'all',
			sync_install_ = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = function(_, buf) -- disable highlighting for large files
					local max_filesize = 1000 * 1024 -- 1000KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end
			},
		})
	end
end
