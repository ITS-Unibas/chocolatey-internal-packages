Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.software-dl.microscope.healthcare.nikon.com/en/imgsfw/'

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
    $re   = 'Ver(?<version>[\d\.]+) \(Windows\)'
    $version = ([regex]::Match($download_page.RawContent, $re)).Captures.Groups[1].value
    $version_stripped = $version -replace "\.",""
    $url     = "https://www.software-dl.microscope.healthcare.nikon.com/en/imgsfw/data/NIS_Viewer_Ver$($version_stripped)_E.zip"
    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion