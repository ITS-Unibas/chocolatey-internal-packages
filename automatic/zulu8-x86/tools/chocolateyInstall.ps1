$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jre8.0.442-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jdk8.0.442-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-fx-jre8.0.442-win_i686.zip'

$checksumurljre = '41849dd044b277ac42e7654a62c15e60034536dbf799f53e227d514faa82c113'
$checksumurljdkfx = '16cd1f2a57c2edcacf35a18646079f275af16a4fc8f8242da7ab5ceaa45536e6'
$checksumurljrefx = '41849dd044b277ac42e7654a62c15e60034536dbf799f53e227d514faa82c113'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.84.0.15-ca-jdk8.0.442-win_i686.msi'
    checksum64     = '46f09c3e65f9079736db7362b9020ef008100f73ddc5ec9042ce48665c792bf5'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
