import-module au
Import-Module Wormies-AU-Helpers
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module "$PSScriptRoot\..\..\scripts/au_extensions.psm1"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://help.switch.ch/drive/downloads/#collapse-80e712df-6688-11e4-b6ef-5254009dc73c-1'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'switchdrive'
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
  $regex = '\/s\/'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  
  $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing
  $url = $download_page.links | Where-Object id -match 'downloadFile' | Select-Object -First 1 -expand href
  $version = $download_page.Links | Where-Object outerHTML -Match '.*Download switch.*' | Select-Object -First 1 -expand outerHTML
  $version = $version | Select-String -Pattern '-\d.\d*.\d*.\d*'
  $version = $version.Matches[0].Value.Replace('-','')
  Get-RedirectedUrl $url
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
