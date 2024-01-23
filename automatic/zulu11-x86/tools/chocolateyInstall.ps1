$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-jre11.0.22-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-fx-jdk11.0.21-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-fx-jre11.0.21-win_i686.zip'

$checksumurljre = '9523bd0c87ad0e17b888ff559ad07cdf1ae041d25393f897c033060a4974de86'
$checksumurljdkfx = '0e634d9343764e5e04c3a5192c233bbcdf5073b599ebfaeb29456d2cffa9113d'
$checksumurljrefx = 'eb2fa0895074b2d4964906679c0934f052c4ccb88a0ee2c7158752950e986a46'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-jdk11.0.22-win_i686.msi'
    checksum64     = '0f11497cd0560b1fe64274dc195cd3106234048b94391404a1a096f9c6349bf7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
