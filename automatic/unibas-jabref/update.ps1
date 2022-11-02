Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://api.github.com/repos/JabRef/jabref/releases/latest'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-jabref'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-RestMethod -Uri $releases
  $asset = $download_page.assets | Where {$_.name -match "JabRef-.*\.msi$"}
  $url = $asset.browser_download_url
  $version = Get-Version $url

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
