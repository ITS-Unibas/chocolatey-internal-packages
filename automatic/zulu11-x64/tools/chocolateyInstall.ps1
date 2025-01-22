$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jre11.0.26-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jdk11.0.26-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jre11.0.26-win_x64.zip'

$checksumurljre = 'f0c7fc209134b95ab204b701ce04de375745a3dfadc3ac84d79dc18fbb0f1570'
$checksumurljdkfx = 'aaf554f10cc67ae1dcc324f3c2b195643bf19ef661d556e2bddee02c98a02988'
$checksumurljrefx = 'f0c7fc209134b95ab204b701ce04de375745a3dfadc3ac84d79dc18fbb0f1570'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jdk11.0.26-win_x64.msi'
    checksum64     = '533331da589626ea4de94a1bd6640feb02c5f991bd26b7d54904ddbff83bb26e'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
