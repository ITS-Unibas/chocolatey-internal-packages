import-module au

$releases = 'https://dotnet.microsoft.com/en-us/download/dotnet'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*fileType\s*=\s*)('.*')"     = "`$1'$($Latest.FileType)'"
            "(?i)(^\s*softwareName\s*=\s*)('.*')" = "`$1'$($Latest.packageName)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $latestversion = $download_page.Links | ? href -match "download/dotnet"  | % href | select -First 1
    $domain  = $releases -split '(?<=//.+)/' | select -First 1
    $versionurl = $domain + $latestversion
    $version = $latestversion -split "/" | select -Last 1
    
    $download_page = Invoke-WebRequest -Uri $versionurl -UseBasicParsing
    $latestversion = $download_page.Links | ? {($_.href -match 'runtime-desktop') -and ($_.href -match 'windows-x64-installer')} | % href | select -First 1
    $versionurl = $domain + $latestversion

    $download_page = Invoke-WebRequest -Uri $versionurl -UseBasicParsing
    $url = $download_page.Links | ? href -match ".exe$" | % href | select -First 1

    @{
        Version      = $version
        URL          = $url
    }
}

update -ChecksumFor 64
