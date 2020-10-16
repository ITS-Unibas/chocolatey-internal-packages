#import-module au

Import-Module AU

$releases = 'https://keepass.info/download.html'

function global:au_BeforeUpdate() {
    Invoke-WebRequest -UseBasicParsing -Uri $Latest.URL -OutFile "keepass.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
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
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regex = 'https://sourceforge.net/projects/keepass/files/KeePass%202.x/(?<version>[\d\.]+)/KeePass-[\d\.]+-Setup.exe/download'
    $url = ($page.links | Where-Object href -Match $regex | Select-Object -First 1).href

    return @{
        URL   = $url
        Version = $matches.version
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion
