$ErrorActionPreference = 'Stop'
Import-Module chocolatey-au

# Thanks to mkevenaar (https://github.com/mkevenaar/chocolatey-packages/blob/master/automatic/wireshark/update.ps1)
$version_page = 'https://www.wireshark.org/download.html'
# $releases64 = 'https://www.wireshark.org/download/win64/all-versions/'

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$($version_page)>"
      "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL64)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType64)"
      "(?i)(checksum64:).*"      = "`${1} $($Latest.Checksum64)"
    }
  }
}
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $version_page = Invoke-WebRequest -Uri $version_page

  $re64  = '(http[s]?|[s]?)(:\/\/)([^\s,]+)\/win64\/[Ww]ire[Ss]hark-win64-[\d\.]+\.exe$'
  $url64 = $version_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href
  $version = $url64 -split '-|.exe' | Select-Object -Last 1 -Skip 1

  return @{
      URL64 = $url64
      Version = $version
      FileType = 'exe'
  }
}

update -ChecksumFor None -NoCheckChocoVersion
