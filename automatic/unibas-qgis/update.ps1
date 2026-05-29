Import-Module chocolatey-au

$releases = 'https://qgis.org/resources/installation-guide/'
$LTRregex = '<td>Long Term Release.*href=(.*)>Installer</a>'
$versionregex = '<td>Long Term Release</td><td>([\d\.]*) .*'

function global:au_BeforeUpdate {
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
    $download_page.Content -match "$LTRregex"

    $url = ($Matches.Values -match ".*\.msi$")[0]
    $versionraw = ($Matches.Values -match "$versionregex")[0]
    $version = $versionraw -replace "$versionregex","`$1"

    $checksumpage = $url -replace "(.*)\.msi$","`$1`.sha256sum"
    $checksum = (Invoke-WebRequest -UseBasicParsing -Uri $checksumpage).content -replace "^(\w*)[ \t]*.*","`$1"
    $checksum = $checksum.Trim()


    return @{
        URL      = $url
        Version  = $version
        Checksum = $checksum
    }
}

Update-Package -NoCheckChocoVersion -nocheckurl -checksumfor none
