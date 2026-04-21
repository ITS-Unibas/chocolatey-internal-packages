Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://devolutions.net/productinfo.htm'

function global:au_BeforeUpdate() {
  (Invoke-WebRequest -UseBasicParsing $releases).content -match "RDMsetup\.hash=(\w*)"
  $Latest.Checksum = $Matches[1]
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
  $download_page = Invoke-WebRequest -UseBasicParsing $releases

  $download_page.content -match "RDMsetup\.Url=([\w:\/\.]*)"
  $url = $matches[1]

  $download_page.content -match "RDMsetup\.Version=([\d\.]*)"
  $version = $matches[1]

  $deversionurl = 'https://community.chocolatey.org/packages/rdm#dependencies'
  $deversiontext = Invoke-WebRequest -Uri $deversionurl -UseBasicParsing | Select-Object -ExpandProperty Content
  $deversiontext = $deversiontext -replace '<.*?>', ''
  if ($deversiontext -cmatch '(?i)dotnet-\d+\.0-desktopruntime\s*\(\s*\u2265\s*(\d+(?:\.\d+)+)\s*\)') {
    $depversion1 = $matches[1]
  }
  return @{
    URL     = $url
    Version = $version
    DependencyVersion1 = $depversion1 # dotnet
  }
}

function global:au_AfterUpdate {
  $NuspecFilePath = Join-Path -Path $PSScriptRoot -ChildPath 'unibas-rdm.nuspec'
  [xml]$xml = Get-Content -Path $NuspecFilePath
  $xml.package.metadata.dependencies.dependency | Where-Object { $_.id -eq "unibas-dotnetdesktopruntime" } | ForEach-Object { $_.version = "[$($Latest.DependencyVersion1),)" }
  $xml.Save($NuspecFilePath)
}

update -ChecksumFor none
