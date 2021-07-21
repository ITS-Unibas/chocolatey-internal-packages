$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.21-ca-jre8.0.302-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-fx-jdk8.0.292-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-fx-jre8.0.292-win_i686.zip'

$checksumurljre = '6b593447059545e4952218be90e00522c7c6680135ecf6f59af97519d239a367'
$checksumurljdkfx = '183b7322bb42dee32b77a72d126d6354551f1361a702fa4adccca8020bbaa94c'
$checksumurljrefx = 'eccb9a77ab5d26c7af2d91d394829d9c28e5ecc7d4f0abb75b41495391eab090'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.21-ca-jdk8.0.302-win_i686.msi'
    checksum64     = '96217bdb8cf2a8ddecf3208b9be6b5157890dc102d76398b6bc136362f1e0f2b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
