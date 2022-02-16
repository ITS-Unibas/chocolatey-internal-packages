$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jre11.0.14.1-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jdk11.0.14.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jre11.0.14.1-win_i686.zip'

$checksumurljre = '51a283ffcd0f2fd24a616895966f9dd776f4fc7f1554de4fd1de10c78c8a03dd'
$checksumurljdkfx = '586cbffc1d0d389f6ea624a04dada01f9abb60010eed3ff6b956fd0c7d4aca3a'
$checksumurljrefx = '51a283ffcd0f2fd24a616895966f9dd776f4fc7f1554de4fd1de10c78c8a03dd'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-jdk11.0.14.1-win_i686.msi'
    checksum64     = '3089f95a6e4e841437e84830870db28bc15e86b6f871f6bf086c2d4f89de9c3f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
