$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-jre11.0.32.1-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-fx-jdk11.0.32-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-fx-jre11.0.32-win_i686.zip'

$checksumurljre = '0503954e7fa29eb3e58f639e2df9c48213ac5a16680d15268e3098023aaed0f6'
$checksumurljdkfx = '322912d1e0a7fa4fa98445f80d9d09e3bd96edac2c233d35b07be874be8cad23'
$checksumurljrefx = 'ef1e356e1e83916da8b1d19f7245a1d38dcd690d069679256164fc5e429f0a1b'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-jdk11.0.32.1-win_i686.msi'
    checksum64     = '5e21c817cd0a06064b077e09f782e9843cbc540d2cabf52dcbac03ae47493407'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
