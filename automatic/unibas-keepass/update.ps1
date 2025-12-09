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
    $base_url_short = $download_page.Links | Where-Object href -match 'filepool/KeePass-(.*)\.msi$' | Select-Object -ExpandProperty href
    $base_url = ($releases -replace 'download.html','') + $base_url_short
    $version = $base_url -replace '.*KeePass-(.*)\.msi$', '$1' -replace '-','.'

    return @{
        URL     = $base_url
        Version = $version
    }
}

Update-Package -NoCheckChocoVersion