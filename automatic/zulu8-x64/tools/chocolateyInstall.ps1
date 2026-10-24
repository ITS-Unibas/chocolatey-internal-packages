$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.107-ca-jre8.0.512-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-fx-jdk8.0.504-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-fx-jre8.0.504-win_x64.zip'

$checksumurljre = '885eb900690de5041597ca19972cbed85dc282b01d12b8ae6af91c85d484034c'
$checksumurljdkfx = 'fea91cc21ed8a8a874bb3f9cdb69d9c7a136f729449a41ea409671edd7739f36'
$checksumurljrefx = 'a8710b6033d1d05cfaa637304be3ecf7945994a7a6eb0a8fdb8f8be98aabfcf7'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.98.0.107-ca-jdk8.0.512-win_x64.msi'
    checksum64     = '0b41f0aa5acf844be60d78785cf8e812a7d0da193e071b7b79d58575c15294dd'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
