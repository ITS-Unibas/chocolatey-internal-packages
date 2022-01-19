$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jre8.0.322-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-fx-jdk8.0.312-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-fx-jre8.0.312-win_x64.zip'

$checksumurljre = '0bf6264e0417a941cea29bd9a96567100cb54229a666db88cb875bdf5367941e'
$checksumurljdkfx = '564aca576120b35e776f7b46b24a381a3e361d5e6f700e0b735042084703dae0'
$checksumurljrefx = 'e66401426f3e725a7e28dc2b110f38c1250c2d98ba144e71d096b4dee62a3765'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-win_x64.msi'
    checksum64     = 'ff965fad5fd7b74d3f347cfbfe4b7cb8b4e1b1e8ef46ecd089f494faecb4e30d'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
