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
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-jdk11.0.33-win_i686.msi'
    checksum64     = '7eb5327b45e94f085fa20b2792d4e5f84b4b9de84bdd697eebd7e2a75381a1e2'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
