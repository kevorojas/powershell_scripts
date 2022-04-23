
$commonPrograms = @('googleChrome', 'lightshot', '7zip','firefox')
$advancedPrograms = @('git', 'notepadplusplus','docker-desktop','minikube','kubernetes-cli','kubernetes-helm','obs-studio','vscode')

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

foreach ($program in $advancedPrograms) {
    Install-programs ($program)
}
