-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/dlees/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/dlees/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/dlees/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/dlees/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/dlees/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nO\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\fComment\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0⁄\2\0\0\a\0\19\00026\0\0\0009\0\1\0009\0\2\0'\2\3\0,\3\4\0B\0\4\0026\1\0\0009\1\1\0019\1\4\0015\3\5\0006\4\0\0009\4\6\0049\4\a\4B\1\3\2)\2\0\0\3\2\1\0X\1\bÄ6\1\0\0009\1\b\0019\1\t\1'\3\n\0\18\4\0\0&\3\4\3B\1\2\1X\1\24Ä6\1\0\0009\1\b\0019\1\v\1'\3\f\0B\1\2\2\15\0\1\0X\2\6Ä6\1\0\0009\1\1\0019\1\r\1'\3\14\0B\1\2\1X\1\vÄ6\1\0\0009\1\b\0019\1\t\1'\3\15\0006\4\0\0009\4\16\0049\4\17\4'\5\18\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\ah \17nvim_command\bapi\rfiletype\abo\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand\afn\bvimb\0\0\3\0\5\0\r6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\5Ä6\0\0\0009\0\1\0009\0\4\0'\2\3\0B\0\2\1K\0\1\0\14CocAction\vformat\19CocHasProvider\afn\bvimÄ\23\1\0\21\0\\\1ƒ\0016\0\0\0009\0\1\0005\1\3\0=\1\2\0005\0\4\0004\1\0\0=\1\5\0004\1\19\0005\2\6\0005\3\a\0>\3\3\2>\2\1\0015\2\b\0005\3\t\0>\3\3\2>\2\2\0015\2\n\0005\3\v\0>\3\3\2>\2\3\0015\2\f\0005\3\r\0>\3\3\2>\2\4\0015\2\14\0005\3\15\0>\3\3\2>\2\5\0015\2\16\0005\3\17\0>\3\3\2>\2\6\0015\2\18\0005\3\19\0>\3\3\2>\2\a\0015\2\20\0005\3\21\0>\3\3\2>\2\b\0015\2\22\0005\3\23\0>\3\3\2>\2\t\0015\2\24\0005\3\25\0>\3\3\2>\2\n\0015\2\26\0005\3\27\0>\3\3\2>\2\v\0015\2\28\0005\3\29\0>\3\3\2>\2\f\0015\2\30\0005\3\31\0>\3\3\2>\2\r\0015\2 \0005\3!\0>\3\3\2>\2\14\0015\2\"\0005\3#\0>\3\3\2>\2\15\0015\2$\0005\3%\0>\3\3\2>\2\16\0015\2&\0005\3'\0>\3\3\2>\2\17\0015\2(\0005\3)\0>\3\3\2>\2\18\1=\1*\0004\1\0\0=\1+\0004\1\0\0=\1,\0004\1\4\0005\2-\0005\3.\0>\3\3\2>\2\1\0015\2/\0005\0030\0>\3\3\2>\2\2\0015\0021\0005\0032\0>\3\3\2>\2\3\1=\0013\0004\1\0\0=\0014\0004\1\0\0=\0015\0004\1\a\0005\0026\0005\0037\0>\3\3\2>\2\1\0015\0028\0005\0039\0>\3\3\2>\2\2\0015\2:\0005\3;\0>\3\3\2>\2\3\0015\2<\0005\3=\0>\3\3\2>\2\4\0015\2>\0005\3?\0>\3\3\2>\2\5\0015\2@\0005\3A\0>\3\3\2>\2\6\1=\1B\0004\1\0\0=\1C\0004\1\0\0=\1D\0004\1\0\0=\1E\0006\1F\0\18\3\0\0B\1\2\4H\4\28Ä6\6F\0\18\b\5\0B\6\2\4H\t\22Ä\21\v\n\0\t\v\0\0X\v\6Ä6\vG\0009\vH\v\18\r\n\0B\v\2\2\14\0\v\0X\f\1Ä5\vI\0006\fJ\0\18\14\n\0B\f\2\0036\14K\0006\16\0\0009\16L\0169\16M\16\18\17\4\0\18\18\f\0\18\19\r\0\18\20\v\0B\14\6\1F\t\3\3R\tË\127F\4\3\3R\4‚\1276\1N\0003\2P\0=\2O\0016\1N\0003\2R\0=\2Q\0016\1\0\0009\1L\0019\1S\1'\3T\0004\4\0\0B\1\3\0016\1\0\0009\1L\0019\1U\1'\3V\0005\4W\0B\1\3\0016\1\0\0009\1L\0019\1U\1'\3X\0005\4Y\0003\5Z\0=\5[\4B\1\3\1K\0\1\0\rcallback\0\1\0\1\ngroup\rCocGroup\16BufWritePre\1\0\3\ngroup\rCocGroup\tdesc0Highlight symbol under cursor on CursorHold\fcommand,silent call CocActionAsync('highlight')\15CursorHold\24nvim_create_autocmd\rCocGroup\24nvim_create_augroup\0\14show_docs\0\21check_back_space\a_G\20nvim_set_keymap\bapi\npcall\vunpack\1\0\2\fnoremap\2\vsilent\2\vremove\ntable\npairs\6t\6c\6l\6i\1\0\2\fnoremap\2\texpr\2\1\3\0\0\t<CR>Qcoc#pum#visible() ? coc#pum#confirm() : \"<C-g>u<CR><c-r>=coc#on_enter()<CR>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-B><coc#float#has_scroll() ? coc#float#scroll(0) : \"<Left>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-F>=coc#float#has_scroll() ? coc#float#scroll(1) : \"<Right>\"\1\0\1\texpr\2\1\3\0\0\14<C-SPACE>\18coc#refresh()\1\0\1\texpr\2\1\3\0\0\f<S-TAB>2coc#pum#visible() ? coc#pum#prev(1) : \"<C-H>\"\1\0\3\fnoremap\2\vsilent\2\texpr\2\1\3\0\0\n<TAB>]coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\6!\6o\6x\1\0\2\vnowait\2\vsilent\2\1\3\0\0\14<leader>a$<Plug>(coc-codeaction-selected)\1\0\1\vsilent\2\1\3\0\0\14<leader>f <Plug>(coc-format-selected)\1\0\1\vsilent\2\1\3\0\0\14<leader>a <CMD>lua _G.show_docs()<CR>\6s\6v\6n\1\0\2\vnowait\2\vsilent\2\1\3\0\0\15<leader>cl <Plug>(coc-codelens-action)\1\0\2\vnowait\2\vsilent\2\1\3\0\0\14<leader>a$<Plug>(coc-codeaction-selected)\1\0\2\vnowait\2\vsilent\2\1\3\0\0\15<leader>ca\27<Plug>(coc-codeaction)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\15<leader>qf\28<Plug>(coc-fix-current)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\15<leader>rn\23<Plug>(coc-rename)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\14<leader>f\23<Plug>(coc-format)\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-B>;coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-B>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-F>;coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-F>\"\1\0\1\fnoremap\1\1\3\0\0\agr\27<Plug>(coc-references)\1\0\1\fnoremap\1\1\3\0\0\agi\31<Plug>(coc-implementation)\1\0\1\fnoremap\1\1\3\0\0\agy <Plug>(coc-type-definition)\1\0\1\fnoremap\1\1\3\0\0\agd\27<Plug>(coc-definition)\1\0\1\fnoremap\1\1\3\0\0\agb\29<Plug>(coc-cursors-word)\1\0\1\fnoremap\1\1\3\0\0\a]c!<Plug>(coc-git-nextconflict)\1\0\1\fnoremap\1\1\3\0\0\a[c!<Plug>(coc-git-prevconflict)\1\0\1\fnoremap\1\1\3\0\0\a]g <Plug>(coc-diagnostic-next)\1\0\1\fnoremap\1\1\3\0\0\a[g <Plug>(coc-diagnostic-prev)\1\0\1\vsilent\2\1\3\0\0\6K <CMD>lua _G.show_docs()<CR>\5\1\0\0\1\n\0\0\15coc-docker\vcoc-go\rcoc-json\18coc-lightbulb\20coc-marketplace\20coc-sumneko-lua\17coc-tsserver\rcoc-yaml\fcoc-git\26coc_global_extensions\6g\bvim\6\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nP\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\rgitsigns\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\në\1\0\0\5\0\5\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\3Ä9\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nõ\3\0\0\b\0\23\0.6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2%Ä9\2\3\0015\4\t\0005\5\4\0005\6\6\0005\a\5\0=\a\a\6=\6\b\5=\5\n\0045\5\v\0004\6\0\0=\6\f\0054\6\0\0=\6\r\0055\6\14\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\5=\5\19\0045\5\20\0004\6\0\0=\6\f\0054\6\0\0=\6\r\0055\6\21\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\5=\5\22\4B\2\2\1K\0\1\0\20inactive_winbar\1\2\0\0\rfilename\1\0\0\vwinbar\14lualine_z\14lualine_y\14lualine_x\14lualine_c\1\2\0\0\rfilename\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\23disabled_filetypes\15statusline\1\0\0\1\2\0\0\rNvimTree\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\nQ\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\14scrollbar\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ní\2\0\0\b\0\17\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\21Ä6\2\3\0009\2\4\2)\3\1\0=\3\5\0026\2\3\0009\2\4\2)\3\1\0=\3\6\0029\2\a\0015\4\t\0005\5\b\0=\5\n\4B\2\2\0016\2\3\0009\2\v\0029\2\f\2'\4\r\0'\5\14\0'\6\15\0005\a\16\0B\2\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\28<Cmd>NvimTreeToggle<cr>\14<leader>e\6n\bset\vkeymap\bgit\1\0\0\1\0\1\vignore\1\nsetup\23loaded_netrwPlugin\vloaded\6g\bvim\14nvim-tree\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nê\1\0\2\t\0\a\1\21*\2\0\0006\3\0\0006\5\1\0009\5\2\0059\5\3\0056\6\1\0009\6\4\0069\6\5\6\18\b\1\0B\6\2\0A\3\1\3\15\0\3\0X\5\aÄ\15\0\4\0X\5\5Ä9\5\6\4\1\2\5\0X\5\2Ä+\5\2\0L\5\2\0K\0\1\0\tsize\22nvim_buf_get_name\bapi\ffs_stat\tloop\bvim\npcallÄÄ}Ì\1\1\0\a\0\t\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0\tÄX\2\aÄ9\2\3\0015\4\4\0005\5\5\0003\6\6\0=\6\a\5=\5\b\4B\2\2\1K\0\1\0K\0\1\0\14highlight\fdisable\0\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\3\21ensure_installed\ball\17auto_install\2\18sync_install_\1\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden)\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\16definitions*\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\17declarations.\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\21type_definitions(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\15references-\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\20references_used)\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\16diagnostics3\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\26workspace_diagnostics.\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\21document_symbols/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22workspace_symbols*\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\17code_actions/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22line_code_actions/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22file_code_actionsà\t\1\0\v\0008\0®\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0†ÄX\2ûÄ6\2\1\0'\4\3\0B\2\2\0029\3\4\0025\5\14\0005\6\6\0005\a\5\0=\a\a\0065\a\b\0003\b\t\0=\b\n\a=\a\v\0065\a\f\0=\a\r\6=\6\15\0055\6\17\0005\a\16\0=\a\18\6=\6\19\5B\3\2\0019\3\20\2'\5\21\0B\3\2\0019\3\20\2'\5\18\0B\3\2\0015\3\22\0006\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\27\0009\b\a\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\28\0009\b\v\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\29\0009\b\r\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\30\0009\b\31\1\18\t\3\0B\4\5\0019\4\19\0029\4\18\0046\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b \0003\t!\0004\n\0\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b\"\0003\t#\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b$\0003\t%\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b&\0003\t'\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b(\0003\t)\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b*\0003\t+\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b,\0003\t-\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b.\0003\t/\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b0\0003\t1\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b2\0003\t3\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b4\0003\t5\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b6\0003\t7\0\18\n\3\0B\5\5\0012\2\0ÄK\0\1\0K\0\1\0\0\17<leader>fcaf\0\17<leader>fcal\0\17<leader>fcac\0\16<leader>fws\0\16<leader>fds\0\16<leader>fwd\0\16<leader>fdd\0\16<leader>fur\0\16<leader>far\0\16<leader>ftd\0\17<leader>fdec\0\17<leader>fdef\14help_tags\15<leader>fh\15<leader>fb\15<leader>lg\15<leader>ff\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\bfzf\19load_extension\15extensions\bcoc\1\0\0\1\0\1\21prefer_locations\2\fpickers\1\0\0\fbuffers\1\0\1\ntheme\rdropdown\14live_grep\20additional_args\0\1\0\1\ntheme\rdropdown\15find_files\1\0\0\1\0\2\vhidden\2\ntheme\rdropdown\nsetup\14telescope\22telescope.builtin\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n§\1\0\0\5\0\t\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\bÄ9\2\3\0015\4\4\0B\2\2\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0B\2\2\1K\0\1\0\27colorscheme tokyonight\17nvim_command\bapi\bvim\1\0\1\nstyle\tmoon\nsetup\15tokyonight\frequire\npcall\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["tree-sitter-just"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21tree-sitter-just\frequire\0" },
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/tree-sitter-just",
    url = "https://github.com/IndianBoy42/tree-sitter-just"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/Users/dlees/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden)\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\16definitions*\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\17declarations.\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\21type_definitions(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\15references-\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\20references_used)\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\16diagnostics3\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\26workspace_diagnostics.\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\21document_symbols/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22workspace_symbols*\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\17code_actions/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22line_code_actions/\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\4¿\22file_code_actionsà\t\1\0\v\0008\0®\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0†ÄX\2ûÄ6\2\1\0'\4\3\0B\2\2\0029\3\4\0025\5\14\0005\6\6\0005\a\5\0=\a\a\0065\a\b\0003\b\t\0=\b\n\a=\a\v\0065\a\f\0=\a\r\6=\6\15\0055\6\17\0005\a\16\0=\a\18\6=\6\19\5B\3\2\0019\3\20\2'\5\21\0B\3\2\0019\3\20\2'\5\18\0B\3\2\0015\3\22\0006\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\27\0009\b\a\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\28\0009\b\v\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\29\0009\b\r\1\18\t\3\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\30\0009\b\31\1\18\t\3\0B\4\5\0019\4\19\0029\4\18\0046\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b \0003\t!\0004\n\0\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b\"\0003\t#\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b$\0003\t%\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b&\0003\t'\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b(\0003\t)\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b*\0003\t+\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b,\0003\t-\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b.\0003\t/\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b0\0003\t1\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b2\0003\t3\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b4\0003\t5\0\18\n\3\0B\5\5\0016\5\23\0009\5\24\0059\5\25\5'\a\26\0'\b6\0003\t7\0\18\n\3\0B\5\5\0012\2\0ÄK\0\1\0K\0\1\0\0\17<leader>fcaf\0\17<leader>fcal\0\17<leader>fcac\0\16<leader>fws\0\16<leader>fds\0\16<leader>fwd\0\16<leader>fdd\0\16<leader>fur\0\16<leader>far\0\16<leader>ftd\0\17<leader>fdec\0\17<leader>fdef\14help_tags\15<leader>fh\15<leader>fb\15<leader>lg\15<leader>ff\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\bfzf\19load_extension\15extensions\bcoc\1\0\0\1\0\1\21prefer_locations\2\fpickers\1\0\0\fbuffers\1\0\1\ntheme\rdropdown\14live_grep\20additional_args\0\1\0\1\ntheme\rdropdown\15find_files\1\0\0\1\0\2\vhidden\2\ntheme\rdropdown\nsetup\14telescope\22telescope.builtin\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\në\1\0\0\5\0\5\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\3Ä9\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\fComment\frequire\npcall\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n§\1\0\0\5\0\t\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\bÄ9\2\3\0015\4\4\0B\2\2\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0B\2\2\1K\0\1\0\27colorscheme tokyonight\17nvim_command\bapi\bvim\1\0\1\nstyle\tmoon\nsetup\15tokyonight\frequire\npcall\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\nQ\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\14scrollbar\frequire\npcall\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0⁄\2\0\0\a\0\19\00026\0\0\0009\0\1\0009\0\2\0'\2\3\0,\3\4\0B\0\4\0026\1\0\0009\1\1\0019\1\4\0015\3\5\0006\4\0\0009\4\6\0049\4\a\4B\1\3\2)\2\0\0\3\2\1\0X\1\bÄ6\1\0\0009\1\b\0019\1\t\1'\3\n\0\18\4\0\0&\3\4\3B\1\2\1X\1\24Ä6\1\0\0009\1\b\0019\1\v\1'\3\f\0B\1\2\2\15\0\1\0X\2\6Ä6\1\0\0009\1\1\0019\1\r\1'\3\14\0B\1\2\1X\1\vÄ6\1\0\0009\1\b\0019\1\t\1'\3\15\0006\4\0\0009\4\16\0049\4\17\4'\5\18\0\18\6\0\0&\3\6\3B\1\2\1K\0\1\0\6 \15keywordprg\6o\6!\fdoHover\19CocActionAsync\20coc#rpc#ready()\14nvim_eval\ah \17nvim_command\bapi\rfiletype\abo\1\3\0\0\bvim\thelp\nindex\f<cword>\vexpand\afn\bvimb\0\0\3\0\5\0\r6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\5Ä6\0\0\0009\0\1\0009\0\4\0'\2\3\0B\0\2\1K\0\1\0\14CocAction\vformat\19CocHasProvider\afn\bvimÄ\23\1\0\21\0\\\1ƒ\0016\0\0\0009\0\1\0005\1\3\0=\1\2\0005\0\4\0004\1\0\0=\1\5\0004\1\19\0005\2\6\0005\3\a\0>\3\3\2>\2\1\0015\2\b\0005\3\t\0>\3\3\2>\2\2\0015\2\n\0005\3\v\0>\3\3\2>\2\3\0015\2\f\0005\3\r\0>\3\3\2>\2\4\0015\2\14\0005\3\15\0>\3\3\2>\2\5\0015\2\16\0005\3\17\0>\3\3\2>\2\6\0015\2\18\0005\3\19\0>\3\3\2>\2\a\0015\2\20\0005\3\21\0>\3\3\2>\2\b\0015\2\22\0005\3\23\0>\3\3\2>\2\t\0015\2\24\0005\3\25\0>\3\3\2>\2\n\0015\2\26\0005\3\27\0>\3\3\2>\2\v\0015\2\28\0005\3\29\0>\3\3\2>\2\f\0015\2\30\0005\3\31\0>\3\3\2>\2\r\0015\2 \0005\3!\0>\3\3\2>\2\14\0015\2\"\0005\3#\0>\3\3\2>\2\15\0015\2$\0005\3%\0>\3\3\2>\2\16\0015\2&\0005\3'\0>\3\3\2>\2\17\0015\2(\0005\3)\0>\3\3\2>\2\18\1=\1*\0004\1\0\0=\1+\0004\1\0\0=\1,\0004\1\4\0005\2-\0005\3.\0>\3\3\2>\2\1\0015\2/\0005\0030\0>\3\3\2>\2\2\0015\0021\0005\0032\0>\3\3\2>\2\3\1=\0013\0004\1\0\0=\0014\0004\1\0\0=\0015\0004\1\a\0005\0026\0005\0037\0>\3\3\2>\2\1\0015\0028\0005\0039\0>\3\3\2>\2\2\0015\2:\0005\3;\0>\3\3\2>\2\3\0015\2<\0005\3=\0>\3\3\2>\2\4\0015\2>\0005\3?\0>\3\3\2>\2\5\0015\2@\0005\3A\0>\3\3\2>\2\6\1=\1B\0004\1\0\0=\1C\0004\1\0\0=\1D\0004\1\0\0=\1E\0006\1F\0\18\3\0\0B\1\2\4H\4\28Ä6\6F\0\18\b\5\0B\6\2\4H\t\22Ä\21\v\n\0\t\v\0\0X\v\6Ä6\vG\0009\vH\v\18\r\n\0B\v\2\2\14\0\v\0X\f\1Ä5\vI\0006\fJ\0\18\14\n\0B\f\2\0036\14K\0006\16\0\0009\16L\0169\16M\16\18\17\4\0\18\18\f\0\18\19\r\0\18\20\v\0B\14\6\1F\t\3\3R\tË\127F\4\3\3R\4‚\1276\1N\0003\2P\0=\2O\0016\1N\0003\2R\0=\2Q\0016\1\0\0009\1L\0019\1S\1'\3T\0004\4\0\0B\1\3\0016\1\0\0009\1L\0019\1U\1'\3V\0005\4W\0B\1\3\0016\1\0\0009\1L\0019\1U\1'\3X\0005\4Y\0003\5Z\0=\5[\4B\1\3\1K\0\1\0\rcallback\0\1\0\1\ngroup\rCocGroup\16BufWritePre\1\0\3\ngroup\rCocGroup\tdesc0Highlight symbol under cursor on CursorHold\fcommand,silent call CocActionAsync('highlight')\15CursorHold\24nvim_create_autocmd\rCocGroup\24nvim_create_augroup\0\14show_docs\0\21check_back_space\a_G\20nvim_set_keymap\bapi\npcall\vunpack\1\0\2\fnoremap\2\vsilent\2\vremove\ntable\npairs\6t\6c\6l\6i\1\0\2\fnoremap\2\texpr\2\1\3\0\0\t<CR>Qcoc#pum#visible() ? coc#pum#confirm() : \"<C-g>u<CR><c-r>=coc#on_enter()<CR>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-B><coc#float#has_scroll() ? coc#float#scroll(0) : \"<Left>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-F>=coc#float#has_scroll() ? coc#float#scroll(1) : \"<Right>\"\1\0\1\texpr\2\1\3\0\0\14<C-SPACE>\18coc#refresh()\1\0\1\texpr\2\1\3\0\0\f<S-TAB>2coc#pum#visible() ? coc#pum#prev(1) : \"<C-H>\"\1\0\3\fnoremap\2\vsilent\2\texpr\2\1\3\0\0\n<TAB>]coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? \"<TAB>\" : coc#refresh()\6!\6o\6x\1\0\2\vnowait\2\vsilent\2\1\3\0\0\14<leader>a$<Plug>(coc-codeaction-selected)\1\0\1\vsilent\2\1\3\0\0\14<leader>f <Plug>(coc-format-selected)\1\0\1\vsilent\2\1\3\0\0\14<leader>a <CMD>lua _G.show_docs()<CR>\6s\6v\6n\1\0\2\vnowait\2\vsilent\2\1\3\0\0\15<leader>cl <Plug>(coc-codelens-action)\1\0\2\vnowait\2\vsilent\2\1\3\0\0\14<leader>a$<Plug>(coc-codeaction-selected)\1\0\2\vnowait\2\vsilent\2\1\3\0\0\15<leader>ca\27<Plug>(coc-codeaction)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\15<leader>qf\28<Plug>(coc-fix-current)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\15<leader>rn\23<Plug>(coc-rename)\1\0\2\fnoremap\2\vsilent\2\1\3\0\0\14<leader>f\23<Plug>(coc-format)\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-B>;coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-B>\"\1\0\3\vsilent\2\vnowait\2\texpr\2\1\3\0\0\n<C-F>;coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-F>\"\1\0\1\fnoremap\1\1\3\0\0\agr\27<Plug>(coc-references)\1\0\1\fnoremap\1\1\3\0\0\agi\31<Plug>(coc-implementation)\1\0\1\fnoremap\1\1\3\0\0\agy <Plug>(coc-type-definition)\1\0\1\fnoremap\1\1\3\0\0\agd\27<Plug>(coc-definition)\1\0\1\fnoremap\1\1\3\0\0\agb\29<Plug>(coc-cursors-word)\1\0\1\fnoremap\1\1\3\0\0\a]c!<Plug>(coc-git-nextconflict)\1\0\1\fnoremap\1\1\3\0\0\a[c!<Plug>(coc-git-prevconflict)\1\0\1\fnoremap\1\1\3\0\0\a]g <Plug>(coc-diagnostic-next)\1\0\1\fnoremap\1\1\3\0\0\a[g <Plug>(coc-diagnostic-prev)\1\0\1\vsilent\2\1\3\0\0\6K <CMD>lua _G.show_docs()<CR>\5\1\0\0\1\n\0\0\15coc-docker\vcoc-go\rcoc-json\18coc-lightbulb\20coc-marketplace\20coc-sumneko-lua\17coc-tsserver\rcoc-yaml\fcoc-git\26coc_global_extensions\6g\bvim\6\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: tree-sitter-just
