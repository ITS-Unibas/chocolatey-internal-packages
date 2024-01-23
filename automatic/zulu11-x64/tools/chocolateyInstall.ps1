$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-jre11.0.22-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-fx-jdk11.0.21-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-fx-jre11.0.21-win_x64.zip'

$checksumurljre = '2d74c1e9c576dfe3fd1dcab9cff9377c3361ace3932a5c6bd73dacd3a0bf3186'
$checksumurljdkfx = '767080f72d45dcae6723e398f5e6b0c4912b6e147016bbc5798b85338951ddbe'
$checksumurljrefx = 'b0f5eb35ddbed40e956782817693169aa456d1d9d18145d25fcb94079699bbed'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-jdk11.0.22-win_x64.msi'
    checksum64     = '927d736c041a444ca833fb3587df3055c19045414223367222ad9a7974d83e0e'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
