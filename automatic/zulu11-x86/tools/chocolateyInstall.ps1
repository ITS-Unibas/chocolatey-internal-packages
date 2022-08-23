$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-fx-jre11.0.16.1-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-fx-jdk11.0.16.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-fx-jre11.0.16.1-win_i686.zip'

$checksumurljre = '7df030a2ae218b8f495e54a5837889583ae44bde144356e05816ed13d88edee8'
$checksumurljdkfx = 'ffce2d75e54d380655a78dd80ca61079629103701b802d4de4b2bd8488dd31c4'
$checksumurljrefx = '7df030a2ae218b8f495e54a5837889583ae44bde144356e05816ed13d88edee8'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-jdk11.0.16.1-win_i686.msi'
    checksum64     = '2a4b27b5f5e742b8e7af8ea2a05fa6747cb0772af27a706cbed7e48c46a37e82'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
