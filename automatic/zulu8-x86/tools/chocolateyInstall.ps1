$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-jre8.0.372-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-fx-jdk8.0.362-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-fx-jre8.0.362-win_i686.zip'

$checksumurljre = 'dbaa9652adc8a48ec81238fb340509500788898b0fdda41383ffe7dcc00ecc10'
$checksumurljdkfx = '3ba15b5fb3a37867928a89e526ee45de398e4eb45862d815c14e6557233640b1'
$checksumurljrefx = '5587d3b397dd0d9cc8bc901fd8a800bade22c14f7ed9eed44c9bb0af12ff75fd'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.70.0.23-ca-jdk8.0.372-win_i686.msi'
    checksum64     = '8188e24dd5a30573b258c281c6ce3561d960c5b042fe78c401579c925e6f2a56'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
