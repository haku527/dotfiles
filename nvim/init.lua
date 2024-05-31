local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {
        "typicode/bg.nvim",
        lazy = false,
        -- 此插件只适合unix
        cond = jit.os ~= 'Windows'
    },
    -- {
    --     "neanias/everforest-nvim",
    --     version = false,
    --     lazy = false,
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     -- Optional; default configuration will be used if setup isn't called.
    --     config = function()
    --       require("everforest").setup({
    --         -- Your config here
    --         -- check using ':h everforest'
    --         background = 'soft',
    --         disable_italic_comments = true,
    --         sign_column_background = 'low',
    --         diagnostic_virtual_text = "coloured",
    --       })
    --     end,
    -- },
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                -- options here
                -- keep_quiet_on_no_binary = false,
            })
        end,
        -- 暂时只在windows使用
        cond = jit.os == 'Windows'
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                -- options here
                options = {
                    -- theme = 'everforest'
                    icons_enabled = false,
                    theme = 'tokyonight',
                    component_separators = '',
                    section_separators = '',
                }
            })
        end,

    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                styles = {
                    comments = {italic = false },
                }
            })
        end,
    },
    {
        -- trim trailing whitespaces and empty lines
        "mcauley-penney/tidy.nvim",
        config = true,
    },
})

-- 使用系统的剪贴板
vim.opt.clipboard = 'unnamedplus'
-- 设置背景
vim.opt.background = 'light'
-- 设置主题
vim.cmd.colorscheme('tokyonight')

vim.opt.colorcolumn = '80'
-- 启用行数显示
vim.opt.number = true
-- 搜索时忽略大小写
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.breakindent = true

-- 四字符缩进，空格代替制表符
local indent_value = 4
vim.opt.tabstop = indent_value
vim.opt.shiftwidth = indent_value
vim.opt.expandtab = true

if vim.g.neovide and vim.fn.has('win32') then
    -- 字体
    -- vim.o.guifont = 'Maple Mono SC NF' ..
    vim.o.guifont = 'FiraCode Nerd Font Mono,' ..
        '思源等宽' ..
        ':h12:#e-subpixelantialias' ..
        ':#h-slight'
    -- neovide padding的单位好像是像素，文档没写
    local padding = 4
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_padding_top = padding
    vim.g.neovide_padding_bottom = padding
    vim.g.neovide_padding_right = padding
    vim.g.neovide_padding_left = padding
    -- 按下f11切换全屏模式
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
