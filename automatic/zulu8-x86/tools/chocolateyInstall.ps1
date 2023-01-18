$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.19-ca-jre8.0.362-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jdk8.0.352-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-fx-jre8.0.352-win_i686.zip'

$checksumurljre = 'd9e844e3e23678332a372b93b908144e08823c429f87418c9f455fe1ad14daba'
$checksumurljdkfx = '5939c17f52825ea75db509fe06a8b593d115eea6e05fd002cbd473f167ac7b01'
$checksumurljrefx = '29994f5ece1c4ad189bce11d6b69d8837d05dbbf6609d66998a24c2c6ca8aefa'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.68.0.19-ca-jdk8.0.362-win_i686.msi'
    checksum64     = '09171351b3726c7b145edd50a87641f0c52ea181a4b1ef194e194794148da1a6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
