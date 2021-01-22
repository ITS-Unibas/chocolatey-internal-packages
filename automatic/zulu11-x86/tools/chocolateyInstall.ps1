$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-jre11.0.10-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-fx-jdk11.0.9-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-fx-jre11.0.9-win_i686.zip'

$checksumurljre = '25da3915dbc203d92a7ad3febee1ec5cbdcd53ed357730c3ddadcd476917dea6'
$checksumurljdkfx = '2974b23fd543f43c0cca6abfb892118f1f781a79fa99f357eefc564f810b78a9'
$checksumurljrefx = '712975bd0637943967f1241938647e3f5f447de2ba2be04d4556ba255a656680'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-jdk11.0.10-win_i686.msi'
    checksum64     = '2dbcd769c2876ab749a5157ed7db1c78bb356da73ee4423a13095d9131909a2a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
