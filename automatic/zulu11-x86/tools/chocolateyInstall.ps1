$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jre11.0.26-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jdk11.0.26-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jre11.0.26-win_i686.zip'

$checksumurljre = '3e82256729e6ffd275c4a1d907a32157a2be62e69db456ac475b6d2a4a89f564'
$checksumurljdkfx = '83f30782c6bd743ad0ee25ee425a35b6bba1917de870882d474b4563a95f6621'
$checksumurljrefx = '3e82256729e6ffd275c4a1d907a32157a2be62e69db456ac475b6d2a4a89f564'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-jdk11.0.26-win_i686.msi'
    checksum64     = 'e019d2e41f5f2850d63c2c55fc05846ebd05aa2b627c22d507bba893619036d6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
