
$ErrorActionPreference = 'Stop'
Import-Module chocolatey-au

$download_page_url = 'https://zoom.us/rest/download?os=win'
$url_part1 = 'https://cdn.zoom.us/prod/'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"        = "`$1'$($Latest.Url32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.Url64)'"
        }
    }
}

function global:au_BeforeUpdate {
    if ($Latest.Url32) {
        $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    }

    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url
    $payload = $response.Content | ConvertFrom-Json

    # Zoom has separate version numbers for each architecture
    $version32 = $payload.result.downloadVO.zoom.version
    $version64 = $payload.result.downloadVO.zoomX64.version

    if ([string]::IsNullOrWhiteSpace($version64)) {
        throw 'Unable to retrieve the latest Zoom x64 version.'
    }

    # 32-bit installer (legacy)
    $url32 = "$url_part1$version32/ZoomInstallerFull.msi"

    # 64-bit installer
    $url64 = "$url_part1$version64/x64/ZoomInstallerFull.msi"

    return @{
        Version   = $version64
        URL32     = $url32
        URL64     = $url64
    }
}

update -ChecksumFor none -NoCheckChocoVersion
