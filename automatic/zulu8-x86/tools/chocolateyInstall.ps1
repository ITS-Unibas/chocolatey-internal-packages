$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-jre8.0.362-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jdk8.0.352-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jre8.0.352-win_i686.zip'

$checksumurljre = '490a127ecb3995a0b9149195fdb856a30a8c7e14a203d7c72bdd7ff6a0a7baa7'
$checksumurljdkfx = '5939c17f52825ea75db509fe06a8b593d115eea6e05fd002cbd473f167ac7b01'
$checksumurljrefx = '29994f5ece1c4ad189bce11d6b69d8837d05dbbf6609d66998a24c2c6ca8aefa'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-jdk8.0.362-win_i686.msi'
    checksum64     = 'db6aefd2ec0f6969cc6297927c062d4ac70694212ebf60f8bef4ece544f11e23'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
