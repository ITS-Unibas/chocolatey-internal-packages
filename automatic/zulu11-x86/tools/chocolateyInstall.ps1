$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-jre11.0.12-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-fx-jdk11.0.11-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-fx-jre11.0.11-win_i686.zip'

$checksumurljre = '38d32d574fcf7ce6ed02a8be471216c6cf8ecb903d6679599534ee095c13832c'
$checksumurljdkfx = 'cf89ba5b88ba2210487918a54d6ca45203c0c75d75819672db811371ce731479'
$checksumurljrefx = '188680cc88cd94f0c4f2f50a747ea25717cc118b199370e42cf1ada689cb87cd'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-jdk11.0.12-win_i686.msi'
    checksum64     = '9af5dda4a1f01fe452e7568fe9c6d08f823cf169630ec341c1c2a66c115f4d39'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
