$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://sourceforge.net/projects/keepass/files/KeePass%202.x/2.50/KeePass-2.50-Setup.exe/download'
    checksum       = 'A68704E639D75BAB76CF2BEEC883E93981F454176FA355758AFC9829037F10FA'
    checksumType   = 'sha256'
    fileType       = 'EXE'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
