$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-jre11.0.21-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jdk11.0.20.1-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.66.19-ca-fx-jre11.0.20.1-win_x64.zip'

$checksumurljre = '8707f46874dd931e5c0b55ad47e53de572d6a5a717f5d35c3fca2122aa876b72'
$checksumurljdkfx = 'de464121bd653853bfb958af204ce2ae6d36673afbe73cdf1bcbbcfe6dbe50b6'
$checksumurljrefx = '6d0806825ff1d91e3f4891f99663add755b1cac202a48d9e0daf2c3ef1ee0c7c'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.68.17-ca-jdk11.0.21-win_x64.msi'
    checksum64     = '966307a6bd5b776ac8c3d8c97c1dab3013c0557af61ac75c1ab255a60c14e407'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
