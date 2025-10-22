$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-jre11.0.29-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-fx-jdk11.0.28-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-fx-jre11.0.28-win_x64.zip'

$checksumurljre = 'b9ceb2a380c783ae0f3bec7ce9432bb2c10a30d47712feadac94d6420bc57e54'
$checksumurljdkfx = '68525315456e1b5da5d1ddac9d8053865f69330795cd9882a20beea1e98a27ea'
$checksumurljrefx = 'c8b7a95503559fdde59cf9a29af87b6ac04014b7e9e069bf7d19af78adec9c84'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-jdk11.0.29-win_x64.msi'
    checksum64     = 'a4f1cbeab150c4f6690f0e3e3c598af3949994aafa086d9cd9185ae855492cbe'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
