﻿import-module au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://github.com/microsoft/PowerToys/releases/latest'

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re  = "PowerToysSetup(.+)?.exe"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $arr = $url -split '-|.exe'
    $version = (($download_page.Links | Where-Object href -Match "releases/tag" | Select-Object -First 1 -ExpandProperty href) -Split "/" | Select-Object -Last 1) -Replace "v"
    $url = 'https://github.com' + $url

    return @{
        URL = $url
        Version = $version
        RemoteVersion  = $version
        FileType = 'exe'
    }
}

function global:au_SearchReplace {
  return @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]fileName\s*=\s*`"[$]toolsDir\\).*" = "`${1}$($Latest.FileName64)`""
      "(^[$]version\s*=\s*)`".*`""             = "`${1}`"$($Latest.RemoteVersion)`""
    }
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(64-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType64)"
      "(?i)(checksum64:).*"      = "`${1} $($Latest.Checksum64)"
    }
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor None
}