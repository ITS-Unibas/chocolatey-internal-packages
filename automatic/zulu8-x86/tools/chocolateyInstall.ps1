$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-fx-jre8.0.345-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-fx-jdk8.0.345-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-fx-jre8.0.345-win_i686.zip'

$checksumurljre = 'e6e184d6f6afbcb8ea56ac5da8e45c1ade5fa7e27c6b1bef3c4a37e5b5c18025'
$checksumurljdkfx = '04ff4941ccb3707296fb4b7bb374b181a7bf0ac3d6413915ef67baeae975ffaa'
$checksumurljrefx = 'e6e184d6f6afbcb8ea56ac5da8e45c1ade5fa7e27c6b1bef3c4a37e5b5c18025'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-jdk8.0.345-win_i686.msi'
    checksum64     = '35c8a5ad2094f9cd6d83c46a524b62de62a8537505cfc952d7e5370afb249e29'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
