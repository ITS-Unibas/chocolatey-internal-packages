$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9d814905-fb9c-4f57-a7ca-3b1f204d55a4/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4A95331C2C18702840830039B777D82BD118AB80810789F7C773136CEBA6B977'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
