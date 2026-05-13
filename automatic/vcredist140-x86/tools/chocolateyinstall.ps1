$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'vcredist140-x86'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/0dd156af-82aa-4812-b524-49c2f894359a/B6AB675F0A27E6600F9726E75DEA08D99C15F8EA4B842A2A1D988FA9529D39B9/VC_redist.x86.exe'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visual C++ v14 Redistributable (x86)*'
  checksum       = 'b6ab675f0a27e6600f9726e75dea08d99c15f8ea4b842a2a1d988fa9529d39b9'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
