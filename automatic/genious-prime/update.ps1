Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://www.geneious.com/updates'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 -Algorithm $Latest.ChecksumType64
}

function global:au_SearchReplace {
  @{
    '.\tools\chocolateyinstall.ps1' = @{
      '(?i)(^\s*url64\s*=\s*)(''.*'')'      = "`$1'$($Latest.URL64)'"
      '(?i)(^\s*checksum64\s*=\s*)(''.*'')' = "`$1'$($Latest.Checksum64)'"
      '(?i)(^\s*checksumType64\s*=\s*)(''.*'')' = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $installerPattern = '(?i)(?:^|/)Geneious_Prime_win64_(?<version>\d+(?:_\d+){1,3})_with_jre\.exe(?:[?#].*)?$'

  # first windows installer on the updates page is the current release
  $download = $downloadPage.Links |
    Where-Object { $_.href -match $installerPattern } |
    Select-Object -First 1 -ExpandProperty href

  $url64 = [uri]::new([uri]$releases, [string]$download)
  # use the full installer version (2026.1.3), not the heading (2026.1)
  $version = [regex]::Match($url64.AbsolutePath, $installerPattern).Groups['version'].Value -replace '_', '.'

  return @{
    Version        = $version
    URL64          = $url64.AbsoluteUri
    ChecksumType64 = 'sha256'
  }
}

update -ChecksumFor none -NoCheckChocoVersion
