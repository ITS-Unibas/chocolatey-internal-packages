$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jre11.0.14-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-fx-jdk11.0.13-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-fx-jre11.0.13-win_x64.zip'

$checksumurljre = '0910765fbe303297d6f84657d059da66ae3c8521b7856dd01784509571f21663'
$checksumurljdkfx = 'd79eebb257098283b028ada6a5469760e6482b47cc6363307adde8df133b54a1'
$checksumurljrefx = 'dac7c6f026afef5af13884f5b710bea1b30b1b4f4e369cc1ef7b30995e97d9d3'


Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\JRE\zulu11-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JDK\zulu11-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x64' -FileFullPath "$toolsDir\FX\JRE\zulu11-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.54.23-ca-jdk11.0.14-win_x64.msi'
    checksum64     = 'e3dacf617aede3e5bbf7781632aa3faeb45da1fbd6867a72130480c1b296f347'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
