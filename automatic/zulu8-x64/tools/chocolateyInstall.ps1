$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jre8.0.442-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jdk8.0.442-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jre8.0.442-win_x64.zip'

$checksumurljre = '33e2bdaa83d8b94de315592239a38d2e1c4f6097c0795b3269c09dd30d6e30ef'
$checksumurljdkfx = '544a396c7666dec0ece86e9bdd170495689436c3d840885af9434970b5b80ae3'
$checksumurljrefx = '33e2bdaa83d8b94de315592239a38d2e1c4f6097c0795b3269c09dd30d6e30ef'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jdk8.0.442-win_x64.msi'
    checksum64     = '08d950d8269d686aa6160c712281cca68e74e94d04ce4943d101e94f77a01f73'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
