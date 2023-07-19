$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-jre8.0.382-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-fx-jdk8.0.372-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-fx-jre8.0.372-win_x64.zip'

$checksumurljre = '4f8e1cb552dea8c542330e716ad6a4394fbc7d8fbffa39b85affbf6841e84edd'
$checksumurljdkfx = 'bb20e0ab3a6a02c53c1c3790001f42da94cb2412ac4600409122bd1a5a63ab18'
$checksumurljrefx = 'b32407de6a0a31cab85da24e8c44e68da19c90a2c0a179d257324371cc18a6fb'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-jdk8.0.382-win_x64.msi'
    checksum64     = 'dae25b6f6fe0ed1dfeec0f5010eab0b955dda1527a484e8a35e6c87246236578'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
