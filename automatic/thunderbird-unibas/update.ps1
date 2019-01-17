import-module au
. $PSScriptRoot\..\_scripts\all.ps1

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.thunderbird.net/en-US/thunderbird/all/'

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -FileNameBase 'thunderbird-unibas'
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'md5'
 }
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing 
    $re = "download.mozilla.*product=thunderbird.*(&amp;|&)os=win(&amp;|&)lang=de"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $arr = $url -split '-|-'
    $version = $arr[1]
    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -Force
