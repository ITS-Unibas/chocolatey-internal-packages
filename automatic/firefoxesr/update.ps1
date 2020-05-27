import-module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releasesESR = 'https://www.mozilla.org/en-US/firefox/organizations/notes/'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releasesESR
  $download_page.Content -match 'Version \d+.\d+.\d+'
  $version = $matches[0] -replace "Version ", ""

  $url = "https://ftp.mozilla.org/pub/firefox/releases/$($version)esr/win64/en-US/Firefox%20Setup%20$($version)esr.exe"
  Write-Host $url

  $ExecutableName = "firefox-${Version}esr"
  $allChecksums = Invoke-WebRequest -UseBasicParsing -Uri "https://releases.mozilla.org/pub/firefox/releases/${Version}esr/SHA512SUMS"
  $allChecksums -match "(\w*)  win64\/en-US\/$ExecutableName"
  $checksum = $matches[1]

  $Latest = @{ URL64 = $url; Version = $version; Checksum = $checksum }
  return $Latest
}

update -ChecksumFor none -NoCheckChocoVersion -Verbose
