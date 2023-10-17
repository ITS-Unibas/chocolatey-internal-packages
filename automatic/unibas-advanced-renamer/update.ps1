Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.advancedrenamer.com/download'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-advanced-renamer'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'md5'
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
  $regex = '.exe$'
  $urlPart = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $url = ($releases -replace "/download", "") + $urlPart
  $arr = ($url -split 'advanced_renamer_setup_|.exe')[1]
  $version = $arr -replace "_", "."
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
