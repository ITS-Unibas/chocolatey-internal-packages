Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releasesESR = 'https://product-details.mozilla.org/1.0/firefox_versions.json'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
	  "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releasesESR
  $pageContentJSON = $download_page.Content | ConvertFrom-Json
  
  # Get the Version for Firefix ESR next (v 128.x.x)
  $versionRaw = $pageContentJSON.FIREFOX_ESR_NEXT
  $version = [Version]($versionRaw -replace 'esr', '')

  $url = "https://ftp.mozilla.org/pub/firefox/releases/$($version)esr/win64/en-US/Firefox%20Setup%20$($version)esr.msi"
  
  return @{
	  URL64 = $url
	  Version = $version
  }
}

update -ChecksumFor 64 -NoCheckChocoVersion
