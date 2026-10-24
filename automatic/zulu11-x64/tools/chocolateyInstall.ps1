$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.92.109-ca-jre11.0.33-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-fx-jdk11.0.32.1-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.90.205-ca-fx-jre11.0.32.1-win_x64.zip'

$checksumurljre = '8fc1c179d5c31bf247ffceb0a028f7dde6c39693e2e547e321a67028913fc6a1'
$checksumurljdkfx = '728beb96b4b3e5a9fb27ef8fc1a4411f646ef2b6b7b1287a43b5e66f60c6b388'
$checksumurljrefx = '4c16277587ec985fdbfb5f08ce210ab9b04f013880482aa86f39e10b3cb1f16e'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.92.109-ca-jdk11.0.33-win_x64.msi'
    checksum64     = '1bdf4580345bdf2c9b118178bf78029252f9494dc259acf3afdf10fcfa9acf5a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
