local v = vim

if v.g.neovide and jit.os == 'Windows' then
  v.o.termguicolors = true
  -- vim.o.guifont = 'Maple Mono SC NF' ..
  v.o.guifont = 'FiraCode Nerd Font Mono,' ..
    '思源等宽' ..
    ':h10.5:#e-subpixelantialias' ..
    ':#h-slight'
  v.g.neovide_refresh_rate = 120
  -- neovide padding的单位好像是像素，文档没写
  local padding = 4
  v.g.neovide_padding_top = padding
  v.g.neovide_padding_bottom = padding
  v.g.neovide_padding_right = padding
  v.g.neovide_padding_left = padding
  -- 按下f11切换全屏模式
  v.api.nvim_set_keymap('n', '<F11>',
  ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
