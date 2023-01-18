$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jre11.0.18-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-fx-jdk11.0.17-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-fx-jre11.0.17-win_i686.zip'

$checksumurljre = '17967bd58f4fce3a7f5c0ce108aee70731fbe9cc16c4bca103d774d717628259'
$checksumurljdkfx = 'd2f08e0afd2b2adb6a830f004308ec8e458874543ecfd00c2d422b36207e0058'
$checksumurljrefx = '7763daacb6d6d4aa395b397d85c5dcd4e669833fb3404e11884be9366ddddcbb'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-win_i686.msi'
    checksum64     = '7cf3e6fecbb79266b1138723bf5c8ca81b46285cc159cef7e5dce43c386b0bc2'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
