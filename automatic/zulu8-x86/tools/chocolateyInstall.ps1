$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-jre8.0.402-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-fx-jdk8.0.392-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-fx-jre8.0.392-win_i686.zip'

$checksumurljre = 'd502cb399edb5c13be269914b67f2d7a99e544502286eecfb062e17db6275d94'
$checksumurljdkfx = 'f260030ac8581893b223e122c382b7f78284e5132179d8211b26d510a65ffaf2'
$checksumurljrefx = '26576eb5e7bc35355b23c619d3324f0e01eb0d7b1951b0c7bfacb85127795438'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-jdk8.0.402-win_i686.msi'
    checksum64     = '7b0f9d1e010909b411c368957328f5a92582330afcd9fe1258713f823f332f1f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
