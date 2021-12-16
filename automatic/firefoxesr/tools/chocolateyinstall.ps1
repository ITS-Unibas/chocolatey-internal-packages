$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.4.1esr/win64/en-US/Firefox%20Setup%2091.4.1esr.msi'
  checksum      = '35da7b713c7d808077fafcb15c0f78f15ddf21950111ac2d17a464bdda2adfcaba07219a0d9b269f131173aef6074e1c5ec2c4853df81099f473bb3a75ca6c8e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
