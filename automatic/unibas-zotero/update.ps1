Import-Module Chocolatey-AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://www.zotero.org/download/client/dl?channel=release&platform=win-x64'
$packageName = 'unibas-zotero'
$softwareName = 'Zotero'

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1`'$($Latest.ChecksumType64)`'"
      "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1`'$($Latest.URL)`'"
    }
  }
}

function global:au_GetLatest {
    $url = Get-RedirectedUrl -url $releases

    $version  = $url -split '/' | Select-Object -Last 1 -Skip 1

    @{
        Version      = $version
        URL          = $url
    }
}

update -ChecksumFor 64
