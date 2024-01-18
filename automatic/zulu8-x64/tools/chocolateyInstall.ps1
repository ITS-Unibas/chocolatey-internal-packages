$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-jre8.0.402-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-fx-jdk8.0.392-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-fx-jre8.0.392-win_x64.zip'

$checksumurljre = '05baa5619c523684308e71a4ead4f2b37e783ba41e42c6d121a11e2d3a2c5b92'
$checksumurljdkfx = '9253c4776f06a1076707a91a619b97ed042e6117bf5f96b1c8b96c3f80e15639'
$checksumurljrefx = '0f7d9e5e344396430a31dc12c41566fc3982d33336b7a68fe44556ce870d08f5'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-jdk8.0.402-win_x64.msi'
    checksum64     = 'be9484f06df10b5b2552a62ae309153e0872fbc61126e2f39fb93850e3ed53fa'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
