#import-module au

Import-Module au

$releases = 'https://devolutions.net/remote-desktop-manager/home/download'
$softwareName= "Remote Desktop Manager"

function global:au_BeforeUpdate() {
    $Latest.Checksum = Get-Checksum -version $Latest.Version -checksumType $Latest.ChecksumType
}


function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
           "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
        }
   
     ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
     }
}

Function GetVersion($InputString) {
    $regExResult = $InputString | Select-String -Pattern 'Version 202\d.\d.\d\d.\d' 
    $regExResult.Matches[0].Value
}






function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    #get Versionnumber
    $urltext = $download_page.ToString()
    $version = GetVersion -InputString $urltext
    $version_number = $version -replace "Version "
    $url = "https://cdn.devolutions.net/download/Setup.RemoteDesktopManager."
    $url+=$version_number
    $url+=".exe"
    return @{
        URL   = $url
        Version = $version_number
    }
}

Update-Package -ChecksumFor None -NoCheckChocoVersion
