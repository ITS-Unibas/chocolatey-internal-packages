import-module AU
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://filezilla-project.org/download.php?show_all=1'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-filezilla' #name for override 
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL64)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Chocolatey"
  $url64 = $download_page.Links | ? href -match "win64\-setup\.exe" | select -first 1 -expand href
  $version = Get-Version $url64

  @{
      Version  = $version
      URL64    = $url64
      FileType = "exe"
  }
}

update -ChecksumFor none -NoCheckChocoVersion
