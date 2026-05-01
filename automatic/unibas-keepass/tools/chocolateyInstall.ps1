$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.61.1/KeePass-2.61.1.msi'
    checksum       = '5A1D0D573D2CB6278394F75FDBFF4D05DCE44EAC6F522C7B43F5E637F77B46C0'
    checksumType   = 'sha256'
    fileType       = 'MSI'
    silentArgs     = '/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
