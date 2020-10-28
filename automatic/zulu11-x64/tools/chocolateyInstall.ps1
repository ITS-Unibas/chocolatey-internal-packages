$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-jre8.0.272-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jdk8.0.265-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jre8.0.265-win_x64.zip'

$checksumurljre = 'edd983bb4e7accc58e5c62a2196db5f03682b8d51f96248aa0cf97c32b5c956a'
$checksumurljdkfx = '36c78ca8f7d8aa5140d6f16bf9fc1f065395179b18f27fec92d7823e86441e48'
$checksumurljrefx = '582b4a269382257f116e6e9497ad5728906b8b75562e86c2d05d71230ce8e134'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.50.0.21-ca-jdk8.0.272-win_x64.msi'
    checksum64     = '544398b748013b8ce0b8b0c02c61e0aa5836cf38bc8e50eea98bcda9065b894c'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
