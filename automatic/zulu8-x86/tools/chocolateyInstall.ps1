$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-jre8.0.422-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-fx-jdk8.0.412-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-fx-jre8.0.412-win_i686.zip'

$checksumurljre = '12f045808c3e8be2d5e2425013cc2bc6ef2f5a30fb692258a512a4796974b14a'
$checksumurljdkfx = 'fca68d0d34cde7b6b1ca5cd3117f7a231dcf55cb2b472c5064d24ffa1c8b56d5'
$checksumurljrefx = '5f22fb58367239e43a1cecf8c013bc1a173ec9e12fd5c0a7d9c0ed4644d0cd10'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-jdk8.0.422-win_i686.msi'
    checksum64     = 'd779d9608e32cf9551025464b454e7c999a0d8f6e4ff55d4b77b25cb5746e6cd'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
