$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.53-ca-fx-jre8.0.275-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.53-ca-fx-jdk8.0.275-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.53-ca-fx-jre8.0.275-win_i686.zip'

$checksumurljre = '686ca448143298caaec3d96834612912e3fd6014e06342ce4da6d1900225af55'
$checksumurljdkfx = 'a381b4011100ef8de755e80546be1ec8fa5746ed47c6b331a4d637821ec57415'
$checksumurljrefx = '686ca448143298caaec3d96834612912e3fd6014e06342ce4da6d1900225af55'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.51-ca-jdk8.0.275-win_i686.msi'
    checksum64     = 'f5ddf6de555b0c4fd1cf249a43a61b3aedd129a2dfd4e8997c6cd3b24e1403cd'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
