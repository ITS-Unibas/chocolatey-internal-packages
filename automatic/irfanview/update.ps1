import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_page_url = 'https://www.irfanview.com/64bit.htm'


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
  $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

  # Get Version
  $homepage_content -match '(Version \d+.\d+)' | Out-Null
  $recodeversion = $matches[1] -replace "Version ", ""
  $version = $recodeversion -replace "\(",""

  $url = $homepage_content.Links | Where-Object {$_ -match '(.*?)iview\d\d\d_x64_setup.exe(.*)'} | Select-Object -ExpandProperty href

  $Latest = @{ URL = $url; Version = $version }
  return $Latest
}

update -ChecksumFor none
