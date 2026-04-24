Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://devolutions.net/productinfo.htm'
$download_page = ((Invoke-WebRequest -UseBasicParsing $releases).content) -split '\s+'

function global:au_BeforeUpdate() {
  $hash = $version = ($download_page -match "^RDMsetup\.hash=.*$" -split "=")[1]
  $Latest.Checksum = $hash
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
  $url = ($download_page -match "^RDMsetup\.Url=.*$" -split "=")[1]
  $version = ($download_page -match "^RDMsetup\.Version=.*$" -split "=")[1]
  
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
