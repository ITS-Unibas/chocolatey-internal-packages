$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.19-ca-jre8.0.482-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-fx-jdk8.0.472-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-fx-jre8.0.472-win_i686.zip'

$checksumurljre = '118ad2e29ae0f86d81b74d55e55af3dc5f696ccc051316e88a7e9113fa931bf8'
$checksumurljdkfx = '6a425207aa710a89628afeb99b44e9eb80fb9bc2deb9f23ba01790f661368f9b'
$checksumurljrefx = '47325ecae75110e17de6a8dd2b8de4e00c51291ce9b2cde24f8b3b8d57b62cec'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.19-ca-jdk8.0.482-win_i686.msi'
    checksum64     = 'c06f05b2bd89138ee8c849c4c02d43b6e072f261c73f5789669f9479cb97794f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
