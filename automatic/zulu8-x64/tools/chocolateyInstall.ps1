$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-jre8.0.504-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-fx-jdk8.0.502-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-fx-jre8.0.502-win_x64.zip'

$checksumurljre = 'a4f32724c6d819c20372ac069fefa6e6c0319e1d79ba6ce4ee338d4c7e051a12'
$checksumurljdkfx = 'b70a290de3804153d1d46546176ca2e074fe153b737ad59e615e4268f18b7528'
$checksumurljrefx = '2c1502edf8b200133022d46df9a22e989328732c753b812c7270b54099947ca2'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-jdk8.0.504-win_x64.msi'
    checksum64     = 'a01da57c5c53b16286286f136745b0912b0cf40ec82676717dc32f02384369d6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
