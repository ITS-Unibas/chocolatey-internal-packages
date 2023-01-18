$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jre11.0.18-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-fx-jdk11.0.17-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-fx-jre11.0.17-win_x64.zip'

$checksumurljre = 'b27ad3252fcee6445f6a18a57785b3458502b910742c99ea79190c24a9e5fc8c'
$checksumurljdkfx = '9811edfa30aebf2f16b46da9af2cb222cba3fcc82b3c2deb5355c84bf3c642b6'
$checksumurljrefx = 'd8bd75415bad7e18d042f4a354a61d1314bac08ba5e98aded0e3e65f17593285'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-win_x64.msi'
    checksum64     = '283c69c9df4c85c13fbe54a022adc948c54180fc7221f2da87231c44cd1a2877'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
