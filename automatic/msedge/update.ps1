import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_page_url = 'https://www.microsoft.com/en-us/edge/business/download'
$release_notes_url = 'https://docs.microsoft.com/en-us/deployedge/microsoft-edge-relnote-stable-channel'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $release_notes_url
  # Get Version
  $homepage_content -match 'Version (\d+)\.(\d+)\.(\d+)\.(\d+)' | Out-Null
  $version = $matches[0] -replace "Version ", ""
  $download_content = Invoke-WebRequest -Uri $download_page_url
  $DataDiv = $download_content.ParsedHtml.getElementById("commercial-json-data")
  $Json = ConvertFrom-Json $DataDiv.getAttribute("data-whole-json")
  $StableObjects = $Json | Where-Object Product -eq Stable | Select-Object -ExpandProperty Releases
  $StableWinObject = $StableObjects | Where-Object {$_.ProductVersion -eq $version -and $_.Architecture -eq "x64" -and $_.Platform -eq "Windows"}
  $Url = $StableWinObject.Artifacts.Location
  $Checksum = $StableWinObject.Artifacts.Hash
  $Latest = @{ URL = $Url; Version = $version; Checksum = $Checksum }
  return $Latest
}

update -ChecksumFor none
