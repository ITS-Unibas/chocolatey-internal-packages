$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$urljre = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.19-ca-jre8.0.482-win_x64.zip'
$urljdkfx = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-fx-jdk8.0.472-win_x64.zip'
$urljrefx = 'https://cdn.azul.com/zulu/bin/zulu8.90.0.19-ca-fx-jre8.0.472-win_x64.zip'

$checksumurljre = '068904e183d93a0136c2ef76fe1addf3a7aa6620c92a6c092325108d00c7f830'
$checksumurljdkfx = '6628e6b3586d6003a93f38fb7d8841ea46d4c386920a535b76e6b54c28266f9f'
$checksumurljrefx = '4383fed694c640886dc99a1c38c4f2b3d035a6a4911f17ea8f8dcd35188b527a'


Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\JRE\zulu8-x64-jre.zip" -Url $urljre -Checksum $checksumurljre -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JDK\zulu8-x64-jdk-fx.zip" -Url $urljdkfx -Checksum $checksumurljdkfx -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'zulu8-x64' -FileFullPath "$toolsDir\FX\JRE\zulu8-x64-jre-fx.zip" -Url $urljrefx -Checksum $checksumurljrefx -ChecksumType 'sha256'

$packageArgs = @{
    packageName    = 'zulu8-x64'
    fileType       = 'msi'
    url64bit       = 'https://cdn.azul.com/zulu/bin/zulu8.92.0.19-ca-jdk8.0.482-win_x64.msi'
    checksum64     = '29f45b82cfb9572f16e10a38519ae912c00d3634e9df2730bd755f2074d3a4a6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0)
    softwareName   = 'Zulu 8*'
}

Install-ChocolateyPackage @packageArgs
