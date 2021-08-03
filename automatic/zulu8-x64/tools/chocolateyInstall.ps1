$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jre8.0.302-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jdk8.0.302-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jre8.0.302-win_x64.zip'

$checksumurljre = '89c714f23e1c03f96552b39a9bf94da2025333cb11f094659191f49c9082dfb5'
$checksumurljdkfx = '9f6ac415dfcb615078b19cb0304be020b10c1b160e900166bbc993dafade494a'
$checksumurljrefx = '89c714f23e1c03f96552b39a9bf94da2025333cb11f094659191f49c9082dfb5'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jdk8.0.302-win_x64.msi'
    checksum64     = 'f35809cbf8ef4454fe923bc3785c2755faeaea3dc0b43cfb91c8f2c0573e149f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
