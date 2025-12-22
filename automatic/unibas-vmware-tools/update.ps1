Import-Module chocolatey-au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releaseurl = "https://packages.vmware.com/tools/releases/latest/windows/x64/"

function global:au_GetLatest {
  $Version = "0.0"
  $content = Get-Content ".\tools\chocolateyInstall.ps1"
  $HasMatches = $false
  foreach ($line in $content) {
    if($line -match "(\s*checksum\s*=\s*)('.*')") {
      $HasMatches = $true
      continue
    }
  }
  $OldChecksum = ''
  if($HasMatches) {
    if($Matches -and $Matches[2]) {
      $OldChecksum = $Matches[2].Replace("'", "")
    }
  }
  $html_content = Invoke-WebRequest -Uri $releaseurl
  $file = $html_content.Links | Where-Object href -like "*.exe" | Select-Object -ExpandProperty href
  $url = $releaseurl + $file
  $checksum = Get-RemoteChecksum -Url $url -Algorithm 'sha256'
  if($checksum -ne $OldChecksum) {
    Invoke-WebRequest $url -OutFile 'vmware-tools.exe' -UseBasicParsing
    $Version = Get-Item 'vmware-tools.exe' | Select-Object -ExpandProperty VersionInfo | Select-Object -ExpandProperty ProductVersion
  }
  return @{
    Version = $Version
    URL     = $url
    Checksum = $checksum
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

Update -ChecksumFor none -NoCheckChocoVersion
