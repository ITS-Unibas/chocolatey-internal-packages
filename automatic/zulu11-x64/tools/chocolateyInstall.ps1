$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jre11.0.11-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-fx-jdk11.0.10-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-fx-jre11.0.10-win_x64.zip'

$checksumurljre = '03a78e5aca9dc77006ecf85b3c79e5342e15b89dfd0995768ab86939fe04f42e'
$checksumurljdkfx = '87d3f605611f2b809ae422ffc4b9063fa9c818657bd04bbd5a6db3d63d893568'
$checksumurljrefx = '48583fa54c4e65b7f54cdf9d031e41b6c4438c17d8c2f0c47ad47a08986b4b4d'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jdk11.0.11-win_x64.msi'
    checksum64     = '559d362d1b75cf75025c2b6b73c2bae682d4aa2376028c995ee5244121f6db33'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
