Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.audacityteam.org/download/windows/'

function global:au_BeforeUpdate() {
  $Latest.Options.Headers = @{
    'Referer'    = $Latest.URL + "/";
    'User-Agent' = $Latest.Options.Headers.'User-Agent'
  }
  Get-RemoteFiles -Purge -FileNameBase $Latest.PackageName
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
  $regex = 'audacity-win-.*-64bit\.exe$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -replace '.*audacity-win-(.*)-64bit\.exe', '$1'
  $HTTPheaders = @{
    'Referer'    = $releases;
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'
  }

  return @{ Version = $version; URL = $url; Options = @{ Headers = $HTTPheaders }; BaseUrl = $releases }
}


update -ChecksumFor none -NoCheckChocoVersion
