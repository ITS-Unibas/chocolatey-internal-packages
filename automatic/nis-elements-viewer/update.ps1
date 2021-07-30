Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.microscope.healthcare.nikon.com/de_EU/products/software/nis-elements/viewer'

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
    $regex   = '.zip$'
    $url     = $download_page.links | Where-Object {($_.href -match $regex) -and ($_.title -match $title)} | Select-Object -First 1 -expand href
	# Need to convert a version like '5.21.00_b1483' to a numeric version like '5.21.00.1483' (written in the AppWiz like that!)
	$version = (($url -split 'NIS_Viewer_')[1] -replace '_64bit.zip', '') -replace '_b', '.'
    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion