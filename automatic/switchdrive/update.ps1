import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = 'https://help.switch.ch/drive/downloads/#collapse-80e712df-6688-11e4-b6ef-5254009dc73c-1'

function global:au_BeforeUpdate() {
  $Latest.Checksum = Get-RemoteChecksum $Latest.URL -Algorithm 'sha256'
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1`'$($Latest.URL)`'"
      "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum)`'"
    }
  }
}

function download_extract {
  param ([string]$Url)

  # Downloads the installer and gets the version out of it
  Invoke-WebRequest -Uri $Url -OutFile ".\installer.msi"
  $pathToInstaller = (Get-ChildItem ".\installer.msi").FullName

  $windowsInstaller = New-Object -ComObject WindowsInstaller.Installer
  $database = $windowsInstaller.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $null, $windowsInstaller, @($pathToInstaller, 0))

  $query = "SELECT `Value` FROM `Property` WHERE `Property` = 'ProductVersion'"
  $view = $database.GetType().InvokeMember("OpenView", "InvokeMethod", $null, $database, ($query))
  $view.GetType().InvokeMember("Execute", "InvokeMethod", $null, $view, $null)
  $record = $view.GetType().InvokeMember("Fetch", "InvokeMethod", $null, $view, $null)

  $ver = $record.GetType().InvokeMember("StringData", "GetProperty", $null, $record, 1)
  $ver = $ver | Out-String
  
  # Close all handles to be able to delete the msi
  $view.GetType().InvokeMember("Close", "InvokeMethod", $null, $view, $null)
  [System.Runtime.InteropServices.Marshal]::ReleaseComObject($record) | Out-Null
  [System.Runtime.InteropServices.Marshal]::ReleaseComObject($view) | Out-Null
  [System.Runtime.InteropServices.Marshal]::ReleaseComObject($database) | Out-Null
  [System.Runtime.InteropServices.Marshal]::ReleaseComObject($windowsInstaller) | Out-Null

  Remove-Item .\installer.msi -Force

  return $ver
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '\/s\/'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href 
  $ver = (download_extract -Url $url) | Out-String
  $versionFix = $ver -replace "`n?`r", " "
  $version = $versionFix -replace " ", ""
  return @{ Version = $version; URL = $url }
}

update -ChecksumFor none -NoCheckChocoVersion
