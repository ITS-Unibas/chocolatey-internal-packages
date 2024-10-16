$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jre11.0.25-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-fx-jdk11.0.24-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-fx-jre11.0.24-win_i686.zip'

$checksumurljre = '8d571e201633db1fd9df8125f7e02283c589beece87b73cf3bd2c6d8e1d31e6b'
$checksumurljdkfx = '48703a92c87d39b3eb9bad6ae092a3e99c4e2e9e68630ae92b9e4e35d219bab2'
$checksumurljrefx = 'ab253060aac7d802cbf9660910b29eeb11c5f81a24a727b455f226649b8786e8'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jdk11.0.25-win_i686.msi'
    checksum64     = '29e197e660ccf5105eb545e1a98829442e484142ec810ce1ccbc3545cde6a3de'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
