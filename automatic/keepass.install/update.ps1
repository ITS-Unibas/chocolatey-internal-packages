Import-Module chocolatey-au

$releases = 'https://keepass.info/download.html'

function global:au_BeforeUpdate() {
    Invoke-RestMethod -UseBasicParsing -Uri $Latest.URL -OutFile "keepass.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
    $Latest.Checksum = Get-FileHash "$PSScriptRoot\keepass.exe" -Algorithm 'sha256' | Select-Object -ExpandProperty Hash
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
    $base_url = $download_page.Links | Where-Object href -match 'KeePass%202\.x/\d+\.\d+(?:\.\d+)?/KeePass-\d+\.\d+(?:\.\d+)?-Setup\.exe/download' | Select-Object -First 1 -ExpandProperty href
    $version = $base_url -replace '.*KeePass%202\.x/(\d+\.\d+(?:\.\d+)?)/.*', '$1'
    $url = "${base_url}?use_mirror=netcologne#"

    return @{
        URL     = $url
        Version = $version
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion
