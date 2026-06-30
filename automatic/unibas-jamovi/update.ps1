Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.jamovi.org/download.html'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-jamovi'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256' -Headers $Latest.Options.Headers
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -Headers @{"Referer" = "https://www.jamovi.org/"}
  # needs referer, otherwise will be redirected to the selection page for cloud or desktop version
  $regex = '.exe$'
  $href = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = ($href -replace 'downloads/', '' -split '-|.exe')[1]
  $filename = ($href -split '/')[-1]
  $url = "https://dl-cdn.jamovi.org/$filename"
  $options = @{ Headers = @{ Referer = $releases } }
  return @{ Version = $version; URL = $url; Options = $options }
}

update -ChecksumFor none -NoCheckChocoVersion
