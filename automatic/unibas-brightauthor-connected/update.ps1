Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.brightsign.biz/resources/software-downloads/'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-brightauthor-connected'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
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
  $regex = '.exe$'
  $title = '.*connected.*'
  $url = $download_page.links | Where-Object {$_.title -match $title -and $_.href -match $regex} | Select-Object -First 1 -expand href
  $arr = $url -split '/'
  $arr = $arr[$arr.length-1] # the last item is the name of the installer-exe (e.g. "BA connected Setup 1.6.44.exe")
  $arr = $arr -split ' ' # extracts the version with exe
  $version = $arr[-1].Replace('.exe','') # extracts the version only
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion -NoCheckURL
