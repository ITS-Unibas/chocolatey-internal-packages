$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-jre11.0.28-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.80.21-ca-fx-jdk11.0.27-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.80.21-ca-fx-jre11.0.27-win_x64.zip'

$checksumurljre = 'd7af145cfbfd6b71df98ba70186a2707edd429d15fdfa60466dc9620e790f990'
$checksumurljdkfx = '84454325bf004a946a14b298ab922fe1e7eac4ea0a3fb11221364f283cb690ba'
$checksumurljrefx = 'e22f9e4b34c96bb16bf9867a57aae8dde2ab4bc277e696e2bb8871ed9ceb378f'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-jdk11.0.28-win_x64.msi'
    checksum64     = 'fb061e59360484aa2068784d86140c9f1c68a9417ea7307836e9924d000b5739'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
