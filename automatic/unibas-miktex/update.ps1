Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://miktex.org/download'

function global:au_BeforeUpdate() {
  (Invoke-WebRequest -UseBasicParsing $releases).content -match "SHA-256:.*\n?.*>(\w*)<\/div>"
  $Latest.Checksum = $matches[1]
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
  $regex = '.exe$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $arr = $url -split '-|.exe'
  $url = "https://miktex.org$url"
  $version = $arr[3]
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
