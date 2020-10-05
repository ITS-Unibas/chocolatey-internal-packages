Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releaseurl = 'https://www.texniccenter.org/download/'

function global:au_BeforeUpdate() {
  Invoke-WebRequest $Latest.URL -OutFile "texniccenter.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
  $Latest.Checksum = Get-FileHash "texniccenter.exe" -Algorithm "sha256" | Select-Object -ExpandProperty Hash
}

function global:au_GetLatest {
  $request = Invoke-WebRequest $releaseurl
  $request.Content -match "TeXnicCenter (\d+\.\d+) Stable \(64 Bit\)"
  $Version = $Matches[1]
  return @{
    Version = $Version
    URL     = $request.Links -match "TXCSetup_($Version)Stable_x64.exe" | Select-Object -ExpandProperty href
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
