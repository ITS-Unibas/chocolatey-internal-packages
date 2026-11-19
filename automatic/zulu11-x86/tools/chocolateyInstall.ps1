$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-fx-jre11.0.33-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-fx-jdk11.0.33-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-fx-jre11.0.33-win_i686.zip'

$checksumurljre = 'dd206fa0c844696fb2edd616c5ebab33fab06a4bb72dfd9ba84bfe5987b6768c'
$checksumurljdkfx = '96da12306129fd91d59b99a244bb15647654353554a49e0531a31de08b845af1'
$checksumurljrefx = 'dd206fa0c844696fb2edd616c5ebab33fab06a4bb72dfd9ba84bfe5987b6768c'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.92.201-ca-jdk11.0.33.1-win_i686.msi'
    checksum64     = '2ebc0754407ff21e9ee4fe7d730f024c4b1c050dfc9cf9c9b530cebda330aa56'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
