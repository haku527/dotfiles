local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Tokyo Night Day'

config.keys = {
  {
    key = 'F11',
    -- mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- 只在scoop pwsh安装后应用
    res = wezterm.glob('pwsh', os.getenv('USERPROFILE') .. '/scoop/apps')
    if #res ~= 0 then
        config.default_prog = { 'pwsh.exe' }
    end
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
