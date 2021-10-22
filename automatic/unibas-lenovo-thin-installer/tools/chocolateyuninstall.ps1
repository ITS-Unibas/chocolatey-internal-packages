$ErrorActionPreference = 'Stop'
$packageName = 'unibas-lenovo-thin-installer'

$extractionPath = "C:\Program Files (x86)\Lenovo\ThinInstaller\"

if (Test-Path $extractionPath){
	Remove-Item -Path $extractionPath -Recurse -Force
} else {
	Write-Host "Lenovo-ThinInstaller NOT found under: $extractionPath. Software seems to be removed by other means!" -ForegroundColor Cyan
}