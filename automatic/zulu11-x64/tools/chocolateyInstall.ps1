$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.86.19-ca-jre11.0.30-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-fx-jdk11.0.29-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.84.17-ca-fx-jre11.0.29-win_x64.zip'

$checksumurljre = '4734dda8c321905880f821fedb7a98a8432fd97edba0fca2c60b2e80f809f290'
$checksumurljdkfx = '23261e91918dcb4321e5ddba35f8814f562161a464cedee168fcd02b8c31c58b'
$checksumurljrefx = '406fa94c6f818814a2aca411c3db58241fcc049a4e82987a4330c5f6dad7196b'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.86.19-ca-jdk11.0.30-win_x64.msi'
    checksum64     = 'c9df1d7143d29acce866cc9fb189a4d571ef79d414cde0cc851154dde4c71a87'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
