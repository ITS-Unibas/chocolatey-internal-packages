import-module au
Import-Module Wormies-AU-Helpers
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts/au_extensions.psm1"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$x86Release = 'https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function GetResultInformation([string]$url) {
  $url = Get-RedirectedUrl $url
  $dest = "$env:TEMP\vcredist2010_x86.exe"

  Get-WebFile $url $dest | Out-Null
  $checksumType = 'sha256'
  $version = Get-Version (Get-Item $dest | % { $_.VersionInfo.ProductVersion })
  $checksum = Get-FileHash $dest -Algorithm $checksumType | % { $_.Hash.ToLowerInvariant() }

  return @{
    URL            = $url
    Version          = if ($version.Version.Revision -eq '0') { $version.ToString(3) } else { $version.ToString() }
    VersionThreePart = $version.ToString(3)
    Checksum       = $checksum
    ChecksumType  = $checksumType
  }
}

function global:au_GetLatest {
  Update-OnETagChanged -execUrl $x86Release `
    -OnEtagChanged {
    GetResultInformation $x86Release
  } -OnUpdated { @{ URL = $x86Release}}
}

update -ChecksumFor none
