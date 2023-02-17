$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/027989b3-cb2e-41bf-8697-5ada0e777454/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6A7880213D117EF291EA07EA21AAB52B86602AF8111E12902755293DFC9699F4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
