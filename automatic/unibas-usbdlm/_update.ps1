Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releaseurl = 'https://www.uwe-sieber.de/usbdlm_e.html'
$downloadurl = 'https://www.uwe-sieber.de/files/usbdlm_x64.msi'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $downloadurl -Algorithm 'sha256'
}

function global:au_GetLatest {
  $request = Invoke-WebRequest $releaseurl -UseBasicParsing
  $request.Content -match "(USBDLM V)(\d+\.\d+\.\d+)( - )"
  $Version = $Matches[2]
  return @{
    Version = $Version
    URL     = $downloadurl
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

Update -ChecksumFor none -NoCheckChocoVersion
