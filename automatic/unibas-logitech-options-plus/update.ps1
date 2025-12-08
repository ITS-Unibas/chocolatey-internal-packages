Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://community.chocolatey.org/packages/logioptionsplus'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$url\s*=\s*)('.*')"           = "`$1'$($Latest.URL)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    # Extract version from the page using regex
    $versionPattern = [regex]::new('Logi Options\+\s*([\d.]+)', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    $versionMatch = $versionPattern.Match($download_page.Content)
    
    if ($versionMatch.Success) {
        $version = $versionMatch.Groups[1].Value
        
        # Use the official Logitech download URL
        $url = 'https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe'
        
        return @{
            Version = $version
            URL = $url
        }
    } else {
        throw "Could not find version information"
    }
}

update -ChecksumFor all -NoCheckChocoVersion