Import-Module chocolatey-AU

$releases = 'https://www.maxqda.com/de/produkte/maxqda-release-notes'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url64 = Get-RedirectedUrl 'https://www.maxqda.com/download/maxqdademo'

<<<<<<< HEAD
    $re = "Release (\d+\.\d+)"
=======
    $re = "Release ([\d+\.]+)"
>>>>>>> 3a281d320b89097d0e065df1ec4561b572a50628

    $version = ([regex]::Match($download_page.RawContent, $re)).Captures.Groups[1].value

    return @{
        URL64 = $url64
        Version = $version
    }
}

update -ChecksumFor 64
