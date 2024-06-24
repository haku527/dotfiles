local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Everforest Dark (Gogh)'
  else
    return 'Tokyo Night Day'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.keys = {
  {
    key = 'F11',
    -- mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

config.font_size = 10.5
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- 只在scoop pwsh安装后应用
  local res = wezterm.glob('pwsh', os.getenv('USERPROFILE') .. '/scoop/apps')
  if #res ~= 0 then
    config.default_prog = { 'pwsh.exe' }
  end
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    '思源等宽',
  }
end

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  if os.execute('which zsh') == true then
    config.default_prog = { 'zsh' }
  end
  config.font = wezterm.font_with_fallback {
    'Fira Code Nerd Font Mono',
    'Source Han Sans CN',
  }
end

return config
