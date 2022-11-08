Import-Module AU

$domain = "https://github.com"
$releases = "$domain/cryptomator/cryptomator/releases/"

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
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$regex = 'x64.exe$'
	$urlPart = $download_page.links | Where-Object {$_.href -match $regex} | Select-Object -First 1 -expand href

	$url = "$domain$urlPart"
	$version = $url.split("/")[7]

	return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
