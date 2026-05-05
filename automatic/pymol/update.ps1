Import-Module chocolatey-AU

$releases = 'https://www.pymol.org/#download'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(\s*url\s*=\s*)('.*')"             = "`$1'$($Latest.URL64)'"
            "(\s*checksum\s*=\s*)('.*')"        = "`$1'$($Latest.Checksum64)'"
            "(\s*checksumType\s*=\s*)('.*')"    = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    Write-Host "Fetching PyMOL download page..."

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    # Match direct installer links from CDN
    $regex = 'https:\/\/storage.googleapis.com\/pymol-storage\/installers\/PyMOL-([\d\.]+)-Windows-x86_64.exe'

    $match = [regex]::Match($download_page.Content, $regex)

    if (-not $match.Success) {
        throw "Could not find PyMOL installer link."
    }

    $url64  = $match.Value
    $version = $match.Groups[1].Value

    Write-Host "Found URL: $url64"
    Write-Host "Version: $version"

    return @{
        URL64  = $url64
        Version = $version
    }
}

update -ChecksumFor 64
