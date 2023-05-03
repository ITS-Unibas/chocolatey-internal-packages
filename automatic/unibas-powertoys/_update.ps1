import-module au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://api.github.com/repos/microsoft/PowerToys/releases/latest'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
  $download_page = Invoke-RestMethod -Uri $releases
  $asset = $download_page.assets | Where-Object -Property name -Like "PowerToysSetup*-x64.exe"
  $version = $download_page.tag_name.Replace('v', '')
  $version = Get-Version($version)

  if ($asset) {
    $url = $asset.browser_download_url
  
    return @{
      Version = $version
      URL64   = $url
    }
  }
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL64)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType64)"
    }
  }
}

Update-Package -checksumfor none -NoCheckChocoVersion
