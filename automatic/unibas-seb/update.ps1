Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://safeexambrowser.org/windows/win_release_notes_en.html'
$githubDomain = 'https://github.com'
$urlPage  = '/SafeExamBrowser/seb-win-refactoring/releases/expanded_assets/v'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm "sha256"
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
	$re = 'Version ([\d+\.]+)'
	$version = ([regex]::Match($download_page.RawContent, $re)).Captures.Groups[1].value
	
	$githubPage = $githubDomain + $urlPage + $version
	$download_page = Invoke-WebRequest -Uri $githubPage -UseBasicParsing
	
	$regex = "SetupBundle.exe$"
	$subPage = $download_page.Links.href | Where-Object {$_ -match $regex} | Select -First 1
	
	$url = $githubDomain + $subPage
	$version_number = ($subPage -split "/")[-1] -replace "SEB_", "" -replace "_SetupBundle.exe", ""
	
    return @{
        URL   = $url
        Version = $version_number
    }
    
}

update -ChecksumFor none
