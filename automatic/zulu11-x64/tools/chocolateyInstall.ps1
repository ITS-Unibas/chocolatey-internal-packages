$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-jre11.0.32.1-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-fx-jdk11.0.32-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-fx-jre11.0.32-win_x64.zip'

$checksumurljre = 'ebb669b9d09a87c327e1af32d47a64d51ac65914bba65732fe9e0d2dd31c3e0f'
$checksumurljdkfx = '75401c35352fde32f01910f13a66d4b4c4de0855da9a67b95bbcb93ad795a898'
$checksumurljrefx = 'eb49e0c841edc4ddb7aaa366fc9466e69ca9e1789a4681d3d0e1ba5500885d42'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-jdk11.0.32.1-win_x64.msi'
    checksum64     = 'f6e4437e2c31fb8a35930c957cf2da8894d16ef3978f88d7b19b069195dcd39b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
