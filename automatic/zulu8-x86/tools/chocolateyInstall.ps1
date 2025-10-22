$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-jre8.0.472-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-fx-jdk8.0.462-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-fx-jre8.0.462-win_i686.zip'

$checksumurljre = 'c914d994ed134b5da2128a085bc193d82ecdbb1d29412907dda32b3cdc7f8108'
$checksumurljdkfx = '81b726bc5eaf57b74bca1ff720a8499f1850415af19be350404f21b403a92e45'
$checksumurljrefx = '78df2e6b1ee8412b18aa6c3599349091bdbcceb96d9610f0c352b3acb1c2ad2c'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-jdk8.0.472-win_i686.msi'
    checksum64     = '9dc12e52cdffc9866bdf9d45581a667a799f39a5714b4249169b78d8a9b34f63'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
