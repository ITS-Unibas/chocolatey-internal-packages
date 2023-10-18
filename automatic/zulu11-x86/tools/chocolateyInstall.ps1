$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-jre11.0.21-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jdk11.0.20.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jre11.0.20.1-win_i686.zip'

$checksumurljre = '91ae78c663380cc703a939745639ff44e0e87fb537d8bf85b001bba026e200ec'
$checksumurljdkfx = '720e52009e78f1e80039eee561f2ab97645fb19a21e0f46a428b11658539e064'
$checksumurljrefx = 'dc1a86751bd33f78929dbc1214a12a189c556dcfa918eaf75c03deeb2f65ceb7'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-jdk11.0.21-win_i686.msi'
    checksum64     = '808bee10661985639d22642fd04ed93302820c1cd2506ee464c86a0fe9f458ef'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
