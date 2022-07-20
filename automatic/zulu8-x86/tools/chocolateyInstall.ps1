$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.15-ca-jre8.0.342-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-fx-jdk8.0.332-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.62.0.19-ca-fx-jre8.0.332-win_i686.zip'

$checksumurljre = '15c63b56a68a40d3891b5604df0e5f9aa2761705d3268aa6ea0ac07ff6c641c1'
$checksumurljdkfx = 'b42fc4cb01379732439e8d4b21770008885ce3c1ddead22720bd9dbaa719a553'
$checksumurljrefx = 'a7e5a7bf6240094336b6c294e6c65737c5aeecc5035d2ad75f9fe5d7b14683c9'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.15-ca-jdk8.0.342-win_i686.msi'
    checksum64     = '948b2757a3ee6d637139eb2423468ca7b4bc672001dc56db3b44fa5790c142cb'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
