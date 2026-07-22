$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-jre11.0.32-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-fx-jdk11.0.31-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-fx-jre11.0.31-win_x64.zip'

$checksumurljre = '7a9998963ea449b647fb57a7bad425639ff50f7c0e08bd5f00572b6486ccac86'
$checksumurljdkfx = '7d68100d56e722b9dbb5af4e725dbc3beb5b1d3a073cbafca93343cf265a8d36'
$checksumurljrefx = 'b26feb5d1d5c114e17061ddb8f1cb4a114057325679d64bcaf448a199906d9e1'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.90.19-ca-jdk11.0.32-win_x64.msi'
    checksum64     = '1817a1019cc9bf6aa30127bedde60dbb6410bae32f2221a3d8ad1514e2035ff4'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
