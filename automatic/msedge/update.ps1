Import-Module chocolatey-au

# Taken from @DennisGaida (https://github.com/DennisGaida/chocolatey-packages/blob/master/microsoft-edge/update.ps1)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_api_url  = 'https://edgeupdates.microsoft.com/api/products'
$release_branch       = "Stable"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  $download_api_content = (Invoke-WebRequest -Uri $download_api_url -UseBasicParsing).Content
  $json_data = $download_api_content | ConvertFrom-Json
  $releases = $json_data | Where-Object -Property Product -eq $release_branch | Select-Object Releases
  $download_url_64 = ($releases.Releases | Where-Object {$_.Platform -eq 'Windows'} | Where-Object {$_.Architecture -eq 'x64'}).Artifacts.Location
  $download_hash_64 = ($releases.Releases | Where-Object {$_.Platform -eq 'Windows'} | Where-Object {$_.Architecture -eq 'x64'}).Artifacts.Hash
  $version_number = ($releases.Releases | Where-Object {$_.Platform -eq 'Windows'} | Where-Object {$_.Architecture -eq 'x64'}).ProductVersion.Trim()
  
  $Latest = @{URL = $download_url_64; Version = $version_number; Checksum = $download_hash_64}
  return $Latest  
}

update -ChecksumFor none
