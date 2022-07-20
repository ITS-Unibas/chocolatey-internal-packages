$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.58.17-ca-jre11.0.16-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-fx-jdk11.0.15-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-fx-jre11.0.15-win_i686.zip'

$checksumurljre = '2a79edc7506b27cc50138fb77a168a347c8cceae0651441aa4aa975d0ce07817'
$checksumurljdkfx = 'fd9d6851527931ced6e84d0bca6e34fe2b9579d0a13e8d1cec26bee22ecdca23'
$checksumurljrefx = 'a68fad8e66ca7bc6360ef4942dc2db91bc20814146884ad87f8c0dce64ba5e65'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.58.17-ca-jdk11.0.16-win_i686.msi'
    checksum64     = '0dbcc4658d23b1a8a51c2088927034119252ac66100c6d792f9c824f61c9b6cd'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
