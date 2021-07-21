$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-jre11.0.12-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-fx-jdk11.0.11-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-fx-jre11.0.11-win_x64.zip'

$checksumurljre = '7e24abe35949a826e36c37b13c1f806b1bddcb01ee8b661b1a2f7cb2d8ec7f40'
$checksumurljdkfx = '645966ea63ca528c88c2ddfe6dfa8d4970991e9b69a9c585b7d5983af4b86217'
$checksumurljrefx = '422f937340f20d49aee86aff1352077e7d1c185c3ffcec5a4b1966144a613bc0'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-jdk11.0.12-win_x64.msi'
    checksum64     = 'd9f459aa7f8e1535ab8e674bb6c5716c49705a367e96f3c3fd7b19071f6f2e88'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
