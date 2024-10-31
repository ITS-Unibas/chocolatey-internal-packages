Import-Module chocolatey-AU

$releases = 'https://www.oxygenxml.com/build_history.html'

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

    $url64 = 'https://mirror.oxygenxml.com/InstData/Editor/Windows64/VM/oxygen-64bit-openjdk.exe'

    $re = "Version (\d+\.\d+)"

    $version = ([regex]::Match($download_page.RawContent, $re)).Captures.Groups[1].value

    return @{
        URL64 = $url64
        Version = $version
    }
}

update -ChecksumFor 64