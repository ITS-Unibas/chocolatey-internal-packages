﻿Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$PreUrl = 'https://github.com'
$releases = "$PreUrl/FreeCAD/FreeCAD/releases"

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-freecad'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum)'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = 'FreeCAD_.*-Windows-x86_64-installer-.*.exe$'
  $url = "$PreUrl$($download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href)"
  $arr = $url -split 'FreeCAD_|-conda-Windows-x86_64-installer-.*$' 
  $version = $arr[1]
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion