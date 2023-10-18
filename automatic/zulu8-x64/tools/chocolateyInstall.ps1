$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-jre8.0.392-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-fx-jdk8.0.382-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-fx-jre8.0.382-win_x64.zip'

$checksumurljre = '9eeaf2939fa92172d5f12a3210b0570be9b6a02ea419d401caa35e67b4a47efd'
$checksumurljdkfx = '09bec3ef4eef77028086e3be1216c3305787c79f97ded516d204eac85548eaf3'
$checksumurljrefx = '41c3d5bdd81fc052082927cbf6169da25a8f7fca4d0a0b14db89837efcbe5e7d'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-jdk8.0.392-win_x64.msi'
    checksum64     = 'b50ad8098f6cd5571b3fa268d7c88b7dc6cf38b23e601723d3698cbc965f81b6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
