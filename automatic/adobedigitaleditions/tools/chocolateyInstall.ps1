$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileType      = 'EXE'
    url           = 'https://adedownload.adobe.com/pub/adobe/digitaleditions/ADE_4.5_Installer.exe'
    checksum      = 'db40676c6925f64ab79c3d8b7a24be0973b07ef1c14eec6ec8c44f47cfe665b8'
    checksumType  = 'SHA256'
    silentArgs   = '/S'
    validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
