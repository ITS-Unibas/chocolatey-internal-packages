import-module Chocolatey-AU

$downloadUrlFormat = 'https://download.sublimetext.com/sublime_merge_build_{0}_x64_setup.exe'
$updatesEndpoint = 'https://www.sublimemerge.com/updates/stable_update_check'
$versionFormat   = '0.0.{0}'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"         = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum)'"
        }
    }
}

function global:au_GetLatest {
    $releaseInformation = Invoke-RestMethod -Uri $updatesEndpoint
    $buildNumber = $releaseInformation.latest_version

	@{
		$Version = $versionFormat -f $buildNumber
		$URL     = $downloadUrlFormat -f $buildNumber
	}
}

update -ChecksumFor 64