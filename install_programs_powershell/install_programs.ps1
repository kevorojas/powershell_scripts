
$commonPrograms = @('googleChrome', 'lightshot', '7zip', 'zoom', 'bitwarden', 'openvpn')
$advancedPrograms = @('git', 'notepadplusplus', 'sql-server-management-studio','nodejs','visualstudio2019community','fiddler','netfx-4.8-devpack')

function Install-programs{
    param ($program)
    try {
        choco install -y $program
    }
    catch {
        Write-Host $_
    }        
}

if (!(Get-Command choco)){ #Check if Chocolatey is installed
    Write-Host "Chocolatey is not installed in this PC. Proceding to download it ..." -ForegroundColor Cyan; Write-Host ""
    Set-ExecutionPolicy AllSigned
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));refreshenv
}

foreach ($program in $commonPrograms) {
    Install-programs ($program)
}