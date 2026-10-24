$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.92.109-ca-jre11.0.33-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-fx-jdk11.0.32.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-fx-jre11.0.32.1-win_i686.zip'

$checksumurljre = 'f320f9d2216a3286acf91c833e3f91476e79f0e7806f771fd8f9426217054131'
$checksumurljdkfx = '92cb0b2c563901713cb73c7bcf59434e1828b0d9bf23f488ed0545f12b1ee427'
$checksumurljrefx = 'dd61b5203a2b7e8c658c012be3c458f60e75023d352052af901ab4bed4d78552'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.92.109-ca-jdk11.0.33-win_i686.msi'
    checksum64     = '1d66eaccfce2b2c6f8879f43938683e55c3280a93052b7603c15028ff15e9c03'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
