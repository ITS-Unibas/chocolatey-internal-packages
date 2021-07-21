$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.21-ca-jre8.0.302-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-fx-jdk8.0.292-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-fx-jre8.0.292-win_x64.zip'

$checksumurljre = '4885567e6ca047e437b55c42919c20979bbe02cca2a3b66916e84b2b3f5df35c'
$checksumurljdkfx = '84efdbd536497f5f21ef4412e2045b637255d135be873ea05184f1f7924c3828'
$checksumurljrefx = '1158de7458620fbc0ceaddc4b754aedcbd869a1ce097f4b3ddb7a4b27a66c1ce'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.21-ca-jdk8.0.302-win_x64.msi'
    checksum64     = '89b39bc320ef09ee688c6884722ad6f3e1719c462ccfe8a4435b2f50d7ffccb4'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
