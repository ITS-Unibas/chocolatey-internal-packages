$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jre8.0.412-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-fx-jdk8.0.402-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-fx-jre8.0.402-win_x64.zip'

$checksumurljre = '8403c90e0a0830b6ed4ad2b889961ba33d6937accb27e9f7a9ea12635677e1b6'
$checksumurljdkfx = '8841dbe4b1fb6c683c2f78163d8ce4963c7b9181784c60a63516e5655067157f'
$checksumurljrefx = 'bc64398a1c3ff52a818db495272ea0ded432e3239097a27295c7bd9bb8bfc9cf'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jdk8.0.412-win_x64.msi'
    checksum64     = '92e50ac5623b5302ba8868d26f19ae5f6b127ed1d4eef2d698347a66e3a15004'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
