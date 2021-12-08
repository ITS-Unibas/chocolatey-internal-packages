Import-Module AU
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://www.veracrypt.fr/en/Downloads.html'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"   = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '.msi$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  
  $arr = $url -split '/'
  $version = $arr[5]
 
  return @{ Version = $version; URL = $url }
}

update -NoCheckChocoVersion
