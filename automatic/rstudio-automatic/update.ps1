Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = (Invoke-WebRequest https://www.rstudio.com/wp-content/downloads.json -UseBasicParsing | ConvertFrom-Json)
$release = $releases.rstudio.open_source.stable.desktop.installer.windows

function global:au_BeforeUpdate() {
    $Latest.Checksum = $release.sha256
 }
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
    $version = ($release.version -split "\+")[0]
    return @{ Version = $version; URL = $release.url }
}

update -ChecksumFor none
