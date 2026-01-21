$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.86.19-ca-jre11.0.30-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-fx-jdk11.0.29-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-fx-jre11.0.29-win_i686.zip'

$checksumurljre = 'e932b58758cabeca606e2895ddfe931b68083f936b21720d10d4412eceaa4d76'
$checksumurljdkfx = '55b3dbcea5e0c5a20f8082c58edc455755ebf3ef7d207e0096bba089db99b034'
$checksumurljrefx = '11a6f74074de88dab7b248d269520ed02a88a1ed8599e38e374050a9e64099c3'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.86.19-ca-jdk11.0.30-win_i686.msi'
    checksum64     = '0a22e7e437b780dfc16b1a974ef98bbb402d96763d183088edc31dc4924a96f9'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
