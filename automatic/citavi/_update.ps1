Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.citavi.com/de/download'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'citavi'
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
  $page_version = $download_page | Select -ExpandProperty Links | Where-Object {$_.id -eq "download-msi"} | Select -ExpandProperty outerHTML
  $page_version = ($page_version -split ">")[1]
  $page_version = ($page_version -replace "MSI-Setup Citavi ", "") -replace "</a"
  $version = $page_version
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
