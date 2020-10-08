import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$release_url = 'https://www.uni-heidelberg.de/einrichtungen/ibf/datenbanken/tierbase.html'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm "sha256"
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
  $homepage_content = Invoke-WebRequest -Uri $release_url
  # Get Version
  $homepage_content -match '\((\d+\.\d+)\)' | Out-Null
  $version = $Matches[1]
  $Url = "https://www.uni-heidelberg.de/md/ibf/datenbanken/4d_v$($version)_windows_32-bit.exe"
  $Latest = @{ URL = $Url; Version = $version; }
  return $Latest
}

update -ChecksumFor none
