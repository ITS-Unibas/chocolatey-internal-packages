$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-jre11.0.13-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-fx-jdk11.0.12-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-fx-jre11.0.12-win_x64.zip'

$checksumurljre = '2e47801540673486818832d79ef83c8da8c5759dc063e01e2bd8e1d4ba25bc76'
$checksumurljdkfx = 'a6499900f8898290660212a7457e39ba3d6105caf5647dc4e08f48d66b918d23'
$checksumurljrefx = 'ad8ad19b908a32ca8e3a62be43a955cd5dce32dc79c7ec7c1b8db51f4b8cb2d9'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-jdk11.0.13-win_x64.msi'
    checksum64     = '24b9bd6d7a6047a0e776ad67ccd73643b4ca90508a61227cf05fe7040c486a91'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
