$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = ''
    checksum       = ''
    checksumType   = 'sha256'
    fileType       = 'MSI'
    silentArgs     = '/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
