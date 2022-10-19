$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jre11.0.17-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.58.23-ca-fx-jdk11.0.16.1-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.58.23-ca-fx-jre11.0.16.1-win_x64.zip'

$checksumurljre = '673f7852eb539ebb05917a855ce32dfc8e75772ae6861e2253760754f3d2541d'
$checksumurljdkfx = 'ddf99db7f2e02269b6f27fcafb2867aacec1de53577b4e496fe02fa224fe313a'
$checksumurljrefx = 'edd2fb28114246dfb73c91e483eed1c03cfd46bac7dd5f8b8fbb5e801d1713d2'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jdk11.0.17-win_x64.msi'
    checksum64     = 'd8d591d315e927350562c9ab92d3122ae2e392dd07553c0fb1eccca4b45cba0c'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
