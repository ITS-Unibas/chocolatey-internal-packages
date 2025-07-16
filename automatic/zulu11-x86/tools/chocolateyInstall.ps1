$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-jre11.0.28-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu11.80.23-ca-fx-jdk11.0.27-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu11.80.23-ca-fx-jre11.0.27-win_i686.zip'

$checksumurljre = '91474dfea79647a4ae7eecb86168aea6190733cb6d25dae6e9b2dbae2e9dd3ab'
$checksumurljdkfx = '6fe27aa58bad68ec7d73bed0e0ea03df7d868c7ede2786bc1d5f2aa3fa3b83bc'
$checksumurljrefx = 'b047a47690b82263507e8c3422e511e10127450cb0e024f927b41d9545507627'


Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\JRE\zulu11-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JDK\zulu11-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu11-x32' -FileFullPath "$toolsDir\FX\JRE\zulu11-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu11-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu11.82.19-ca-jdk11.0.28-win_i686.msi'
    checksum64     = 'de1320f27117ffb56a6549a4840f1f20bad0f0a35a5d6af4008d25c4c1a71a33'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 11*'
}

Install-ChocolateyPackage @packageArgs
