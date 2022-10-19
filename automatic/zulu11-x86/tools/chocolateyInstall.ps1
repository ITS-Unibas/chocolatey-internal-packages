$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jre11.0.17-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-fx-jdk11.0.16.1-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.58.25-ca-fx-jre11.0.16.1-win_i686.zip'

$checksumurljre = '97828569ad664736054185ad730b0524137a8b36f57a8f49b6f4c90321ab5fe5'
$checksumurljdkfx = 'ffce2d75e54d380655a78dd80ca61079629103701b802d4de4b2bd8488dd31c4'
$checksumurljrefx = '7df030a2ae218b8f495e54a5837889583ae44bde144356e05816ed13d88edee8'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jdk11.0.17-win_i686.msi'
    checksum64     = '0a3604c05ba4be4da8ef6f68a782235cbe39463549b4170ceb2068428c487a68'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
