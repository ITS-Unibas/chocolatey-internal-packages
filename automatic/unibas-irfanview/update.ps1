Import-Module Chocolatey-AU

$releases = 'https://www.irfanview.com/64bit.htm'

$headers = @{
  Referer = 'https://www.irfanview.info/files/'
  "User-Agent" = "Chocolatey AU update check. https://chocolatey.org"
}

$options =
@{
  Headers = $headers
}

function global:au_SearchReplace {
  return @{
    ".\legal\VERIFICATION.txt"   = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUri)>"
      "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL64)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum64:).*"      = "`${1} $($Latest.Checksum64)"
    }
  }
}

function name4url($url) {
  if ($FileNameBase) { return $FileNameBase }
  $res = $url -split '/' | Select-Object -Last 1
  $res -replace '\.[^.]+$'
}

function global:au_BeforeUpdate {
  $ext = $Latest.FileType
  $toolsPath = Resolve-Path tools
  $NoSuffix = $true

  Write-Host 'Purging' $ext
  Remove-Item -Force "$toolsPath\*.$ext" -ea ignore

  $Algorithm = 'sha256'

  $CurrentProgressPreference = $ProgressPreference
  $ProgressPreference = 'SilentlyContinue'

  try {
    $client = New-Object System.Net.WebClient

    if ($Latest.Url64) {
      $base_name = name4url $Latest.URL64
      $file_name = "{0}{2}.{1}" -f $base_name, $ext, $(if ($NoSuffix) { '' } else {'_x64'})
      $file_path = Join-Path $toolsPath $file_name

      $headers64 = $headers.Clone()
      $headers64.Referer = "$($headers.Referer)$($file_name)"

      $headers64.GetEnumerator() | ForEach-Object { $client.Headers.Add($_.Key, $_.Value) | Out-Null }

      Write-Host "Downloading to $file_name -" $Latest.URL64
      $client.DownloadFile($Latest.URL64, $file_path)
      $Latest.Checksum64 = Get-FileHash $file_path -Algorithm $Algorithm | ForEach-Object Hash
      $Latest.ChecksumType64 = $Algorithm
      $Latest.FileName64 = $file_name
    }
  } catch {
    throw $_
  } finally {
    $client.Dispose()
    $ProgressPreference = $CurrentProgressPreference
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\(Version (.+\d),'
  $version = ([regex]::Match($download_page.content, $re)).Captures.Groups[1].value
  $fileversion = $version -replace "\."

  $url64 = "https://www.irfanview.info/files/iview${fileversion}_x64_setup.exe"

  return @{
    URL64    = $url64
    Version  = $version
    Options  = $options
    FileType = 'exe'
    ReleaseUri = $releases
  }
}

update -ChecksumFor None
