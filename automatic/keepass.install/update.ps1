Import-Module chocolatey-au

$releases = 'https://sourceforge.net/projects/keepass/rss?path=/KeePass%202.x'

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
    $rss = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $xml = [xml]$rss.Content

    $firstItem = $xml.rss.channel.item | Select-Object -First 1
    $version = ($firstItem.title.InnerText -split 'KeePass-' | Select-Object -Last 1) -split '-Setup.exe' | Select-Object -First 1
    $url = $firstItem.link

    return @{
        URL     = $url
        Version = $version
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion
