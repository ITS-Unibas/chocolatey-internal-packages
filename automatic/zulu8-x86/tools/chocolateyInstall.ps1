$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jre8.0.265-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jdk8.0.265-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jre8.0.265-win_i686.zip'

$checksumurljre = 'c731423f7703a0b36906a13f502cea6cb49a173fdbfbdf24e085c8295154b19b'
$checksumurljdkfx = 'fcbffa7ed49585f05b15042197745127f9e0ade759526a958dc89fb8bfea807e'
$checksumurljrefx = '1f39893e5904a8cf5a177fed6764cb49384f9dd31e3ade624de0135de97e93c6'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jdk8.0.265-win_i686.msi'
    checksum64     = '0ed80f94a265d227a6a8f666f6d6c1984949f95fcad793d3b57cc6f93fb548ab'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
