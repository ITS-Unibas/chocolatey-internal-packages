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
    $headers = @{
        'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing -Headers $headers

    $regex = 'https:\/\/sourceforge\.net\/projects\/keepass\/files\/KeePass%202.x\/(?<version>[\d\.]+)\/KeePass-[\d\.]+-Setup\.exe\/download'
    $sourceforge_url = ($page.links | Where-Object href -Match $regex | Select-Object -First 1).href
    $url = Get-RedirectedUrl $sourceforge_url

    return @{
        URL   = $url
        Version = $matches.version
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion
