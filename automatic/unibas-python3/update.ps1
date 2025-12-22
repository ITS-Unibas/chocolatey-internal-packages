Import-Module chocolatey-au -Force

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex_latest_version = "(Latest Python 3 Release - Python )(\d+\.\d+\.\d+)"
    $download_page.Content -match $regex_latest_version
    $version = $matches[2]
    $version_without_dots = $version -replace '\.'
    $download_page_Installer = Invoke-WebRequest -Uri "https://www.python.org/downloads/release/python-$version_without_dots" -UseBasicParsing
    $regex_pyton_installer = "python-3.+amd64\.(exe|msi)$"
    $url = $download_page_Installer.links | Where-Object href -match $regex_pyton_installer | Select-Object -first 1 -expand href

    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none
