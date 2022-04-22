$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-jre11.0.15-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jdk11.0.14.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.54.25-ca-fx-jre11.0.14.1-win_i686.zip'

$checksumurljre = '51f55129d9eb9abb99b688464f5618024d4081bff37d0376f59e87a251f2acc4'
$checksumurljdkfx = '586cbffc1d0d389f6ea624a04dada01f9abb60010eed3ff6b956fd0c7d4aca3a'
$checksumurljrefx = '51a283ffcd0f2fd24a616895966f9dd776f4fc7f1554de4fd1de10c78c8a03dd'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-jdk11.0.15-win_i686.msi'
    checksum64     = 'b9a3695946468c3d460b3af562963ecf40a621aefc5b8657658d3c2dd92c8a28'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
