$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-jre8.0.312-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jdk8.0.302-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.56.0.23-ca-fx-jre8.0.302-win_x64.zip'

$checksumurljre = '81b3910a607d01f5e2faaae18781a08b083de396a3ee0594caa957f12d387b64'
$checksumurljdkfx = '9f6ac415dfcb615078b19cb0304be020b10c1b160e900166bbc993dafade494a'
$checksumurljrefx = '89c714f23e1c03f96552b39a9bf94da2025333cb11f094659191f49c9082dfb5'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-jdk8.0.312-win_x64.msi'
    checksum64     = '23cf7a397826d31795b85e286078ff443275a4f92cde987e4556ccaea99b3b0d'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
