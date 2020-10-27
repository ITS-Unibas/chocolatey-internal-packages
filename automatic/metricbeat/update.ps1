import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = 'https://www.elastic.co/downloads/beats/metricbeat'
$packageName = 'metricbeat'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1'   = @{
      "(^\s*[$]packageName\s*=\s*)(['""].*['""])" = "`$1'$($packageName)'"
      "(^\s*[$]url64\s*=\s*)(['""].*['""])"       = "`$1'$($Latest.URL64)'"
      "(^\s*[$]*checksum64\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum64)'"
      "(^\s*[$]*checksumType64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64Type)'"
    };
    'tools\chocolateyUnInstall.ps1' = @{
      "(^\s*[$]packageName\s*=\s*)(['""].*['""])" = "`$1'$($packageName)'"
    };
    "$($packageName).nuspec"        = @{
      "(<projectSourceUrl.*?)(\d+\.\d+)(.*?projectSourceUrl>)" = "`${1}$([regex]::match($Latest.Version, "\d+\.\d+").Value)`${3}"
      "(<docsUrl.*?)(\d+\.\d+)(.*?docsUrl>)"                   = "`${1}$([regex]::match($Latest.Version, "\d+\.\d+").Value)`${3}"
    };
  }
}

function global:au_GetLatest {
  $download_page = invoke-webrequest $url -UseBasicParsing -DisableKeepAlive

  $links = $download_page.Links | Where-Object { $_.href -imatch "msi" -and $_.href -notmatch "alpha|beta|-rc\d-" }

  $url64 = ($links | Where-Object { $_.href -imatch "x86_64.msi$" }).href

  $reVersion = "-(\d+.\d+.\d+)-"
  $arr = $url64 -split $reVersion
  $version =  $arr[1]

  $x = ($links | Where-Object { $_.href -imatch "x86_64.msi.sha" -and $_.href -match "msi\.(\w+)$" }).href | Select-Object -first 1
  $checksum64Type = $Matches[1]
  $checkSum64 = (Invoke-WebRequest ($x) -UseBasicParsing -DisableKeepAlive)
  $checkSum64 = [System.Text.Encoding]::Default.GetString($checkSum64.Content)
  $checkSum64 = ($checkSum64 | Out-String) -imatch "^\S+"
  $checkSum64 = $Matches[0]

  $Latest = @{ URL64 = $url64; Version = $version; Checksum64 = $checkSum64; Checksum64Type = $checksum64Type; }
  return $Latest
}

update -ChecksumFor none -NoCheckChocoVersion
