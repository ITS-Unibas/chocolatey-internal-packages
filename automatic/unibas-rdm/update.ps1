

#import-module au

Import-Module AU

$releases = 'https://devolutions.net/remote-desktop-manager/home/previousversions'

function global:au_BeforeUpdate() {
    Invoke-WebRequest -UseBasicParsing -Uri $Latest.URL -OutFile "rdm.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
    $Latest.Checksum = Get-FileHash "$PSScriptRoot\rdm.exe" -Algorithm 'sha256' | Select-Object -ExpandProperty Hash
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
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regex = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.\d\d\d\d.\d.\d\d.\d.exe'
    $url = ($page.links | Where-Object href -Match $regex | Select-Object -First 1).href

    return @{
        URL   = $url
        Version = $matches.version
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion