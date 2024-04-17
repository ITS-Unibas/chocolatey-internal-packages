$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-jre11.0.23-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-fx-jdk11.0.22-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-fx-jre11.0.22-win_i686.zip'

$checksumurljre = '8df75c7971493d758670581017d771f312509e0ebccd4d28e1789238839919fd'
$checksumurljdkfx = '3faad1206e4c2afa720358ce8f5a34f67820f0b267c108c45e74b45027be0d6b'
$checksumurljrefx = 'f3a7a3cbd403f857df37eb635dbe535e23dc64396475b360a7f5089bc77a85c6'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-jdk11.0.23-win_i686.msi'
    checksum64     = '17dc05decbd52efc4e3710d891fe3499e7550f07b2738dfc7a5b65253fde1d0e'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
