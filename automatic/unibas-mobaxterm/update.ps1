Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://mobaxterm.mobatek.net/download-home-edition.html'

function global:au_BeforeUpdate() {
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
  $regex = '.*Installer.*.zip$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $ver = ($url -split "MobaXterm_Installer_v")[1] -replace ".zip", ""
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
