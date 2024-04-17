$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jre8.0.412-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-fx-jdk8.0.402-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.76.0.17-ca-fx-jre8.0.402-win_i686.zip'

$checksumurljre = '3d43890b324e5d8a9215a81da6755ac29eb6345e63971742f69c8bcfc12a8ec1'
$checksumurljdkfx = 'df37ed0652b09c226ba961b6ef4dd344fdecba954bd169db0c3cb00044f2a040'
$checksumurljrefx = '7edca76684e7d2e78c51acd21707f59829b3becf886e24cbd8cbad69a9254cd2'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jdk8.0.412-win_i686.msi'
    checksum64     = '804efe7b92b478b421408864c867f78c81fd897617b3ecf90c1de4e9c309859e'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
