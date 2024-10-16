$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.82.0.21-ca-jre8.0.432-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-fx-jdk8.0.422-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-fx-jre8.0.422-win_i686.zip'

$checksumurljre = 'ca596beff616d3b0e8d562cc0875ff61d2cac629aabafaafec4a72b2d1577340'
$checksumurljdkfx = '302e2e1d3a936748836fd5e3b8d79db1c5b1fbaa887c8aee9e42fdc23cfbf6e8'
$checksumurljrefx = 'ad20c2346171bc5c51fe3d4675146dc14ac11c772b57afc2fbf3ec8c8e8398a4'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.82.0.21-ca-jdk8.0.432-win_i686.msi'
    checksum64     = '15eb57517483e86b61255972b5875f4b401d0d3bc5e03467afd79347bec6e92f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
