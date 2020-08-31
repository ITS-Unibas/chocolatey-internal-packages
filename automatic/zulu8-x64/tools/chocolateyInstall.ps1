$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jre8.0.265-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jdk8.0.265-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jre8.0.265-win_x64.zip'

$checksumurljre = '4a923de91b33c3d33176bb3bdebf4b28e3e1af6f725fd9c5f913deba1c4957e0'
$checksumurljdkfx = '36c78ca8f7d8aa5140d6f16bf9fc1f065395179b18f27fec92d7823e86441e48'
$checksumurljrefx = '582b4a269382257f116e6e9497ad5728906b8b75562e86c2d05d71230ce8e134'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jdk8.0.265-win_x64.msi'
    checksum64     = 'b291a35afc72bfc942d4ca6dd639a1500f4fd1fec5bc38db986d6f7535b1a419'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
