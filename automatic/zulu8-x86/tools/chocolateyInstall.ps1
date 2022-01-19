$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jre8.0.322-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-fx-jdk8.0.312-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-fx-jre8.0.312-win_i686.zip'

$checksumurljre = '307c477e098ba09e5942b0ae9b3e28d5762ca850fc598eec356c2b4ad7204b6f'
$checksumurljdkfx = 'c32de5f3045f3c85b674942b43fa41cc9b9bf28c83eee71319485f64620dab6e'
$checksumurljrefx = 'ba26bfe3c0e91e9ecd020f7f3ecc009b4d47bfca34c9784b987b3825b9a6b133'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-jdk8.0.322-win_i686.msi'
    checksum64     = '9ae5c17f1c7bff2485b87400da2293df9cb6d6cfffb63a87498bf7d9fe65d23d'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
