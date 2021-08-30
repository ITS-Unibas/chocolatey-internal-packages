import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$release_url = 'https://www.uni-heidelberg.de/einrichtungen/ibf/datenbanken/tierbase.html'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm "sha256"
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
  $homepage_content = Invoke-WebRequest -Uri $release_url -UseBasicParsing
  $re = '/f/'
  $url = $homepage_content.links | Where-Object href -match $re | Select-Object -First 1 -expand href
  $download_page_content = Invoke-WebRequest -Uri $url -UseBasicParsing
  $download_page_content -match '\d+\.\d+' | Out-Null
  $version = $Matches[0]
  $url = $url + "?dl=1"
  $Latest = @{ URL = $Url; Version = $version; }
  return $Latest
}

update -ChecksumFor none
