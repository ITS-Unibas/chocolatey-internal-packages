$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-jre8.0.382-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-fx-jdk8.0.372-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-fx-jre8.0.372-win_i686.zip'

$checksumurljre = 'de0fd23e004aa411268bf66dc6591880de14b66c56b6d4550271e6637df78cca'
$checksumurljdkfx = '7f04ce9fbd337bc8f9d1053634e7034d0d3a679ffe595b553a14109203ef9ec6'
$checksumurljrefx = 'fe9be230f9650d73eb7c349989b79e7c7d8b098f3e4331421952450d9342dda3'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-jdk8.0.382-win_i686.msi'
    checksum64     = '03badd300616b9bb2202d6909b9d4243905938c6e14965f9984f6f1a859a2a65'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
