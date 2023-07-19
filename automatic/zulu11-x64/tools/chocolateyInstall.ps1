$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.66.15-ca-jre11.0.20-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jdk11.0.19-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.64.19-ca-fx-jre11.0.19-win_x64.zip'

$checksumurljre = '82ff9efeac45ef5fb21362aee9ca6a0c03d47e5d9e15a377cf897080c7c6783c'
$checksumurljdkfx = '344b42bbaf68259db1b9bb13b30b2837b29f20812631c821675487e9f4616828'
$checksumurljrefx = '36b987f3d209b76109f3904ccae69570b6abe6667421b79b5969dc354c35e690'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.66.15-ca-jdk11.0.20-win_x64.msi'
    checksum64     = '4723a8dfa9f626e250f0c68ff6a6d2aea7463aabada77c484519c2b512091f76'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
