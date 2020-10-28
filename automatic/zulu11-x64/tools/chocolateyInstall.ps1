$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-jre11.0.9-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.41.23-ca-fx-jdk11.0.8-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.41.23-ca-fx-jre11.0.8-win_x64.zip'

$checksumurljre = '6c3add7c07d1e0d031b4a94c97be3df8899c4850188a5fb3844228f7001b47f1'
$checksumurljdkfx = 'e6248a59ddc49b5896a0b29a481fc8987695e2fbe9390f8665868d0caadcdecd'
$checksumurljrefx = 'fda266e6cce0a00d0cdb796d8908d1b793c255fe7adce11021d02ab6e68d0a9f'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.43.21-ca-jdk11.0.9-win_x64.msi'
    checksum64     = '83f1adcee8f294897cb8b36b28e16818fd75df4a43df205a6d198dfad8bbb4e5'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
