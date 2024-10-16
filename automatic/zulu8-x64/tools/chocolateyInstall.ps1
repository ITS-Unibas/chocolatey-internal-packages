$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.82.0.21-ca-jre8.0.432-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-fx-jdk8.0.422-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-fx-jre8.0.422-win_x64.zip'

$checksumurljre = '14c2dd7bd40531b12b97264778066eda4b9ffc07537a428209261ea69b507e88'
$checksumurljdkfx = '929ca57ffe5c75282776c87dd789b33ceb74f334de234abcad0b138b7ed33325'
$checksumurljrefx = 'fdefe734e00d20587fc85f0bc25e8f4c6d800b3a1f730f8d8029c9601819bc83'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.82.0.21-ca-jdk8.0.432-win_x64.msi'
    checksum64     = '453f665eff06404694b637291cde490683a0142ca73cb77b82398582b00f9a63'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
