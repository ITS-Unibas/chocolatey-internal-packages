$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-jre11.0.32-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-fx-jdk11.0.31-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-fx-jre11.0.31-win_i686.zip'

$checksumurljre = '62fbac1ab7596ccc868d39aa513550e347bca5eb9bf4a6ee3ae5c49fc930c558'
$checksumurljdkfx = 'a41838be36de49bd3520a776bf6fd66c5d04d7859c7b58ff65ee1d7fc6bfe20e'
$checksumurljrefx = '585bb02003da474260507a4978bfe83e3f103a381b74e57152fa8ce102152bf8'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-jdk11.0.32-win_i686.msi'
    checksum64     = '5a1fcca608aa35a5d7f8640ff1274c9971c93f2cdbc0b7528e7e0036a50652bb'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
