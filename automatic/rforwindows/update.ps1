import-module au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$softwareName = 'R for Windows*'

$releases = 'https://cloud.r-project.org/bin/windows/base/'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -FileNameBase $Latest.FileName32.TrimEnd('.exe') -NoSuffix -Purge
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"           = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"        = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"        = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1"      = @{
      "(?i)(`"`[$]toolsDir\\).*`""        = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)(^\s*packageName\s*=\s*)'.*'"  = "`${1}'$($Latest.PackageName)'"
    }
    ".\rforwindows.nuspec"                 = @{
      "(\<id\>).*(\<\/id\>)" = "`${1}R.Project`${2}"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $fileName = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

  $version = $fileName -split '[\-]' | Select-Object -Last 1 -Skip 1

  return @{
    URL32      = $releases + $fileName
    Version    = $version
    FileName32 = $fileName
  }
}

update -ChecksumFor none -Force