$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-jre8.0.272-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jdk8.0.265-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jre8.0.265-win_i686.zip'

$checksumurljre = 'c2bbdc68163f2fbb911e929f05a3b052587c7e79278d47f09efa895e4cffeb2a'
$checksumurljdkfx = 'fcbffa7ed49585f05b15042197745127f9e0ade759526a958dc89fb8bfea807e'
$checksumurljrefx = '1f39893e5904a8cf5a177fed6764cb49384f9dd31e3ade624de0135de97e93c6'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-jdk8.0.272-win_i686.msi'
    checksum64     = '4e4aeb8ede9b84731fab0107a5630c69c87f8bd104b15d63f9c1e92c9df53ba6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
