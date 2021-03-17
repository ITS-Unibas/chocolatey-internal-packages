$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/366c0fb9-fe05-4b58-949a-5bc36e50e370/E830C313AA99656748F9D2ED582C28101EAAF75F5377E3FB104C761BF3F808B2/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ 2015-2019 Redistributable (x86)*'
  checksum       = 'e830c313aa99656748f9d2ed582c28101eaaf75f5377e3fb104c761bf3f808b2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
