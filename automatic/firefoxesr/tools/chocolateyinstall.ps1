$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.11.0esr/win64/en-US/Firefox%20Setup%20102.11.0esr.msi'
  checksum      = '723a72ba88bd9d3691ee309028e503dfbb8225001bee7bc4c692e7317ea0f70d78ddded75f742df02ddd0e86981d4c18b8b7e2db6dcd9221cd4b791bed39aa6e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
