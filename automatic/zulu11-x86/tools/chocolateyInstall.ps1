$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-jre11.0.29-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-fx-jdk11.0.28-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-fx-jre11.0.28-win_i686.zip'

$checksumurljre = '6728cf9727ea4bdb6513598227009482eeacd664a5c91337b1785811d34fd7d9'
$checksumurljdkfx = '465190388e01cd916af774aea989f9bf35efdc3f7a5cbc250a200d102706f47d'
$checksumurljrefx = '5f48442fe5081f61926120d07bca3cb5d956ce694c0616c4e4e33e77aba0c856'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-jdk11.0.29-win_i686.msi'
    checksum64     = '95af48b26da3196d6515c1e7e81bcc1d466c4d577e23f3876ada1cc8ebf873db'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
