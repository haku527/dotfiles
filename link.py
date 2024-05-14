import os
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

# # python 3.11 兼容代码
# def backup_replace(source: Path, target: Path):
#     if target.exists():
#         newname = target.stem + timestamp + target.suffix
#         target.rename(target.parent.joinpath(newname))
#     target.symlink_to(source)


if __name__ == '__main__':
    # vim
    folder = 'vimfiles' if is_windows else '.vim'
    backup_replace(repo.joinpath('vim'), home.joinpath(folder))

    # pwsh or powershell
    pwsh_win = home.joinpath('Documents', 'PowerShell')
    pwsh_unix = home.joinpath('.config', 'powershell')
    pwsh_profile = pwsh_win if is_windows else pwsh_unix
    backup_replace(repo.joinpath('powershell'), pwsh_profile)

    # starship
    backup_replace(repo.joinpath('starship.toml'),
                   home.joinpath('.config', 'starship.toml'))

    # gitconfig
    gitconf = '.gitconfig'
    backup_replace(repo.joinpath(gitconf), home.joinpath(gitconf))

    # windows-terminal-preview
    wt = repo.joinpath('wt.json')
    wtp_settings_path = home.joinpath('scoop', 'apps',
                                      'windows-terminal-preview', 'current',
                                      'settings', 'settings.json')
    backup_replace(wt, wtp_settings_path)
