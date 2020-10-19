import-module au -Force

$releases = 'https://www.python.org/downloads/windows/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm sha256
 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $releaseUrls = $download_page.links | ? { $_.href -match 'release' -and $_.InnerText -match "Python 3\.\d+\.\d+\s.*" }

    $version = '0.0'
    $url = ''
    foreach ($releaseUrl in $releaseUrls) {
        $nextVersion = $releaseUrl.InnerText.Trim() -split ' ' | Select-Object -Index 1
        try {
            if([version]$version -lt [version]$nextVersion) {
                $version = $nextVersion
                $download_page = Invoke-WebRequest -Uri "https://www.python.org$($releaseUrl.href)" -UseBasicParsing
                $url = $download_page.links | Where-Object href -match "python-3.+amd64\.(exe|msi)$" | Select-Object -first 1 -expand href
                if (!$url) {
                    Write-Host "Skipping due to missing installer: '$version'"; return
                }
                if (!$url.StartsWith('http')) {
                    $url = 'https://www.python.org' + $url
                }
            }
        } catch {
            Write-Warning "Version cast not possible, possible due to wrong version format"
        }


    }

    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
