Import-Module chocolatey-au
$releases = 'https://www.openmicroscopy.org/omero/downloads/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"     = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url     = $download.links | ? href -match ".msi" | % href
    $version = $($url -split '/' | select -Last 1 -Skip 1) -split 'v' | select -Last 1
    

    @{
        Version      = $version
        URL          = $url
    }
}

update