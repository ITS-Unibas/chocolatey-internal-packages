$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-jre8.0.512-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-fx-jdk8.0.512-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-fx-jre8.0.512-win_x64.zip'

$checksumurljre = 'a07b4d154aebe5ea610fa6caa5bcaa2a858b3ae5c5b13d9162aa0f98675b26b1'
$checksumurljdkfx = '39d5ebf2ee7a87ab5eb475f6bd52d0b60333ec70fc71fffdeb1d5ac22661bda9'
$checksumurljrefx = '1ff9615ca584d617f40286d8f0ac5af6fffa9f3d6b547a3be11430f5f0b69f60'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.201-ca-jdk8.0.514-win_x64.msi'
    checksum64     = '76fa9ec81ef3d0c41cf9e143f31648b58309fa3499a47e8bf9c16999510d5d52'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
