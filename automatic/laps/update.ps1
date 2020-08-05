import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$details_url = 'https://www.microsoft.com/en-us/download/details.aspx?id=46899'
$download_page_url = 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=46899'


function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'md5'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $details_url

  # Get Version
  $homepage_content -match 'Version:(.*?)((\d+)\.(\d+))' | Out-Null
  $version = $Matches[2]

  # Get URL
  $download_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url
  $url = $download_content.Links | Where-Object {$_.href -like "*LAPS.x64.msi*"} | Select-Object -ExpandProperty href -First 1

  $Latest = @{ URL = $url; Version = $version }
  return $Latest
}

update -ChecksumFor none
