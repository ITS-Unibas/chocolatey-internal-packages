$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/de8e5069-b343-4a53-9b65-e331ea357853/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E4EFFD753C19C34170F99723F3F3E8C5C86B49358D267921E3E8747A289D12A9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
