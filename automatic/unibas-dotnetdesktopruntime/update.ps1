Import-Module chocolatey-au

$sdk_download_url  = 'https://dotnet.microsoft.com/en-us/download/dotnet/10.0/'
$ddrt_download_url_main = 'https://dotnet.microsoft.com/en-us/download/dotnet/10.0/' #ddrt = dotnet desctop runtime

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
    $sdk_download_page = Invoke-WebRequest -Uri $sdk_download_url -UseBasicParsing

    [version]$sdk_version = ((($sdk_download_page.Links.href | ? {$_ -match "runtime-desktop"}) | select-object -First 1) -split("/"))[-1] -replace "runtime-desktop-", "" -replace "-windows-x64-installer", ""

    $ddrt_download_page = Invoke-WebRequest -Uri $sdk_download_url -UseBasicParsing
    $ddrt_url_part = $ddrt_download_page.Links.href | ? {$_ -match "(runtime-desktop-)(.*)(-windows-x64-installer)$"} | ? {$_ -notmatch "preview|rc."} | Sort-Object -Descending | Select -First 1
    $dotnet_main_url = $sdk_download_url -split '(?<=//.+)/' | select -First 1
    $ddrt_download_url_latest = $dotnet_main_url + $ddrt_url_part

    $ddrt_download_page_latest = Invoke-WebRequest -Uri $ddrt_download_url_latest -UseBasicParsing

    $url = $ddrt_download_page_latest.links.href | ? {$_ -match "^(.*)(windowsdesktop-runtime-)(.*)(-win-x64.exe)$"} | Select -First 1
    $version = $matches[3]

    @{
	URL     = $url
	Version	= $version
    }
}

update -ChecksumFor 64 -NoCheckChocoVersion
