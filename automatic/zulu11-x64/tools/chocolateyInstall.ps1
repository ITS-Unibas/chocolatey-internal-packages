$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jre11.0.20.1-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jdk11.0.20.1-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jre11.0.20.1-win_x64.zip'

$checksumurljre = '6d0806825ff1d91e3f4891f99663add755b1cac202a48d9e0daf2c3ef1ee0c7c'
$checksumurljdkfx = 'de464121bd653853bfb958af204ce2ae6d36673afbe73cdf1bcbbcfe6dbe50b6'
$checksumurljrefx = '6d0806825ff1d91e3f4891f99663add755b1cac202a48d9e0daf2c3ef1ee0c7c'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jdk11.0.20.1-win_x64.msi'
    checksum64     = '323d78ededa25f8aa08fc4742d7627c4047e09c25ea41ff7c63c0fbd5178186b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
