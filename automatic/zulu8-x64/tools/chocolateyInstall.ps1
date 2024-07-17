$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-jre8.0.422-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-fx-jdk8.0.412-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-fx-jre8.0.412-win_x64.zip'

$checksumurljre = '8131edf523457203168976bb7b2aa1bd10d3d38ed0746019bea4cf6cc0610912'
$checksumurljdkfx = 'fbeaea2e1d26c55ea7f17a33b6925aa25a43d46dca3d6871b104eae67a9cc9cd'
$checksumurljrefx = '9138165d8ce1876597c35b56567dd2e51a18913e8f8c63832a556c999c203478'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.80.0.17-ca-jdk8.0.422-win_x64.msi'
    checksum64     = '3ef967348bc083d895be18d0a0958ce4bfba552e9e2c27dc780fc5b31eb00ed7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
