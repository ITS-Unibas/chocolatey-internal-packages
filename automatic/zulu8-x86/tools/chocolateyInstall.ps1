$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-jre8.0.462-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.86.0.25-ca-fx-jdk8.0.452-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.86.0.25-ca-fx-jre8.0.452-win_i686.zip'

$checksumurljre = 'c72c0bde8d9ce9f401c69ef400d99b53ab820838ff09a3ca73af49a3215cead4'
$checksumurljdkfx = '00f6876d32d8060a4ec4fd4354cf50c3cf8f9ca8f394dc1c623492c52325505c'
$checksumurljrefx = 'cbdabda1e0047239417b4ce64e9bceed6397f7e5652ddd345e5fc8b7c5b236ff'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-jdk8.0.462-win_i686.msi'
    checksum64     = '0a23cd3e05df81e5d8981d03a04582fe7c78b97c06741d3e6c1a53dd7678d823'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
