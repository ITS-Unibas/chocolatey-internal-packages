import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_page_url = 'https://github.com/PowerShell/PowerShell/releases'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

  # Get Version
  $homepage_content -match 'v((\d+).(\d+).(\d+)).Release.of.PowerShell' | Out-Null
  $version = $Matches[1]
  $MsiName = "PowerShell-$version-win-x64.msi"
  $homepage_content -match "$MsiName\n<ul>\n<li>([A-Za-z0-9]+)</li>" | Out-Null
  $checksum = $Matches[1]
  $url = "https://github.com/PowerShell/PowerShell/releases/download/v$version/$MsiName"

  $Latest = @{ URL = $url; Version = $version; Checksum = $checksum }
  return $Latest
}

update -ChecksumFor none
