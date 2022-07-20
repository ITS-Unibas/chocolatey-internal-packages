$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.15-ca-jre8.0.342-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-fx-jdk8.0.332-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-fx-jre8.0.332-win_x64.zip'

$checksumurljre = '548093521c3fb5c971401973e366d0e37035d98cc41410c6b476a82bdc3954ce'
$checksumurljdkfx = 'f3fdecaddb83c16b875ac181d60cb32fc1b6b0d81fccc0b455e9dbf3ea9f7ce3'
$checksumurljrefx = 'fcdc81bb7ee8f2ed2fe7871c5d15075c64d2a98bda0ab37e299b6c7e2271f1cc'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.15-ca-jdk8.0.342-win_x64.msi'
    checksum64     = '8d52115799bdd4d995f04a4a64ea4e748566595f3e07d6f54d1d92cddd94013a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
