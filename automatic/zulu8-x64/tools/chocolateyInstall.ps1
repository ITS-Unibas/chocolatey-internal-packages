$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.19-ca-jre8.0.362-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jdk8.0.352-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jre8.0.352-win_x64.zip'

$checksumurljre = '72a1339d15097d7a72bc171204b0c61fba76a79b170ed1d45641b7cef2dfd0e8'
$checksumurljdkfx = 'ac698862afd7bd57b6aa6d9b872b6a85170e067c463c414cc551ec1829a68d9b'
$checksumurljrefx = '988db78540b748d61db8cd103024dac9728ca0799de23b94ca37a9da9c5d2a11'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.19-ca-jdk8.0.362-win_x64.msi'
    checksum64     = '1006cfb668f7f0a76d920858b89ea21e73c76b511c3ce58f3fdeda82ca0a38b3'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
