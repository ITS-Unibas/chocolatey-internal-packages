$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-jre8.0.372-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-fx-jdk8.0.362-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-fx-jre8.0.362-win_x64.zip'

$checksumurljre = 'b64ce34be1806983f2414ad7e6dbde8d2dd816f5bce58e4ef6ed88bdac2466e4'
$checksumurljdkfx = 'd364ef78d146169a5d6aa1511eb47b1ca3be058773ac820f3b42b93f165a9634'
$checksumurljrefx = 'd6d6bc1129093250fe7565409bfac51d78ee9b15779d8c39890a400f2cc91e27'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-jdk8.0.372-win_x64.msi'
    checksum64     = '1bb63988bf2bad3c81fbad613d80cfed2b91379ff8e114dc72048639a726f58d'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
