$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-jre8.0.504-win_i686.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-fx-jdk8.0.502-win_i686.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.19-ca-fx-jre8.0.502-win_i686.zip'

$checksumurljre = 'f77546602fafbb71ffa1af0f7fbfeda62ff4c69156212c6c35a698a1844b8b9e'
$checksumurljdkfx = 'dc182852ffc3263d26ed701010f7546a553c5343d134801a8182f9432e9b1854'
$checksumurljrefx = '0bbabf92b8c591cab40340dfec4653516c7457c8d80fc75d2aa9145b0fa2204e'


Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\JRE\zulu8-x32-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JDK\zulu8-x32-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x32' -FileFullPath "$toolsDir\FX\JRE\zulu8-x32-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x86'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.96.0.205-ca-jdk8.0.504-win_i686.msi'
    checksum64     = '6a6ca962a9a25dd7bbf88c8ee4d36c9327272dc41c6944fcdd58f0e1c420d4d1'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
