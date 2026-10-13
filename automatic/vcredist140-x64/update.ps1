Import-Module chocolatey-au

$releases = "https://raw.githubusercontent.com/aaronparker/VcRedist/master/VcRedist/VisualCRedistributables.json"
$vcrelease = '14'
$architecture = 'x64'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm $Latest.ChecksumType
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
      '(?i)(^\s*checksumType\s*=\s*)(''.*'')' = "`$1'$($Latest.ChecksumType)'"
    }
  }
}

function global:au_GetLatest {
  $release = (Invoke-WebRequest -UseBasicParsing -Uri $releases | ConvertFrom-Json).Supported | ?{$_.release -eq $vcrelease -and $_.Architecture -eq $architecture}

  return @{
        URL          =  $release.URI
        Version      =  $release.Version
        ChecksumType =  'sha256'
  } 
}

update -ChecksumFor none -NoCheckChocoVersion
