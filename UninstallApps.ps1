# Desativa overlay pedindo para baixar o Xbox Game Bar quando abrir um jogo.
if (-Not (Test-Path "HKCU:\Software\Microsoft\GameBar")) {
    New-Item -Path "HKCU:\Software\Microsoft\GameBar" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "ShowStartupPanel" -Value 0

# Lista de aplicativos que serão mantidos e não desinstalados (whitelist)
[regex]$WhitelistedApps = 'Microsoft.WindowsStore|Microsoft.Windows.Photos|Microsoft.WindowsCalculator|Microsoft.ScreenSketch|Microsoft.DesktopAppInstaller|Microsoft.WindowsCamera|Microsoft.Paint|Microsoft.MicrosoftEdge.Stable|Microsoft.WindowsNotepad|Microsoft.XboxIdentityProvider|MicrosoftCorporationII.QuickAssist|WinRAR.ShellExtension|Microsoft.WindowsTerminal|Microsoft.VP9VideoExtensions|Microsoft.HEVCVideoExtension'

# Obtém a lista de pacotes de aplicativos instalados e remove os não listados
Get-AppxPackage -AllUsers | Where-Object {$_.Name -NotMatch $WhitelistedApps -and $_.NonRemovable -ne $true} | ForEach-Object { 
    Remove-AppxPackage -Package $_.PackageFullName -ErrorAction SilentlyContinue
}

# Remove pacotes provisionados que não estão na whitelist
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -NotMatch $WhitelistedApps} | ForEach-Object {
    Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue
}

Write-Host "Processo concluído com sucesso."

Stop-Process -Id $PID
