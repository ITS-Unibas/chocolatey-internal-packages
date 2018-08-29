Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.rstudio.com/products/rstudio/download/'

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -FileNameBase 'rstudio'
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
    $regex   = '.exe$'
    $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $arr = $url -split '-|.exe'
    $version = $arr[1]
    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
