$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-jre8.0.265-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jdk8.0.265-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.48.0.53-ca-fx-jre8.0.265-win_x64.zip'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx

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
