$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/06fe8681-fb36-4c0c-b399-a09f8291d88a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '22543470C2B46020174192796706F3E1964EEF55115B869FD869E442A57DA50A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
