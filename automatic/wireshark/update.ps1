$ErrorActionPreference = 'Stop'
Import-Module chocolatey-au

# Thanks to mkevenaar (https://github.com/mkevenaar/chocolatey-packages/blob/master/automatic/wireshark/update.ps1)
$version_page = 'https://www.wireshark.org/download.html'
# $releases64 = 'https://www.wireshark.org/download/win64/all-versions/'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
	  "(?i)(^\s*url\s*=\s*)('.*')" = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
	  "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $version_page = Invoke-WebRequest -Uri $version_page -UseBasicParsing

  $re64  = '(https:\/\/)(.*)(wireshark.org\/win64\/[Ww]ire[Ss]hark-)([\d\.]+)(-x64.exe)$'
  $url64 = $version_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href
  $version = ($url64 -split '-')[1]

  return @{
      URL64 = $url64
      Version = $version
  }
}

update -ChecksumFor 64 -NoCheckChocoVersion
