$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-jre8.0.332-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-fx-jdk8.0.322-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-fx-jre8.0.322-win_i686.zip'

$checksumurljre = '5a3ce83b091dbeb5bbeeaa13cd779ac15f0d39ee670f709ef2304889b8c5f699'
$checksumurljdkfx = '1ed6287889ecc90b14fd90abcff7114122216a04abfbb3de09182b9f0466fba2'
$checksumurljrefx = '657d06fb7d1a7e0b83ea27bc126d4a800ad36af917d3c88e6ffa9e92394765b1'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-jdk8.0.332-win_i686.msi'
    checksum64     = 'f33e7048e7a16dbc3f24fbfefb45e079ff264e0b0527482486848aac07bda667'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
