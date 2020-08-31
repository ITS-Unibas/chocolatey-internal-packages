$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=&ext=zip&os=windows&arch=x86&hw_bitness=64'
$urljdkfx = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jdk&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=64'
$urljrefx = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=64'


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
