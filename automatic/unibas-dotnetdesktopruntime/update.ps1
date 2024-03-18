Import-Module chocolatey-au

$releases = 'https://dotnet.microsoft.com/en-us/download'

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

    $version_part_download_page = $download_page.Links | ? href -match "windows-x64-installer"
    $domain  = $releases -split '(?<=//.+)/' | select -First 1
    $version_download_page = $domain + $version_part_download_page
    
    $download_page = Invoke-WebRequest -Uri $version_download_page -UseBasicParsing
    $url = $download_page.Links.href | ? {($_ -match 'win-x64.exe$')} | select -First 1
    $version = ($url -split("/"))[-1] -replace "dotnet-sdk-", "" -replace "-win-x64.exe", ""

    @{
	URL	= $url
	Version	= $version
    }
}

update -ChecksumFor 64 -NoCheckChocoVersion
