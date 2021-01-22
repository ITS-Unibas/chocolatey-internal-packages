$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-jre8.0.282-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.53-ca-fx-jdk8.0.275-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.53-ca-fx-jre8.0.275-win_i686.zip'

$checksumurljre = '431ccb80c7c99082c6ff94053f2ac423e9820faceb500e2c199693d5192bcf07'
$checksumurljdkfx = 'a381b4011100ef8de755e80546be1ec8fa5746ed47c6b331a4d637821ec57415'
$checksumurljrefx = '686ca448143298caaec3d96834612912e3fd6014e06342ce4da6d1900225af55'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-jdk8.0.282-win_i686.msi'
    checksum64     = 'c43fa3a694ea952e4468150276fca31f2debeae7fed2cdd8f52613a2417a102c'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
