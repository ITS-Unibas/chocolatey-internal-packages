$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-jre11.0.30-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jdk11.0.30-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jre11.0.30-win_i686.zip'

$checksumurljre = '766198d1753857d2d0a9b753b97db6eefa6ead8c1578b5a94d4374c175c01f60'
$checksumurljdkfx = '3b50bdb01bb08c1d5c8af9f71baa9fb1fada02baf6d6aaf8a2d39da2fb8dd6fc'
$checksumurljrefx = 'efa567bc924ff91fbf0ab533069a36a2af6aeaaca311687a2da2aca561d228a5'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-jdk11.0.30-win_i686.msi'
    checksum64     = '929af7a52dfb10335be6bc24218b020a5b08db17fcd0f0dab513648aed786215'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
