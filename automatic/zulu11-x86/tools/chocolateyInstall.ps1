$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jre11.0.19-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jdk11.0.19-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jre11.0.19-win_i686.zip'

$checksumurljre = 'e29ac224208a8a1d98b0d608bb5507715cd3871bbe2ba080624dc9bfe59f3d10'
$checksumurljdkfx = '5ae5694c9242037ded0210099d9ef26d6e1c562e4f49fdbdee893a2b492c7c0f'
$checksumurljrefx = 'e29ac224208a8a1d98b0d608bb5507715cd3871bbe2ba080624dc9bfe59f3d10'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-jdk11.0.19-win_i686.msi'
    checksum64     = 'a6b28cf4e40a1500a1522e80613d972cccdb2c7610181a902d6b36aa85f6fe66'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
