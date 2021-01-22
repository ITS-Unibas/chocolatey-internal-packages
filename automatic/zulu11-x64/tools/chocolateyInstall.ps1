$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-jre11.0.10-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-fx-jdk11.0.9-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-fx-jre11.0.9-win_x64.zip'

$checksumurljre = '4ada48f53b3162b28500e0639465df557d97d146ae7d6c1da0112628d159ecba'
$checksumurljdkfx = '107476101f71312ffad44ca42582cb6c8e4c9e31febe68ab25c922ab93b00112'
$checksumurljrefx = '5d1523d039cf883e59143cd204d9705aec0c62f3f0dc6cea981a20ea0d6aad17'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-jdk11.0.10-win_x64.msi'
    checksum64     = '133d79339f6a981a25a0d812a5c33b48d700d160f0cad9a50fe930e51d0d9df8'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
