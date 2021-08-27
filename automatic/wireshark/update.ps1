Import-Module au

$version_page = 'https://www.wireshark.org/#download'
$releases64 = 'https://www.wireshark.org/download/win64/all-versions/'

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $version = GetVersion

  $r64 = '[Ww]ire[Ss]hark-win64-[\d\.]+\.exe$'
  $url64 = GetDownloadLink -downloadlinks $releases64 -pattern $r64 -version $version

  return @{
    URL64    = $url64
    Version  = $version
    FileType = 'exe'
  }
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$version_page>"
      "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL64)>"
      "(?i)(checksum64:).*"      = "`${1} $($Latest.Checksum64)"
    }
  }
}

function GetVersion {
  $version_page = Invoke-WebRequest -Uri $version_page -UseBasicParsing
  $re64 = '(http[s]?|[s]?)(:\/\/)([^\s,]+)\/win64\/[Ww]ire[Ss]hark-win64-[\d\.]+\.exe$'
  $v = $version_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href
  $v -split '-|.exe' | Select-Object -Last 1 -Skip 1
}

function GetDownloadLink([string] $downloadlinks, [string] $pattern, [string] $version) {
  $page = Invoke-WebRequest -Uri $downloadlinks -UseBasicParsing
  $link = $page.links | Where-Object { ($_.href -like '*' + $version + '*') -And ($_.href -match $pattern) } | Select-Object -first 1 -expand href
  $downloadlinks + $link
}

update -ChecksumFor None -NoCheckChocoVersion
