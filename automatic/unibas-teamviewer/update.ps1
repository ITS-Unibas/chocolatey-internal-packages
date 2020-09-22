import-module au
Import-Module Wormies-AU-Helpers
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts/au_extensions.psm1"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download = 'https://download.teamviewer.com/download/TeamViewer_Setup.exe'

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
  $dest = "$env:TEMP\TeamViewer_Setup.exe"

  Get-WebFile $url $dest | Out-Null
  $checksumType = 'sha256'
  $version = (Get-CimInstance -Class CIM_DataFile -Filter "Name='$($dest.Replace('\', '\\'))'" | Select-Object Version).Version
  $checksum = Get-FileHash $dest -Algorithm $checksumType | % { $_.Hash.ToLowerInvariant() }

  return @{
    URL            = $url
    Version          = $version.ToString()
    Checksum       = $checksum
    ChecksumType  = $checksumType
  }
}

function global:au_GetLatest {
  Update-OnETagChanged -execUrl $download `
    -OnEtagChanged {
    GetResultInformation $download
  } -OnUpdated { @{ URL = $download}}
}

update -ChecksumFor none
