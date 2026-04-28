Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://api.github.com/repos/obsproject/obs-studio/releases/latest'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}
function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL64 -Algorithm 'sha256'
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases
    $asset = $download_page.assets | Where {$_.name -match "Windows-x64-Installer\.exe$"}
    $url = $asset.browser_download_url
    $version = $download_page.tag_name

    return @{ Version = $version; URL64 = $url; }
}

    Update-Package -NoCheckChocoVersion -checksumfor 64
