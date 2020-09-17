Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-anaconda3'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_GetLatest {
  $ArchiveURL = 'https://repo.continuum.io/archive/'
  $List = Invoke-WebRequest -Uri $ArchiveURL

  $version = "1.0"

  $List.links | Where-Object { $_.href -match "Anaconda3.*Windows" } |
  ForEach-Object {
    $v = ($_.href.split('-')[1])
    if ([version]$v -gt [version]$version) {
      $version = $v
    }
  }

  $URL64 = "https://repo.continuum.io/archive/Anaconda3-$version-Windows-x86_64.exe"

  return @{
    Version = $Version
    URL     = $URL64
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

Update -ChecksumFor none -NoCheckChocoVersion
