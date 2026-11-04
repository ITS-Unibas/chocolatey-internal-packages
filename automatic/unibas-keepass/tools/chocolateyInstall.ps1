$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.62/KeePass-2.62.msi'
    checksum       = '9130DC16DFDABEBBC1E8B584E4ED8B00C70040929327FBF9B648B3B9E12C27F1'
    checksumType   = 'sha256'
    fileType       = 'MSI'
    silentArgs     = '/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
