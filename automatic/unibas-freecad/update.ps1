Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$PreUrl = 'https://www.freecad.org/downloads.php'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-freecad'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum)'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $PreUrl -UseBasicParsing
  $regex = 'FreeCAD_.*-Windows-x86_64-installer-.*.exe$'
  $url = "$($download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href)"
  $arr = $url -split 'FreeCAD_|-conda-Windows-x86_64-installer-.*$' 
  $version = $arr[1]
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor 64
