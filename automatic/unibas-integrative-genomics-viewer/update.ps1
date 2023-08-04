Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = "Tls12"
$releases = 'https://software.broadinstitute.org/software/igv/download'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-integrative-genomics-viewer'
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
  $regex         = '.exe$'
  $java          = 'Java' 
  $url           = $download_page.links| Where-Object {($_.href -match $regex) -and ($_.href -notmatch $java)} | Select-Object -expand href
  $version       = ($url -split 'https://data.broadinstitute.org/igv/projects/downloads/' -split '/')[2] -replace "-installer.exe", "" -replace "IGV_Win_", ""
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
