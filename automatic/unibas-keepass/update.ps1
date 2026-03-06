Import-Module chocolatey-au

$releases = 'https://keepass.info/download.html'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $base_url = $download_page.Links | Where-Object href -match '2\.x/[\.\d]+/KeePass-[\d\.]+\.msi/download' | Select-Object -ExpandProperty href
    $version = ($matches[0] -split "/")[1] 
    $final_url = $base_url -replace '(.*)/download','$1'

    return @{
        URL     = $final_url
        Version = $version
    }
}
Update-Package -NoCheckChocoVersion
