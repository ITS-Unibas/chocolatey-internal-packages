$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-jre11.0.31-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jdk11.0.30-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.86.21-ca-fx-jre11.0.30-win_x64.zip'

$checksumurljre = 'd9a11d077337c753dad15b8841f7f5743f8b14a22c2d17d41ce32be0c7bae573'
$checksumurljdkfx = 'c4dcaaa1b65494ab510acbbd93a9a9bf7f0e33b0378c4427ce6914dd8fd30afe'
$checksumurljrefx = 'b280b4813a200e71d415b9cbc988d8625a4a70430c43243167f997d0987d9f54'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.88.17-ca-jdk11.0.31-win_x64.msi'
    checksum64     = 'e25cc0b33801b23c47ffed123851b83a6d1abb3b81f23ce5b3084d1c15e5c6bd'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
