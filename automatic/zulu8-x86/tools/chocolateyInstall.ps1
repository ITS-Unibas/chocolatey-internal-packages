$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-jre8.0.492-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jdk8.0.482-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jre8.0.482-win_i686.zip'

$checksumurljre = '355ba94dc8ca54c6cc968d5125039e03e34d1f5998afdb66c0fbd06e27fcbc40'
$checksumurljdkfx = '4da56fcb10bf1f6be5574bf57c28b1cbed7d0db03a2f6b05c378c0ccf9cb8d58'
$checksumurljrefx = '10081f9d104c6c3fb3a7a1d30173e65f9c97ff4338094ca6badece60548ec080'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-jdk8.0.492-win_i686.msi'
    checksum64     = '8cd12ab741b8d2589e0717472fa2cd13afbb953c5db8a5f9eb061c51b2fa54f7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
