import-module chocolatey-au
import-module Wormies-AU-Helpers
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $locationHeader = Get-RedirectedUrl 'https://www.mindmanager.com/mm-win-enterprise-admin-64'
    if ($locationHeader) {if ($locationHeader -match 'MindManager_64bit_(\d+\.\d+\.\d+)_Admin\.zip') {
            $version = $Matches[1]
        }
    }
    return @{
        Version = $version
        URL = $locationHeader
        PackageName = 'unibas-mindmanager'
    }
}

function global:au_BeforeUpdate() {
    $global:Latest = au_GetLatest
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}

function global:au_SearchReplace {
    @{
      ".\tools\chocolateyInstall.ps1" = @{
        "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
        "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
        "(?i)(^\s*fileLocation\s*=\s*Join-Path\s*\$toolsDir\s*'MindManager\s*)\d+(\.msi')" = "`$1$($Latest.Version.Split('.')[0])`$2"
      }
    }
  }
 
update -ChecksumFor none