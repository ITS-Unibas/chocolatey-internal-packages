Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.brightsign.biz/resources/software-downloads/'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-brightauthor-connected'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
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
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = 'BA\+connected\+Setup\+([\d+\.]+)\.exe'
  $url = $download_page.links | Where-Object {$_.href -match $regex} | Select-Object -First 1 -expand href
  $version = ([regex]::Match($download_page.RawContent, $regex)).Captures.Groups[1].value
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion -NoCheckURL
