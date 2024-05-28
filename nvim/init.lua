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
        -- not work on windows, so load on condiction
        cond = jit.os ~= 'Windows'
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
          require("everforest").setup({
            -- Your config here
            -- check using ':h everforest'
            background = 'soft',
            disable_italic_comments = true,
            sign_column_background = 'low',
            diagnostic_virtual_text = "coloured",
          })
        end,
    },
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                -- options here
                -- keep_quiet_on_no_binary = false,
            })
        end,
        -- temp disable on linux
        cond = jit.os == 'Windows'
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                -- options here
                options = {
                    theme = 'everforest'
                }
            })
        end,

    },
    
})


vim.opt.background = 'dark'
-- 使用系统的剪贴板
vim.opt.clipboard = 'unnamedplus'
vim.cmd.colorscheme('everforest')

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.breakindent = true
indent_value = 4
vim.opt.tabstop = indent_value
vim.opt.shiftwidth = indent_value
vim.opt.expandtab = true

-- 只在windows下使用neovide
if vim.g.neovide then
    vim.o.guifont = 'Maple Mono SC NF:h12'
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
