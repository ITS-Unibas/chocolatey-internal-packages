import-module AU
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://filezilla-project.org/download.php?show_all=1'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm "sha256"
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Chocolatey"
  $url = $download_page.Links | ? href -match "win64\-setup\.exe" | select -first 1 -expand href
  $version = Get-Version $url64

  return @{
      Version  = $version
      URL      = $url
  }
}

update -NoCheckChocoVersion -ChecksumFor none
