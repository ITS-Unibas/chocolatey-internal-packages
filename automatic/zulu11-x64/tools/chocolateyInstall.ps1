$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jre11.0.19-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jdk11.0.19-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jre11.0.19-win_x64.zip'

$checksumurljre = '36b987f3d209b76109f3904ccae69570b6abe6667421b79b5969dc354c35e690'
$checksumurljdkfx = '344b42bbaf68259db1b9bb13b30b2837b29f20812631c821675487e9f4616828'
$checksumurljrefx = '36b987f3d209b76109f3904ccae69570b6abe6667421b79b5969dc354c35e690'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jdk11.0.19-win_x64.msi'
    checksum64     = '97f96caf20f8284b39d3a505cf9a9182e6dc2a0002778c389f9efb54784a8eac'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
