$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-jre8.0.502-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-fx-jdk8.0.492-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-fx-jre8.0.492-win_i686.zip'

$checksumurljre = 'a57713a71e10fa33124629985be33879dfcc05158495cc94f8fbb85d678aeec9'
$checksumurljdkfx = 'd2b83035a8a617e049c2b30ffd6a5a0002681b093de60a809f6a503574dce990'
$checksumurljrefx = 'eccdc87dc2fa4485f4c69429e7d7447f0c734f3b265cd205dd59d00e43e42dac'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-jdk8.0.502-win_i686.msi'
    checksum64     = 'f639eebbc85096e418b6ed63a235056eb654a8d6b8cd961c0b897cba0b161e49'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
