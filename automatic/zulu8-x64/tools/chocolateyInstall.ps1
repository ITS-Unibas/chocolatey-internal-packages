$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jre8.0.482-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jdk8.0.482-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jre8.0.482-win_x64.zip'

$checksumurljre = 'e72a6c9b53b6ee970a49dedd2b7c9223760f2acf0421b68515989c7c20946f53'
$checksumurljdkfx = 'd3742c5ff212861f46aa41df26de70a61424cb7751f5b3a286a0105b7733f76d'
$checksumurljrefx = 'e72a6c9b53b6ee970a49dedd2b7c9223760f2acf0421b68515989c7c20946f53'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jdk8.0.482-win_x64.msi'
    checksum64     = 'ed2ac87592b2f3a67daf387b2e79343ab3cfb4033adaab85a716314005248dcb'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
