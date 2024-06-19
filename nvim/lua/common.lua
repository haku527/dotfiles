-- vim.o
-- global options
-- vim.g
-- set global variables like g:xxx = 1 in vim9script
-- vim.wo
-- window-local
-- vim.bo
-- buffer-local

local v = vim

local encoding = 'UTF-8'
v.g.encoding = encoding
-- vim.o.fileencoding = encoding

local indent_value = 2
v.o.tabstop = indent_value
v.bo.tabstop = indent_value
v.o.softtabstop = indent_value
v.o.shiftround = true
-- in normal mode: > for add a indent, < for remove a indent
-- shiftwidth for > < spaces
v.o.shiftwidth = indent_value
v.o.expandtab = true
v.bo.expandtab = true

-- padding spaces when cursor moves to window boarder
local scrolloff = 4
v.o.scrolloff = scrolloff
v.o.sidescrolloff = scrolloff

v.wo.cursorline = true
v.wo.signcolumn = 'yes'

v.opt.clipboard = 'unnamedplus'

-- highlight column on no.80 char
v.o.colorcolumn = '80'

v.wo.number = true
v.wo.relativenumber = true

v.o.ignorecase = true
v.o.smartcase = true
v.o.incsearch = true

v.o.autoindent = true
v.o.breakindent = true

v.o.autoread = true
v.bo.autoread = true

v.o.backup = false
v.o.writebackup = false
v.o.swapfile = false

-- enable mouse support in normal and visual mode only
v.o.mouse = 'nv'

v.o.splitbelow = true
v.o.splitright = true
v.g.completeopt = "menu,menuone,noselect,noinsert"

v.g.mapleader = ','
