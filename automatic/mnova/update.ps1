Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://mestrelab.com/download/mnova/'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'mnova'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '.msi$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $url = "https://mestrelab.com$url"
  $arr = $url -split '-|_.*.msi'
  $version = $arr[1]
  $Options = @{ Headers = @{Referer = $releases}}
  $options.Headers.Add("User-Agent", [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox)
  return @{ Version = $version; URL = $url; Options = $Options }
}

update -ChecksumFor none