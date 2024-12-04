Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://devolutions.net/remote-desktop-manager/home/download'
$softwareName= "Remote Desktop Manager"

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
  $urltext = $download_page.ToString()
  $regExResult = $urltext | Select-String -Pattern 'Version:\s*(\d+\.\d+\.\d+\.\d+)'
    $version = $regExResult.Matches[0].Groups[1].Value
  $url = "https://cdn.devolutions.net/download/Setup.RemoteDesktopManager."
  $url += $version
  $url += ".exe"
  return @{
    URL     = $url
    Version = $version
  }
}

update -ChecksumFor none
