$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileType      = 'EXE'
    url           = 'https://adedownload.adobe.com/pub/adobe/digitaleditions/ADE_4.5_Installer.exe'
    checksum      = 'a21a9d5389728fdac6a7288953dddeea774ef2bee07f1caf7ea20bbed8f5a2c6'
    checksumType  = 'SHA256'
    silentArgs   = '/S'
    validExitCodes= @(0, 1223)
}

Install-ChocolateyPackage @packageArgs
