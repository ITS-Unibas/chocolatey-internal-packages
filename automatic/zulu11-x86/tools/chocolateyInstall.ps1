$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-jre11.0.13-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-fx-jdk11.0.12-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-fx-jre11.0.12-win_i686.zip'

$checksumurljre = 'e851f8adfb09c5a375562d4507c6d4385b7c822a5079974be0a31b729c9f5461'
$checksumurljdkfx = 'cfef8f133a56de786e9bb2b50bbc52403b4124a8dcfdd30411e5b989a20e72b9'
$checksumurljrefx = 'b588437b4863948d49837b2e7df2ba73ccc6cd344d3a5a0058cb5b886a97920a'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-jdk11.0.13-win_i686.msi'
    checksum64     = '5763f650697405fe6e4c297c5c5ac584c077d3903866335ab074a81aca7176fb'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
