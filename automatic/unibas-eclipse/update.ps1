Import-Module chocolatey-au

function global:au_BeforeUpdate {
  if ($Latest.Url64) {
    $Latest.ChecksumType64 = 'sha256'
    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.Url64 -Algorithm $Latest.ChecksumType64
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64\s*=\s*)('.*')"      = "`$1`'$($Latest.Url64)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}

function global:au_GetLatest {
    $uri = "https://www.eclipse.org/downloads/packages/"
    $content = Invoke-Webrequest -Uri $uri -UseBasicParsing

    # Get URL
    $urlRegex = "eclipse-jee-\d{4}-\d{2}-R-win32-x86_64.zip$"
    $urlRaw = $content.links.href -match $urlRegex
    $url64 = ($urlRaw).replace('//', 'https://') + "&r=1"

    # Get version
    $urlVersion = "https://download.eclipse.org/eclipse/downloads/data.json"
    $json = Invoke-Webrequest -Uri $urlVersion -UseBasicParsing | ConvertFrom-Json
    $version = $json.releases[0].label

    return @{
        url64 = $url64
        version = $version
    }
}

Update-Package -ChecksumFor 64 -NoCheckChocoVersion
