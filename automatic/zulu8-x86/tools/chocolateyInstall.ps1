$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.107-ca-jre8.0.512-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-fx-jdk8.0.504-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-fx-jre8.0.504-win_i686.zip'

$checksumurljre = 'cb7c4fe8d444e062f11ffba69f76b77fdcb5c7a38bb98f6e658e18be86945a43'
$checksumurljdkfx = '989b3477b1c1f54a147e60177585dfd0c557d245309c85ffbc8a6e8e8b701273'
$checksumurljrefx = '39d55382fac480dd99e4f8ffb201f9cec2ddd8825bc3097b1381b33d273301ac'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.107-ca-jdk8.0.512-win_i686.msi'
    checksum64     = 'f95eea125895cc0292837d43c9ee105227f357f064c94f49041f9b5650f07f88'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
