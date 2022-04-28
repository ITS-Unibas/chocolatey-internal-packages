Import-Module AU

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://filezilla-project.org/download.php?show_all=1'

function global:au_BeforeUpdate() {
 Get-RemoteFiles -Purge -FileNameBase "FileZilla_$($Latest.Version)"
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
  $regex = "win64\-setup\.exe"
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split "_" | ? { $_ -match '^\d+\.[\d\.]+$' } | select -first 1
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
