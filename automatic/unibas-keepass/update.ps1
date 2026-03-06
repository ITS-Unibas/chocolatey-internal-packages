Import-Module chocolatey-au

$releases = 'https://keepass.info/download.html'

function global:au_BeforeUpdate {
  if ($Latest.Url) {
    $checksums = 'https://keepass.info/integrity.html'
    (Invoke-WebRequest -Uri $checksums -UseBasicParsing).content -match "KeePass-($version)\.msi<[\s\S]+?SHA-256.*<code>([\w\s]*)"
    $Latest.ChecksumType = 'sha256'
    $Latest.Checksum = ($matches[2] -replace " ","")
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


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $base_url = $download_page.Links | Where-Object href -match '2\.x/[\d\.]+/KeePass-[\d\.]+\.msi/download' | Select-Object -ExpandProperty href
    $version = ($base_url -split "/")[-3]
    $final_url = $base_url -replace '(.*)/download','$1'

    return @{
        URL     = $final_url
        Version = $version
    }
}

Update-Package -NoCheckChocoVersion -nocheckurl -checksumfor none
