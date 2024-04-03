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
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1`'$($Latest.Url64)`'"
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
    $versionRegex = "(Eclipse\s\d{4}-\d{2}\s)(\(.*\))"
    $content.RawContent -match $versionRegex
    $versionRaw = $matches[2]
    $version = ($versionRaw).replace('(', '').replace(')', '')

    return @{
        url64 = $url64
        version = $version
    }
}

Update-Package -ChecksumFor none -NoCheckChocoVersion
