Import-Module chocolatey-au

$url = "https://raw.githubusercontent.com/chocolatey-community/chocolatey-packages/refs/heads/master/automatic/vcredist140/tools/data.ps1"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function global:au_GetLatest {
  $content = (Invoke-Webrequest -Uri $url -UseBasicParsing).Content

  $urlReturn = [regex]::Matches($content, "Url\s*=\s*'(?<url>https?://[^']+)'")
  $url = $urlReturn[0].Groups['url'].Value

  $checksumReturn = [regex]::Matches($content, "Checksum\s*=\s*'(?<hash>.*)'")
  $checksum = $checksumReturn[0].Groups['hash'].Value

  $versionReturn = [regex]::Matches($content, "ThreePartVersion\s*=\s*\[version\]'(?<version>.*)'")
  $version = $versionReturn[0].Groups['version'].Value

  return @{
        URL          =  $url
        Checksum     =  $checksum
        Version      =  $version
  } 
}

update -ChecksumFor none
