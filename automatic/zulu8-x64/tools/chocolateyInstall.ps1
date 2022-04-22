$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-jre8.0.332-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-fx-jdk8.0.322-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.60.0.21-ca-fx-jre8.0.322-win_x64.zip'

$checksumurljre = '685840ec35420e3aef61e46f866bcfc547d509d36bf8fcb0b8ee49bc8497a1af'
$checksumurljdkfx = '47a1ac321048862a5bdee09af7d162a0ccffad590e164b8926c572e24274c976'
$checksumurljrefx = '0e0b2abe3bd0faaedd2357802201e855880528ac42b314f265928f2055ae1897'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-jdk8.0.332-win_x64.msi'
    checksum64     = 'd5f69af9d33764acaa22112fc5ed3682db908107bf05fcc3d0294e0d5ce682ff'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
