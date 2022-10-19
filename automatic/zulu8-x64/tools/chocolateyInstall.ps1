$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-jre8.0.352-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-fx-jdk8.0.345-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.64.0.19-ca-fx-jre8.0.345-win_x64.zip'

$checksumurljre = '876ea103ddb8b814dbdb4db1669fca184d22579ecd73fdd0292c034108222001'
$checksumurljdkfx = '58c85189e53f86b0283e419b5523e885feed77a2ba3e4f40203111eade68ea0d'
$checksumurljrefx = '6f2b07a138f80da7f11b34b68f6a4ce25d5d6394bcc69280e79990d59a409059'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-jdk8.0.352-win_x64.msi'
    checksum64     = '2bde6893659a9950d1140a5c4d886b7f0a991325dd49e958f9dfe691fca958aa'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
