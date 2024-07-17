$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-jre11.0.24-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-fx-jdk11.0.23-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-fx-jre11.0.23-win_i686.zip'

$checksumurljre = 'f3ca6c8c5eb19ce23d6600f1bf6318e71766c68cb550502b4fe78999037f59ab'
$checksumurljdkfx = '5353e78ea3f82f902129c277dc5e3232537de9cd57c99cd694b1263218979fdc'
$checksumurljrefx = '78e9b94fe7d0be75baa274ec49d2cf23acf9ba73cae58079340b8b3608da8dff'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.74.15-ca-jdk11.0.24-win_i686.msi'
    checksum64     = 'dfeaac5e43a96dd9e7ca4cce7049fa3631f08c92d703e401d5cf1c1139d15572'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
