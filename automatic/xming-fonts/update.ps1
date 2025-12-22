Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://sourceforge.net/projects/xming/files/Xming-fonts/'

function global:au_BeforeUpdate() {
  $file = Invoke-RestMethod -UseBasicParsing -Uri $Latest.URL -OutFile "xming-fonts.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
  $Latest.Checksum = Get-FileHash "$PSScriptRoot\xming-fonts.exe" -Algorithm 'sha256' | Select-Object -ExpandProperty Hash
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
  $download_page.Links | Where-Object href -match "projects\/xming\/files\/Xming-fonts\/(\d+\.\d+\.\d+\.\d+)"
  $version = $Matches[1]
  $downloadLink = Invoke-WebRequest "$releases/$version" -UseBasicParsing
  $sourceforge_url  = $downloadLink.Links | Where-Object href -match ".*exe/.*download" | Select-Object -ExpandProperty href
  $url = Get-RedirectedUrl $sourceforge_url

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
