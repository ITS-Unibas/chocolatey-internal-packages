$ErrorActionPreference = 'Stop';

$packageName = 'nis-elements-viewer'
$softwareName = 'NIS-Elements viewer*'
$installerType = 'EXE'
$silentArgs = 'C:\PROGRA~2\COMMON~1\INSTAL~1\PROFES~1\RunTime\11\00\Intel32\Ctor.dll,LaunchSetup "C:\Program Files (x86)\InstallShield Installation Information\{A1521295-C203-49F7-945F-EEAD9C7B72FF}\setup.exe" -l0x9  -removeonly /s /sms /f1C:\temp\setupUninstall.iss /f2c:\temp\uninstall.txt'

$uninstalled = $false
$local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

[array]$key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) `
  -ErrorAction SilentlyContinue `
| Where-Object { $_.DisplayName -like "$softwareName" }

if ($key.Count -eq 1) {
    Start-Process RunDll32 -ArgumentList $silentArgs -Wait

    # Uninstall-ChocolateyPackage -PackageName $packageName `
    #   -FileType $installerType `
    #   -SilentArgs "$silentArgs" `
    #   -ValidExitCodes $validExitCodes `
    #   -File "$file"

} elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
    Write-Warning "$key.Count matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | ForEach-Object { Write-Warning "- $_.DisplayName" }
}
