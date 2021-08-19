import-module au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://micro-manager.org/Download_Micro-Manager_Latest_Release'

function global:au_BeforeUpdate {
  $Latest.ChecksumType64 = 'sha256'
  Get-RemoteFiles -FileNameBase $Latest.FileName64.TrimEnd('.exe') -NoSuffix -Purge
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm $Latest.ChecksumType64
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

  $re = '\.exe$'
  $fileName = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href


  $version = $fileName -split '[_]' | Select-Object -Last 1
  $version = $version.replace(".exe", "")

  return @{
    URL        = $fileName
    Version    = $version
    FileName64 = $fileName
  }
}

update -ChecksumFor none -NoCheckChocoVersion
