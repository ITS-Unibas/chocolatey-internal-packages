$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-jre11.0.23-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-fx-jdk11.0.22-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.70.15-ca-fx-jre11.0.22-win_x64.zip'

$checksumurljre = 'add7ba896272d76386ccc0a4b106a3a0a11c11aa5aa2a850634dab4b50c1e3b8'
$checksumurljdkfx = '27007f3be94fc6f496c68f99f69123a56b37c29e11c0f1c15f482e20eeb9966a'
$checksumurljrefx = '4fb2998854f95b352cef0a08b450302ffd28efc9c25734417ae5a3be58fcea91'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.72.19-ca-jdk11.0.23-win_x64.msi'
    checksum64     = '042722e945f26dff7b10271f4bc513a1a71a9d1abf746623a556d5b43a36f329'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