time([[Config for tree-sitter-just]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21tree-sitter-just\frequire\0", "config", "tree-sitter-just")
time([[Config for tree-sitter-just]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ní\2\0\0\b\0\17\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\21Ä6\2\3\0009\2\4\2)\3\1\0=\3\5\0026\2\3\0009\2\4\2)\3\1\0=\3\6\0029\2\a\0015\4\t\0005\5\b\0=\5\n\4B\2\2\0016\2\3\0009\2\v\0029\2\f\2'\4\r\0'\5\14\0'\6\15\0005\a\16\0B\2\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\28<Cmd>NvimTreeToggle<cr>\14<leader>e\6n\bset\vkeymap\bgit\1\0\0\1\0\1\vignore\1\nsetup\23loaded_netrwPlugin\vloaded\6g\bvim\14nvim-tree\frequire\npcall\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nõ\3\0\0\b\0\23\0.6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2%Ä9\2\3\0015\4\t\0005\5\4\0005\6\6\0005\a\5\0=\a\a\6=\6\b\5=\5\n\0045\5\v\0004\6\0\0=\6\f\0054\6\0\0=\6\r\0055\6\14\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\5=\5\19\0045\5\20\0004\6\0\0=\6\f\0054\6\0\0=\6\r\0055\6\21\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\5=\5\22\4B\2\2\1K\0\1\0\20inactive_winbar\1\2\0\0\rfilename\1\0\0\vwinbar\14lualine_z\14lualine_y\14lualine_x\14lualine_c\1\2\0\0\rfilename\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\23disabled_filetypes\15statusline\1\0\0\1\2\0\0\rNvimTree\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\4\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2ÄK\0\1\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\rgitsigns\frequire\npcall\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nê\1\0\2\t\0\a\1\21*\2\0\0006\3\0\0006\5\1\0009\5\2\0059\5\3\0056\6\1\0009\6\4\0069\6\5\6\18\b\1\0B\6\2\0A\3\1\3\15\0\3\0X\5\aÄ\15\0\4\0X\5\5Ä9\5\6\4\1\2\5\0X\5\2Ä+\5\2\0L\5\2\0K\0\1\0\tsize\22nvim_buf_get_name\bapi\ffs_stat\tloop\bvim\npcallÄÄ}Ì\1\1\0\a\0\t\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0\tÄX\2\aÄ9\2\3\0015\4\4\0005\5\5\0003\6\6\0=\6\a\5=\5\b\4B\2\2\1K\0\1\0K\0\1\0\14highlight\fdisable\0\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\3\21ensure_installed\ball\17auto_install\2\18sync_install_\1\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
