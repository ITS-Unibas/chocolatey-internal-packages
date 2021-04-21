$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-jre8.0.292-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-fx-jdk8.0.282-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.52.0.23-ca-fx-jre8.0.282-win_i686.zip'

$checksumurljre = 'bd69dc7a81b89c2e573bcc7bbc0d2a2937bcb51979679c9f0cb42d702491dea7'
$checksumurljdkfx = '6b99948caa308a8527d82d32d6a77fb790d18e2a33fc1e73a5aa082656e92fbf'
$checksumurljrefx = '7f784c3bfe38907e6c7c5b7ecee5a9e0ed321c9a02b2c91e3489087390ec2cc0'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.54.0.21-ca-jdk8.0.292-win_i686.msi'
    checksum64     = '362d55515e38c1b8b4553aa476bf9a4057228451496548e1febab6e2ca111337'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
