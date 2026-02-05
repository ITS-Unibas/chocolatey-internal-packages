import-module chocolatey-au

$urlEvergreenManifestMicrosoftEdgeWebView2Runtime = "https://raw.githubusercontent.com/aaronparker/apptracker/refs/heads/main/json/MicrosoftEdgeWebView2Runtime.json"

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'            = "`$1'$($Latest.url64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    # Get the version for MicrosoftEdgeWebView2Runtime
    $content = Invoke-WebRequest -Uri $urlEvergreenManifestMicrosoftEdgeWebView2Runtime -UseBasicParsing
    $contentJSON = $content.Content | ConvertFrom-Json
    $url = $contentJSON.URI | Where-Object {$_ -like '*X64*'}
    $version = ($contentJSON | Where-Object {$_.Architecture -eq 'x64'} | Select-Object -Property Version).Version

    # return everything
    return @{
        url64		= $url
        version		= $version
    }
}

Update-Package -NoCheckChocoVersion -ChecksumFor 64
