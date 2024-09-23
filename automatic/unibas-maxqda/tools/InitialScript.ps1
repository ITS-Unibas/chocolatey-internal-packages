$softwareName = 'maxqda*'
$local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
[array]$key = Get-ItemProperty -Path @($machine_key6432, $machine_key, $local_key) -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "$softwareName" }
if ($key){
	foreach ($i in $key){
		$string = $i.UninstallString
		$uninstallString = $string -replace '(.*){(.*)}','$2'
    	Start-Process msiexec -ArgumentList "/X {$uninstallString} /q" -ErrorAction SilentlyContinue
    }
}

Write-Host "Now waiting for 10 Seconds before it starts the installation of 2022"
Start-Sleep -s 10

