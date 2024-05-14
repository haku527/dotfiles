# 程序或命令是否存在
function Exists {
    param (
        $Command
    )
    return $null -ne $(Get-Command $Command)
}

# 建立符号链接，如果目标已存在则重命名
function NewLink {
    param (
        # 源头
        [string]$Source,
        # 符号链接所在路径
        [string]$Link
    )

    if (Test-Path $Link) {

        # 重命名的后缀，精确到秒
        $timestamp = Get-Date -Format 'yyyyMMddHHmmss'

        $parent = Split-Path -Path $Link -Parent
        $name = Split-Path -Path $Link -LeafBase
        $extension = Split-Path -Path $Link -Extension
        $newName = Join-Path $parent $name $timestamp $extension
        Rename-Item -Path $Link -NewName $newName
    }

    New-Item -ItemType SymbolicLink -Path $Link -Target $Source
}

if ($MyInvocation.CommandOrigin -eq 'Runspace') {
    # # 关闭错误信息显示
    # $defaultAction = $ErrorActionPreference
    # # Write-Host $defaultAction
    # $ErrorActionPreference = 'SilentlyContinue'

    if (Exists('scoop')) {
        Write-Host 'exist'
    }

    NewLink('~\AppData', '~\Desktop\appdata')

    # # 恢复错误信息显示
    # $ErrorActionPreference = $defaultAction
}
