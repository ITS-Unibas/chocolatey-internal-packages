Import-Module chocolatey-au

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
    Start-Sleep -Seconds 5
    $cache_page = (Invoke-WebRequest $releases -UseBasicParsing).Links.href
    $download_page = $cache_page | Select-String '/tag/' | Select-Object -First 1

    if (-not $download_page) {
        Write-Host "No new version for obs studio found"
        return
    }

    $Matches = $null
    $download_page -match '\d+\.\d+\.\d+'
    $version = $Matches[0]
    # Construct the URL using the version number
    $url64 = "https://github.com/obsproject/obs-studio/releases/download/$version/OBS-Studio-$version-Windows-Installer.exe"

    return @{ Version = $version; URL64 = $url64; }
}

if ($MyInvocation.InvocationName -ne '.') {
    # run the update only if script is not sourced
    Update-Package -checksumfor none -NoCheckChocoVersion
}