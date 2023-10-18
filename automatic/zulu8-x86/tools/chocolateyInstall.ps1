$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-jre8.0.392-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-fx-jdk8.0.382-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.72.0.17-ca-fx-jre8.0.382-win_i686.zip'

$checksumurljre = '77bfd53beb61f4800f82d72aa4ad0cd71a6f70906a0602b9c0835fdb1ef55ac4'
$checksumurljdkfx = 'f5d16a27e7897c766d2f66bd7aa05b528737cf2768d7bca8c6a6437f450c2ab8'
$checksumurljrefx = 'c6d974a233302924fd13e12c6103fd14163d62db111b62cc64316a5d7af130de'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.74.0.17-ca-jdk8.0.392-win_i686.msi'
    checksum64     = '68d8011c2da56e6c0828fcdc33f58f2bf145ae69c6d147f45c855f1140928f93'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
