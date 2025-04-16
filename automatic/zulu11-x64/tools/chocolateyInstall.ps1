$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.80.21-ca-jre11.0.27-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jdk11.0.26-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.78.15-ca-fx-jre11.0.26-win_x64.zip'

$checksumurljre = 'ec235dc2134c39e6979a704622cf28f0f8fd596512ea474998cc72d4ddb8b799'
$checksumurljdkfx = 'aaf554f10cc67ae1dcc324f3c2b195643bf19ef661d556e2bddee02c98a02988'
$checksumurljrefx = 'f0c7fc209134b95ab204b701ce04de375745a3dfadc3ac84d79dc18fbb0f1570'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.80.21-ca-jdk11.0.27-win_x64.msi'
    checksum64     = '2b0fe7e8c0ce48833e179e25da813ba9671f1e03a7a512bbb273b03bdcdcd791'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
