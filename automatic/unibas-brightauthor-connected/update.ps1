Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://brightsign-builds.s3.us-east-1.amazonaws.com/web/bs-download-versions.json'

function global:au_BeforeUpdate() {
  Get-RemoteFiles -Purge -FileNameBase 'unibas-brightauthor-connected'
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
  $jsonData = Invoke-RestMethod -Uri $releases
  $baconData = $jsonData.general.bacon

  $version = $baconData.version
  $url = if ($baconData.'pc-link') { $baconData.'pc-link' } else { throw "PC download link not found" }
  return @{
    Version = $version
    URL = $url
  }
}

update -ChecksumFor none -NoCheckChocoVersion -NoCheckURL