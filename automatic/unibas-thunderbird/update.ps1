Import-Module Chocolatey-AU
#Empty function to fix error during update.ps1 run
function global:au_AfterUpdate{
  }

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
          "(?i)(^\s*Checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'" 
          }       
     }
}
function global:au_GetLatest {
  $releases = 'https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/'
  $thunderbirdReleases = Invoke-WebRequest -UseBasicParsing $releases
  $latestVersion = (($thunderbirdReleases.links | Where {$_.href -match 'esr'}).href -replace '/pub/thunderbird/releases/', '' -replace 'esr/', '' | ForEach-Object { [version] $_ } | Sort-Object)[-1].ToString()
  $downloadUrl = $releases + $latestVersion + 'esr/win64/en-US/Thunderbird%20Setup%20' + $latestVersion + 'esr.exe' 

  @{
    URL64 = $downloadUrl
    Version = $latestVersion
  }
}
 
update -ChecksumFor 64