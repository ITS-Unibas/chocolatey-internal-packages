$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jre11.0.14-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-fx-jdk11.0.13-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-fx-jre11.0.13-win_i686.zip'

$checksumurljre = '7a763a5385125c226f7a29739f73d295c49040c73bd83ca3b579f11689b476f3'
$checksumurljdkfx = '3301957d6c063704b3c2c2f49659be7eb8d429c7f51426577beb94b306fa44cd'
$checksumurljrefx = '572d77f1417f37832a509cc546446d2d8ee1f6ecec5fa5fdaed614e98cf71f5f'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jdk11.0.14-win_i686.msi'
    checksum64     = 'd411f7dc91bc9d8c9167be5e985e3e8a7ad590a85cc5e01f411e2464cf33e514'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
