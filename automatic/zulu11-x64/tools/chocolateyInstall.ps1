$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-jre11.0.15-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jdk11.0.14.1-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jre11.0.14.1-win_x64.zip'

$checksumurljre = '0bceff389f0c9e19abacfa0d092905aef0219db9843441e1eeb316cfe062dc23'
$checksumurljdkfx = '727729a0a66d488664beabf28afecc122ea131a9ea2d3b628fc89a9878d7d32d'
$checksumurljrefx = '8e065dcc0575b6c5aa96cf120337eba81bc3993f1b6308df70cb5c3a35735f99'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-jdk11.0.15-win_x64.msi'
    checksum64     = 'aff8394baf8e3ad75b95be016db37686714690083d45542c437da8db94795b6c'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
