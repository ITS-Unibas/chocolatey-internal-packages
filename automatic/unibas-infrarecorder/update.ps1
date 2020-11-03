Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://sourceforge.net/projects/infrarecorder/files/InfraRecorder/'

function global:au_BeforeUpdate() {
  $file = Invoke-WebRequest -UseBasicParsing -Uri $Latest.URL -OutFile "infrarecorder.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
  $Latest.Checksum = Get-FileHash "$PSScriptRoot\infrarecorder.exe" -Algorithm 'sha256' | Select-Object -ExpandProperty Hash
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
  $version = "0.0"
  $download_page.Links | Where-Object href -match "projects\/infrarecorder\/files\/InfraRecorder\/(\d+\.\d+\.\d+|\d+\.\d+)" | ForEach-Object {
    if([version]$Matches[1] -gt [version]$version) {
      $version = $Matches[1]
    }
  }
  $downloadLink = Invoke-WebRequest "$releases/$version"
  $url = $downloadLink.Links | Where-Object href -match ".*msi/.*download" | Select-Object -ExpandProperty href

  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
