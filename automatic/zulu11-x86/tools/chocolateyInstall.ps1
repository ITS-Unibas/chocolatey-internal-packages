$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-jre11.0.9-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.41.23-ca-fx-jdk11.0.8-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.41.23-ca-fx-jre11.0.8-win_i686.zip'

$checksumurljre = '104f1cc437313dfd7f116a8926fdadd3f19517553becc897454111f27fbcd5aa'
$checksumurljdkfx = '1063a43fb23b9662dac03bd3ea016251c9db5b2f1a6924a33eaef17dbe58d9ce'
$checksumurljrefx = '7a953141d9d05e1ecfc969915c26c3c0ac879d50aa57b65e467ebe6545501210'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-jdk11.0.9-win_i686.msi'
    checksum64     = '1d4369cae4e44e13e4d443f8a95bb6dbb74fd08b0de42916234120b67461934a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
