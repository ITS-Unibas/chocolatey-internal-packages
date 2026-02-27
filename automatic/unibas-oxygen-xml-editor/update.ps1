Import-Module chocolatey-AU

$releases = 'https://www.oxygenxml.com/xml_editor/download_oxygenxml_editor.html?os=Windows'

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

    $re = "Version: \s*<[^>]+>(\d+\.\d+)"
    $buildnumber = "Build id:(\s*<[^>]+>){1,2}(\d+)<\/a>"

    $version = ([regex]::Match($download_page.RawContent, $re)).Groups[1].Value
    $build = ([regex]::Match($download_page.RawContent, $buildnumber)).Groups[2].Value

    $complete_version = "$version.$build"

    return @{
        URL64 = $url64
        Version = $complete_version
    }
}

update -ChecksumFor 64
