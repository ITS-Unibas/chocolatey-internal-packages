Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-anaconda3'
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
  $Latest.Options.Headers = @{
  'Referer'    = $Latest.URL + "/";
  'User-Agent' = $Latest.Options.Headers.'User-Agent'
  }
}
function global:au_GetLatest {
  $ArchiveURL = 'https://repo.continuum.io/archive/'
  $List = Invoke-WebRequest -Uri $ArchiveURL -UseBasicParsing

  $regex = "Anaconda3.*Windows"
  $installer = $List.links | Where-Object {$_.href -match $regex} | Select-Object -First 1 -ExpandProperty href

  $versionRaw = $installer -replace "Anaconda3-(.*?)-Windows-x86_64.exe", '$1'
  $version = $versionRaw -replace "-", "."

  $URL64 = "https://repo.continuum.io/archive/Anaconda3-$versionRaw-Windows-x86_64.exe"
  $HTTPheaders = @{
  'Referer'    = $ArchiveURL;
  'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'
  }

  return @{
    Version = $version
    URL     = $URL64
    Options = @{ Headers = $HTTPheaders }
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
