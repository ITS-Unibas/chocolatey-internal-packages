Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://support.lenovo.com/us/en/solutions/ht037099'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-lenovo-thin-installer'
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
	$keyPath = 'Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
	if (!(Test-Path $keyPath)) {
		New-Item $keyPath -Force
	}
	Set-ItemProperty -Path $keyPath -Name "DisableFirstRunCustomize" -Value 1
	
	$ie = New-Object -comobject "InternetExplorer.Application"
	$ie.visible = $false
	$ie.Navigate($releases)
	Start-Sleep 8
	$links = $ie.Document.links
	$lenovoThinInstaller = "lenovo_thininstaller_.*.exe$"
	foreach ($link in $links) {
		if (($link.href) -match $lenovoThinInstaller) {
			$url = $link.href
			Write-Host $url
			$version = (($url -split ("_"))[-1]) -replace ".exe", ""
			Write-Host $version
		}
	}
	$ie.quit()
	
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion

