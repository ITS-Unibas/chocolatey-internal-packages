Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://devolutions.net/remote-desktop-manager/home/download'
$softwareName= "Remote Desktop Manager"

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm "sha256"
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $urltext = $download_page.ToString()
  $regExResult = $urltext | Select-String -Pattern 'Version:\s*(\d+(?:\.\d+)+)' -CaseSensitive:$false
    $version = $regExResult.Matches[0].Groups[1].Value
  $url = "https://cdn.devolutions.net/download/Setup.RemoteDesktopManager."
  $url += $version
  $url += ".exe"

  $deversionurl = 'https://community.chocolatey.org/packages/rdm#dependencies'
  $deversiontext = Invoke-WebRequest -Uri $deversionurl -UseBasicParsing | Select-Object -ExpandProperty Content
  $deversiontext = $deversiontext -replace '<.*?>', ''
  if ($deversiontext -cmatch '(?i)dotnet-9.0-desktopruntime\s*\(\s*\u2265\s*(\d+(?:\.\d+)+)\s*\)') {
    $depversion1 = $matches[1]
  }
  if ($deversiontext -cmatch '(?i)webview2-runtime\s*\(\s*\u2265\s*(\d+(?:\.\d+)+)\s*\)') {
    $depversion2 = $matches[1]
  }
  return @{
    URL     = $url
    Version = $version
    DependencyVersion1 = $depversion1 # dotnet
    DependencyVersion2 = $depversion2 # webview2
  }
}

function global:au_AfterUpdate {
  $NuspecFilePath = Join-Path -Path $PSScriptRoot -ChildPath 'unibas-rdm.nuspec'
  [xml]$xml = Get-Content -Path $NuspecFilePath
  $xml.package.metadata.dependencies.dependency | Where-Object { $_.id -eq "unibas-msedge-webview2" } | ForEach-Object { $_.version = "[$($Latest.DependencyVersion2),)" }
  $xml.package.metadata.dependencies.dependency | Where-Object { $_.id -eq "unibas-dotnetdesktopruntime" } | ForEach-Object { $_.version = "[$($Latest.DependencyVersion1),)" }
  $xml.Save($NuspecFilePath)
}

update -ChecksumFor none