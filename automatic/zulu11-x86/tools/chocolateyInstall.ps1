$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jre11.0.11-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-fx-jdk11.0.10-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.45.27-ca-fx-jre11.0.10-win_i686.zip'

$checksumurljre = '1da216d94c9028cc3cbfbd92a543e9afcca6cbf4cba78b62604e27b73671ed4c'
$checksumurljdkfx = '6b1a6dd685133021e53a2e1789748f08e092cfd7d2e7adf9e3d22866a52d14a4'
$checksumurljrefx = '10b2d8a5eff4e6b9a1b93dac1479312a96e976ebfe4480d3aa859aaafdc2bfc3'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.48.21-ca-jdk11.0.11-win_i686.msi'
    checksum64     = 'abeeb75f652647f2674a7ff09a171ba6845a05d7ba94cc331712b6a02b3b79b7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
