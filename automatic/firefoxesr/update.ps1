import-module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releasesESR = 'https://www.mozilla.org/en-US/firefox/all/#product-desktop-esr'

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


  $version = Select-String "(\d+)\.(\d+)\.(\d+)esr" -InputObject $download_page -AllMatches | ForEach-Object {$_.matches}`
                      | Select-Object -ExpandProperty Value | Sort-Object | Get-Unique | ForEach-Object {[version]($_.Replace('esr', ''))} `
                      | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum

  $url = "https://ftp.mozilla.org/pub/firefox/releases/$($version)esr/win64/en-US/Firefox%20Setup%20$($version)esr.msi"

  $ExecutableName = "Firefox Setup ${Version}esr.msi"
  $allChecksums = Invoke-WebRequest -UseBasicParsing -Uri "https://releases.mozilla.org/pub/firefox/releases/${Version}esr/SHA512SUMS"
  $allChecksums -match "(\w*)  win64\/en-US\/$ExecutableName" | Out-Null
  $checksum = $matches[1]

  $Latest = @{ URL64 = $url; Version = $version; Checksum = $checksum }
  return $Latest
}

update -ChecksumFor none -NoCheckChocoVersion -Verbose
