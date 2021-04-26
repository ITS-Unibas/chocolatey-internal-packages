Import-Module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://github.com/obsproject/obs-studio/releases/latest'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(^\s*x64:).*"         = "`${1} $($Latest.URL64)"
            "(?i)(^\s*checksum64\:).*" = "`${1} $($Latest.Checksum64)"
        }
    }
}
function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge
}

function global:au_GetLatest {
    $cache_page = (Invoke-WebRequest $releases -UseBasicParsing).Links.href
    $download_page = $cache_page | Select-String '/tag/' | Select-Object -First 1
    $Matches = $null
    $download_page -match '\d+\.\d+\.\d+'
    $version = $Matches[0]
    # Filenames omit ending '0' in version string; just scrape again.
    $url64 = 'https://github.com' + ($cache_page | Select-String 'x64.exe$' | Select-Object -First 1 )

    if ($url64.Equals('https://github.com')) {
        Write-Host "No new version for obs studio found"
        return
    }
    else {
        return @{ Version = $version; URL64 = $url64; }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    # run the update only if script is not sourced
    Update-Package -checksumfor none -NoCheckChocoVersion
}