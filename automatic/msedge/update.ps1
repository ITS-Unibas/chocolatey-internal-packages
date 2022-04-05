import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$download_page_url = 'https://www.microsoft.com/en-us/edge/business/download'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}
function global:au_GetLatest {
  
  $download_content = Invoke-WebRequest -Uri $download_page_url
  $DataDiv = $download_content.ParsedHtml.getElementById("commercial-json-data")
  $Json = ConvertFrom-Json $DataDiv.getAttribute("data-whole-json")
  $StableObjects = $Json | Where-Object Product -eq Stable | Select-Object -ExpandProperty Releases
  $StableWinObject = $StableObjects | Where-Object {$_.Architecture -eq "x64" -and $_.Platform -eq "Windows"}
  $LatestStableWinObject = $StableWinObject[0]
  
  $Url = $LatestStableWinObject.Artifacts.Location
  $Checksum = $LatestStableWinObject.Artifacts.Hash
  $version = $LatestStableWinObject.ProductVersion
  
  $Latest = @{ URL = $Url; Version = $version; Checksum = $Checksum }
  
  return $Latest
}

update -ChecksumFor none
