$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-jre11.0.31-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jdk11.0.30-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jre11.0.30-win_i686.zip'

$checksumurljre = 'e1c05215ad8a30ebe32ce52be0a81cbc1d6f2c7061290b37ac90d0d47e8cec20'
$checksumurljdkfx = '3b50bdb01bb08c1d5c8af9f71baa9fb1fada02baf6d6aaf8a2d39da2fb8dd6fc'
$checksumurljrefx = 'efa567bc924ff91fbf0ab533069a36a2af6aeaaca311687a2da2aca561d228a5'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-jdk11.0.31-win_i686.msi'
    checksum64     = 'b1bff951bd2d58176fc0e1acc74223de0d72c3a08d599929108dfc0b56e11d38'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
