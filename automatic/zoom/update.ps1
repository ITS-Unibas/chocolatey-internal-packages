import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_page_url = 'https://zoom.us/download#client_4meeting'
$url_part1 = 'https://zoom.us/client/'
$url_part2 = '/ZoomInstallerFull.msi'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'ZoomInstallerFull'
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
  $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

  # Get Version
  $homepage_content -match '(Version \d+.\d+.\d+ (\(.\d+.\d+\)))' | Out-Null
  $recodeversion = $matches[1] -replace "Version ", ""
  $recodeversion = $recodeversion -replace "\d+ \(",""
  $version = $recodeversion -replace "\)",""
  $url = $url_part1 + $version + $url_part2

  $Latest = @{ URL = $url; Version = $version }
  return $Latest
}

update -ChecksumFor none
