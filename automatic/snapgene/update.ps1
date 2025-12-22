Import-Module chocolatey-au -Force

$releases = 'https://www.snapgene.com/updates'

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
    $regex_latest_version = "The latest SnapGene version is<!-- --> <!-- -->([\d+\.]+)."
    $download_page.Content -match $regex_latest_version
    [version]$version = $matches[1]
    $reURL = "https:\/\/cdn.snapgene.com\/downloads\/SnapGene\/([\d+\.]+).x\/([\d+\.]+)\/([\d+\.]+)\/snapgene_([\d+\.]+)_win.exe"
    $url = ([regex]::Match($download_page.Content, $reURL)).Captures.value
    return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckUrl
