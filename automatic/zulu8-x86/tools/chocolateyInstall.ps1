$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-jre8.0.312-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jdk8.0.302-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jre8.0.302-win_i686.zip'

$checksumurljre = '25d0f2b97245efb4bfbaea63700473f644f47411e88deee0e819d0b5b8eca503'
$checksumurljdkfx = '34878cc263cba20ecefa92dd997b5e5885b9437b85bae611c54612f051ba4756'
$checksumurljrefx = '9ad4a2bf9e11b5cc935df7aa86ddc2e23d41853942efe9ef6718821599b12b5b'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-jdk8.0.312-win_i686.msi'
    checksum64     = 'd511584e79e4eaeda72489b4257ee2bc215f63d2b098eefd61139d81992c5ac1'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
