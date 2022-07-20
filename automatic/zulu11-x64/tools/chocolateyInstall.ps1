$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.58.15-ca-jre11.0.16-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-fx-jdk11.0.15-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-fx-jre11.0.15-win_x64.zip'

$checksumurljre = '238b0d608f47ef1daf41c2103b3bb98cab3227e8f4636a108740d71b3710c77e'
$checksumurljdkfx = 'cefe04577ff107a3cf8342a349c48dd059a6f517271f9d05b661e2857f6b8e72'
$checksumurljrefx = '3572bd4857fde572c724e0028541fd6bd5bb4cce76557c74022307942c33ce38'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.58.15-ca-jdk11.0.16-win_x64.msi'
    checksum64     = '50679ed5a7c42ac734a0729dbdacd8b285e24c20d4f0b227a2b32adcf3454b40'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
