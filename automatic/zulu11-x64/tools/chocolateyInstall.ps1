$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-jre11.0.33-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-fx-jdk11.0.33-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-fx-jre11.0.33-win_x64.zip'

$checksumurljre = '664ed5612a7d641bca83749486b2485b6cc0d0966375829d0c9a7cee52a97f43'
$checksumurljdkfx = '8b55ae9cc3db441464674a49537a975dfcb15e13d4dc2c12332aefa3f23e4f25'
$checksumurljrefx = '00c7d2e1f8e0f98f121c1f79a8dcf09bf8a955f2c42e2632ab18e1cf585a1a25'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.92.113-ca-jdk11.0.33-win_x64.msi'
    checksum64     = 'b5348c395d5e08df79191e8c2ba6157eb2efd634b5614e17e5a5a73a9a3230e2'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
