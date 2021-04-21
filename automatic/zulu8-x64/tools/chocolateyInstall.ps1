$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-jre8.0.292-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-fx-jdk8.0.282-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-fx-jre8.0.282-win_x64.zip'

$checksumurljre = '5c66a05f496721ab50171d1e50f2e0fccdc70049586466659f76f7e5306615d9'
$checksumurljdkfx = '7485f7cd22ff03ad95dc3479e1c9c73ad647c4e8d59b63a96a415503abf7f7f0'
$checksumurljrefx = '781c890fd8355a547ca50f1b90ab59da3ec589588a3b515eca89904948d4e162'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-jdk8.0.292-win_x64.msi'
    checksum64     = '04e6386179dc12fa023c8aa3cf626a1746ee59e6a89c1413af76511185133c8b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
