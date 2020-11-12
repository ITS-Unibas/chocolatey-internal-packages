import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = 'https://www.kooijman.biz/files/VeraCrypt123HF2.msi'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-FileHash "$PSScriptRoot\veracrypt.msi" -Algorithm 'sha256' | Select-Object -ExpandProperty Hash
}
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function Get-VersionFromMsi() {
  param(
    $Path
  )
  $MSI = Get-Item $Path
  $windowsInstaller = New-Object -com WindowsInstaller.Installer
  $database = $windowsInstaller.GetType().InvokeMember(
    "OpenDatabase", "InvokeMethod", $Null,
    $windowsInstaller, @($MSI.FullName, 0)
  )

  $q = "SELECT Value FROM Property WHERE Property = 'ProductVersion'"
  $View = $database.GetType().InvokeMember(
    "OpenView", "InvokeMethod", $Null, $database, ($q)
  )

  $View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null) | Out-Null
  $record = $View.GetType().InvokeMember( "Fetch", "InvokeMethod", $Null, $View, $Null )
  $productversion = $record.GetType().InvokeMember( "StringData", "GetProperty", $Null, $record, 1 )

  $View.GetType().InvokeMember("Close", "InvokeMethod", $Null, $View, $Null) | Out-Null

  return $productversion
}

function global:au_GetLatest {
  Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile "veracrypt.msi" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox
  $version = Get-VersionFromMsi -Path "$PSScriptRoot\veracrypt.msi"

  $Latest = @{ URL = $url; Version = $version }
  return $Latest
}

update -ChecksumFor none
