$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-jre8.0.492-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jdk8.0.482-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.21-ca-fx-jre8.0.482-win_x64.zip'

$checksumurljre = '45cd9b7204b53ac9205c6d08b7e74312752f1c59becfaa741650ece357cdd5c5'
$checksumurljdkfx = 'd3742c5ff212861f46aa41df26de70a61424cb7751f5b3a286a0105b7733f76d'
$checksumurljrefx = 'e72a6c9b53b6ee970a49dedd2b7c9223760f2acf0421b68515989c7c20946f53'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.94.0.17-ca-jdk8.0.492-win_x64.msi'
    checksum64     = 'c0370e3efc0a0bd6f3294cd8c7bf032fba36ea6541fbb8baf9058510ee507ee2'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
