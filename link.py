import os
import shutil
from pathlib import Path
from datetime import datetime

repo = Path(__file__).parent
home = Path.home()

is_windows = os.name == 'nt'
timestamp = datetime.now().strftime('%Y%m%d%H%M%S')

# source是repo已有的文件（夹），target是要建立链接的路径
def backup_replace(source: Path, target: Path):
    if target.exists(follow_symlinks=False):
        newname = target.stem + timestamp + target.suffix
        target.rename(target.parent.joinpath(newname))
    target.symlink_to(source, target_is_directory=source.is_dir())

def command_exists(command: str):
    return shutil.which(command) != None

if __name__ == '__main__':
    # wezterm
    backup_replace(repo.joinpath('wezterm.lua'), home.joinpath('.wezterm.lua'))

    # nvim
    if command_exists('nvim'):
        winpath = home.joinpath('AppData', 'Local', 'nvim')
        unixpath = home.joinpath('.config', 'nvim')
        path = winpath if is_windows else unixpath
        backup_replace(repo.joinpath('nvim', path)

    # # vim
    # if command_exists('vim'):
    #     folder = 'vimfiles' if is_windows else '.vim'
    #     backup_replace(repo.joinpath('vim'), home.joinpath(folder))

    # # pwsh or powershell
    # if command_exists('pwsh'):
    #     pwsh_win = home.joinpath('Documents', 'PowerShell')
    #     pwsh_unix = home.joinpath('.config', 'powershell')
    #     pwsh_profile = pwsh_win if is_windows else pwsh_unix
    #     backup_replace(repo.joinpath('powershell'), pwsh_profile)

    # # starship
    # if command_exists('starship'):
    #     backup_replace(repo.joinpath('starship.toml'),
    # home.joinpath('.config', 'starship.toml'))

    # # gitconfig
    # if command_exists('git'):
    #     gitconf = '.gitconfig'
    #     backup_replace(repo.joinpath(gitconf), home.joinpath(gitconf))

    # # windows-terminal-preview
    # if command_exists('wtp'):
    #     wt = repo.joinpath('wt.json')
    #     wtp_settings_path = home.joinpath('scoop', 'apps',
    #                                   'windows-terminal-preview', 'current',
    #                                   'settings', 'settings.json')
    #     backup_replace(wt, wtp_settings_path)
