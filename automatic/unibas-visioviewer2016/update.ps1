import-module au
Import-Module Wormies-AU-Helpers
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts/au_extensions.psm1"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Release = 'https://download.microsoft.com/download/D/B/7/DB790874-4414-417F-ADF6-348B29572B9F/visioviewer_4339-1001_x64_en-us.exe'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function GetResultInformation([string]$url) {
  $dest = "$env:TEMP\visioviewer.exe"

  Get-WebFile $url $dest | Out-Null
  $checksumType = 'sha256'
  $version = Get-Version (Get-Item $dest | % { $_.VersionInfo.ProductVersion })
  $checksum = Get-FileHash $dest -Algorithm $checksumType | % { $_.Hash.ToLowerInvariant() }

  return @{
    URL            = $url
    Version          = if ($version.Version.Revision -eq '0') { $version.ToString(3) } else { $version.ToString() }
    Checksum       = $checksum
    ChecksumType  = $checksumType
  }
}

function global:au_GetLatest {
  Update-OnETagChanged -execUrl $Release `
    -OnEtagChanged {
    GetResultInformation $Release
  } -OnUpdated { @{ URL = $Release}}
}

update -ChecksumFor none
