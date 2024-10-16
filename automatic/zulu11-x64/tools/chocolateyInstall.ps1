$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jre11.0.25-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-fx-jdk11.0.24-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-fx-jre11.0.24-win_x64.zip'

$checksumurljre = 'f603000402cacec2941e00d55bd371a4c6044dbd0e3fdbfc3cd85e51902091d3'
$checksumurljdkfx = 'd7b534ccaf211cd5fcc2ebdd55f441eaf202a6cbe357d5891d7e6bb10bb696c2'
$checksumurljrefx = '606dd94193853cb121f99744c57b6a3c531d2874ec2d7a5b43348f007a5b5672'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.76.21-ca-jdk11.0.25-win_x64.msi'
    checksum64     = '8e976c3d7d1cf9299e683508d3f4c631460b673cd7760c853db87aee8c602ac0'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
