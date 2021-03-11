Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.activestate.com/products/perl/downloads/'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-activepearl'
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
  $regex = '.msi$'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $arr = $url -split '-|.msi'
  $version = $arr[3]
  $Options = @{ Headers = @{Referer = $releases}}
  $options.Headers.Add("User-Agent", [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox)
  return @{ 
    Version = $version; 
    URL = $url;
    Options = $Options
    }
}

update -ChecksumFor none -NoCheckChocoVersion
