Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.fosshub.com/Audacity.html'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase $Latest.PackageName
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
  $installer_exe = $download_page.Links | Where-Object href -match 'audacity-win-.*.exe$' | Select-Object -First 1 -expand href
  if ($installer_exe) {
    $version = $installer_exe -split '-|.exe' | Select-Object -Skip 2 -First 1
  }

  if ($version) {
    $url = $releases + "?dwl=audacity-win-" + $version + ".exe"
  }

  @{
    URL    = $url
    Version  = $version
    FileType = 'exe'
  }
}

update -ChecksumFor none -NoCheckChocoVersion -Force
