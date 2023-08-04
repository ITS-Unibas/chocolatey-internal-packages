Import-Module AU

$apiEndpoint = "https://api.github.com"
$releases = "$apiEndpoint/repos/cryptomator/cryptomator/releases"
$header = @{ 
  "Accept" = "application/vnd.github.v3+json" 
}

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'nis-elements-viewer'
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
	$restResults = Invoke-RestMethod -Uri $releases -Headers $header
	$regex = '^(Cryptomator-)(\d+\.\d+\.)+(\d+)(-x64\.msi)$'
  	$url = $restResults.assets | Where-Object {($_.name -match $regex)} | Select-Object -First 1 -expand browser_download_url
	$version = $url.split("/")[7]

	return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
