import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Thanks to https://stackoverflow.com/questions/20259251/powershell-script-to-check-the-status-of-a-url
function Get-UrlStatusCode([string] $Url)
{
    try
    {
        (Invoke-WebRequest -Method HEAD -Uri $Url -UseBasicParsing -DisableKeepAlive).StatusCode
    }
    catch [Net.WebException]
    {
        [int]$_.Exception.Response.StatusCode
    }
}
function global:au_GetLatest {
   # Discover the latest release version
   $VersionURL  = 'https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html'
   $download_page = Invoke-WebRequest -Uri $VersionURL #-UseBasicParsing -DisableKeepAlive
   $Version = "0.0"
   $download_page | Select-String -Pattern "((\d+)\.(\d+)\.(\d+))" -AllMatches | ForEach-Object Matches | ForEach-Object {
      if ([version]$_.Value -gt [version]$Version -and (Get-UrlStatusCode "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/$($_.Value.Replace('.',''))/AcroRdrDC$($_.Value.Replace('.',''))_MUI.exe") -ne '404') {
         $Version = $_.Value
      }
   }
   $VersionWOPoints = $Version.Replace('.','')

   return  @{
       Version = $Version
       URL     = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/$VersionWOPoints/AcroRdrDC$($VersionWOPoints)_MUI.exe"
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

function global:au_BeforeUpdate() {
   $Latest.Checksum = Get-RemoteChecksum $Latest.URL
}

Update-Package -NoCheckChocoVersion


