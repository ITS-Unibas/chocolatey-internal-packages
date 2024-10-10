Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://filezilla-project.org/download.php?show_all=1'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase "FileZilla_$($Latest.Version)"}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Chocolatey" -Headers @{
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
}

  $url = $download_page.Links | Where-Object href -match "win64\-setup\.exe" | Select-Object -first 1 -expand href
  $version = $url -split '_' | Where-Object { $_ -match '^\d+\.[\d\.]+$' } | Select-Object -first 1

  return @{
      Version  = $version
      URL      = $url
  }
}

update -NoCheckChocoVersion -NoCheckUrl
