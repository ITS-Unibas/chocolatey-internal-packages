Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://community.chocolatey.org/packages/logioptionsplus'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$url64\s*=\s*)('.*')"           = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*\`$checksum64\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*\`$checksumType64\s*=\s*)('.*')"  = "`$1'$($Latest.ChecksumType64)'"
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
        $checksum = Get-RemoteChecksum $url -Algorithm 'sha256'
        
        return @{
            Version = $version
            URL64 = $url
            Checksum64 = $checksum
            ChecksumType64 = 'sha256'
        }
    } else {
        throw "Could not find version information"
    }
}

update -ChecksumFor all -NoCheckChocoVersion