$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-jre8.0.462-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.86.0.25-ca-fx-jdk8.0.452-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.86.0.25-ca-fx-jre8.0.452-win_x64.zip'

$checksumurljre = '8fdf027ac9104f724a2bfec6c6fd4d8c4ae441daa7407d38cd7b61f69eb1e44a'
$checksumurljdkfx = '42e674062667ebb81f7c82cdf1018422f12a1cec766f2d1a164568668dcacf4d'
$checksumurljrefx = '7e1e1f3bf894963fee9d1b4d48a94a9d8999768fa36e803ed8e80c6afe12d3bd'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-jdk8.0.462-win_x64.msi'
    checksum64     = '29241b15211decd01f181c311c93858f8e3ef315c5fac64f648352d980225051'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
