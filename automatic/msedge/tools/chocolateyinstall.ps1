$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cfb8ce57-18b2-4139-9296-e857df48b95e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '47902DE17E1A13EEA20D31AB2923614C85A8569FD6707094EFF856FD82BBCA67'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
