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
          theme = 'tokyonight',
          icons_enabled = false,
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
          comments = { italic = false },
        }
      })
    end,
  },
  {
    -- trim trailing whitespaces and empty lines
    "mcauley-penney/tidy.nvim",
    config = true,
  },
  {
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
})

--require('mason').setup()
--require('mason-lspconfig').setup()
require('lspconfig').pyright.setup{}
