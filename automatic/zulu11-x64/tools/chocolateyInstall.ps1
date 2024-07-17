$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-jre11.0.24-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-fx-jdk11.0.23-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-fx-jre11.0.23-win_x64.zip'

$checksumurljre = '927f12921d0b7537760d8b3f5de26b128352f7592e8dc3bb5b993a608620f49a'
$checksumurljdkfx = 'b06368f30f849c46cf9da2026182133212741db664a27a27f4c83b14366f89fe'
$checksumurljrefx = 'a6b51d33fcc1fa41ef51b5ceb410585a3675bfb01f73af8360353330e0a2049e'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-jdk11.0.24-win_x64.msi'
    checksum64     = 'fc747cf3984fc49b32ea63a81a52679a3f796f74b3a396e2211bcc6bd92d8ff8'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
