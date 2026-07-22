$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-jre8.0.502-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-fx-jdk8.0.492-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-fx-jre8.0.492-win_x64.zip'

$checksumurljre = '41ea7a75c89b1fddbdde73c1cb7356ae34217598a782923f578dd2e54df4bd11'
$checksumurljdkfx = 'd257d206aa6e3e1b37fb3c40b9dec5bc54f867dffbbcaa9b13550531c84a282a'
$checksumurljrefx = 'bb369e24051eb2f3829b8691c3bcca278a921adcfd06d20b411a4601ee348732'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-jdk8.0.502-win_x64.msi'
    checksum64     = 'ff21ecd637b57d077f101826fd99db1ea73b933a20799c2a7b57e1709a48daf0'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
