$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-jre8.0.512-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-fx-jdk8.0.512-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-fx-jre8.0.512-win_i686.zip'

$checksumurljre = 'f437f56841685619bdef579571d9f2f05fad905f40e13a0210f9f2dc6382428d'
$checksumurljdkfx = '76bfdcfd4e51eb6abaf81bfc111ba6f93877f3179d7b2ceec04932ba4614cc77'
$checksumurljrefx = '4dbf9bc9a9eb6f3c82b4d72a1d2ebfe6a3216130a074523eea89695e9bf1b267'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.111-ca-jdk8.0.512-win_i686.msi'
    checksum64     = 'f15ba5bced6f9b49d1294855ab634f2c47c1b49bab504dd0b3df138a6f9903d5'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
