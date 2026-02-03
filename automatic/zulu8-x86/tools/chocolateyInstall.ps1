$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-jre8.0.482-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jdk8.0.482-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jre8.0.482-win_i686.zip'

$checksumurljre = '4ec67c300c4c1924a57e0ccd6dbf118ef6c64d16ab6f871cab256cd465aaae22'
$checksumurljdkfx = '4da56fcb10bf1f6be5574bf57c28b1cbed7d0db03a2f6b05c378c0ccf9cb8d58'
$checksumurljrefx = '10081f9d104c6c3fb3a7a1d30173e65f9c97ff4338094ca6badece60548ec080'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-jdk8.0.482-win_i686.msi'
    checksum64     = 'ebb54c8d04bc1f79531326c6e3167fe97ca6bb42975554a548f719cd37ea8cac'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
