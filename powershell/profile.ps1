New-Alias -Name n -Value neovide

$env:POWERSHELL_TELEMETRY_OPTOUT=1
$env:POWERSHELL_UPDATECHECK='off'
$env:FZF_DEFAULT_OPTS='--color=bg+:#D9D9D9,bg:#E1E1E1,border:#C8C8C8,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#719899'

Import-Module Terminal-Icons
Set-TerminalIconsTheme -DisableColorTheme

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#
#function OnViModeChange {
#  if ($args[0] -eq 'Command') {
#      # Set the cursor to a blinking block.
#      Write-Host -NoNewLine "`e[1 q"
#  } else {
#      # Set the cursor to a blinking line.
#      Write-Host -NoNewLine "`e[5 q"
#  }
#}
#
#Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
# Invoke-Expression (&starship init powershell)
