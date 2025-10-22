$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-jre8.0.472-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-fx-jdk8.0.462-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.88.0.19-ca-fx-jre8.0.462-win_x64.zip'

$checksumurljre = '044bf3e664f7e606ed84aa6ce9e5a5f586249e197e806c4cb8cb1cad56377272'
$checksumurljdkfx = '04d798fef35e0f2f18300619a79cd7f50bfa0d533a037b5450cc9a8e84d8be9e'
$checksumurljrefx = '7e133d2515cd577448f6ff3e1e844667fdbf3f902da078a4fa91ac5db50e97d8'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-jdk8.0.472-win_x64.msi'
    checksum64     = 'd2ae4f1a97a7e5cb06e420da2fe1b12b2c7106bda60639a5ffb035cccaa19d57'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
