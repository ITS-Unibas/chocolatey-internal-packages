Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://autohotkey.com/download/1.1'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-autohotkey'
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
  $version = Invoke-WebRequest -Uri "$releases\version.txt" -UseBasicParsing | ForEach-Object Content
  $url = "https://github.com/Lexikos/AutoHotkey_L/releases/download/v${version}/AutoHotkey_${version}_setup.exe"
  @{
    Version  = $version
    URL      = $url
    FileName = $url -split '/' | Select-Object -Last 1
  }
}

update -ChecksumFor none -NoCheckChocoVersion
