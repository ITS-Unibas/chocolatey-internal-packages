# Source: https://github.com/Thilas/chocolatey-packages/blob/master/Common.ps1 and
# https://github.com/Thilas/chocolatey-packages/tree/master/eclipse
[CmdletBinding()]
param($IncludeStream, [switch] $Force)

function Assert-Uri {
  [CmdletBinding(DefaultParameterSetName = "Default")]
  [OutputType([uri])]
  param(
    [Parameter(ValueFromPipeline = $true)]
    [uri] $Uri,
    [Parameter(Mandatory = $true, ParameterSetName = "Default")]
    [ValidateNotNullOrEmpty()]
    [string] $Name,
    [Parameter(Mandatory = $true, ParameterSetName = "TypeAndVersion")]
    [ValidateSet("x86", "x64")]
    [string] $Type,
    [Parameter(Mandatory = $true, ParameterSetName = "TypeAndVersion")]
    [ValidateNotNullOrEmpty()]
    [object] $Version
  )
  begin {
    $uris = [System.Collections.Generic.HashSet[uri]]::new()
  }
  process {
    if ($Uri) {
      $uris.Add($Uri) | Out-Null
    }
  }
  end {
    if ($uris.Count -eq 0) {
      if ($Name) {
        throw "$Name not found."
      }
      else {
        throw "Url ($Type) not found for version $Version."
      }
    }
    if ($uris.Count -gt 1) {
      Write-Warning 'Urls:'
      $uris | ForEach-Object { Write-Warning "  - $_" }
      if ($Name) {
        throw "$Name has multiple values."
      }
      else {
        throw "Url ($Type) has multiple values for version $Version."
      }
    }
    return $uris | Select-Object
  }
}

function Get-Uri {
  [CmdletBinding()]
  [OutputType([uri])]
  param(
    [Parameter(ValueFromPipelineByPropertyName = $true)]
    [uri] $BaseUri,
    [Parameter(ValueFromPipelineByPropertyName = $true)]
    [Alias("href")]
    [string] $RelativeUrl,
    [switch] $ForceHttps
  )
  process {
    $uri = [uri]::new($BaseUri, $RelativeUrl)
    if ($ForceHttps -and $uri.Scheme -eq [uri]::UriSchemeHttp) {
      $builder = [System.UriBuilder]::new($uri)
      $builder.Scheme = [uri]::UriSchemeHttps
      if ($builder.Port -eq 80) {
        $builder.Port = 443
      }
      $uri = $builder.Uri
    }
    return $uri
  }
}

# Returns a single stream from a web page using a regex pattern to get its version.
# A dedicated method can be used instead of the regex.
function Get-BasicLatest {
  [CmdletBinding()]
  [OutputType([hashtable])]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNull()]
    [uri] $ReleaseUri,
    [scriptblock] $GetTagName, # optional callback, param($Release)
    [string] $TagNamePattern, # optional, must include a TagName capture
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $FileType,
    [switch] $SkipTagName,
    [scriptblock] $IsUri32, # optional callback, param($Uri, $TagName, $Version)
    [scriptblock] $IsUri64, # optional callback, param($Uri, $TagName, $Version)
    [switch] $ForceHttps,
    [hashtable] $Latest = @{ } # optional
  )
  $release = Invoke-WebRequest -Uri $ReleaseUri -UseBasicParsing
  $release.Links | ForEach-Object {
    $_ | Add-Member 'BaseUri' $ReleaseUri
  }
  if ($GetTagName) {
    $tagName = & $GetTagName -Release $release
  }
  else {
    if ($release.Content -notmatch $TagNamePattern) {
      throw 'Tag name not found.'
    }
    $tagName = $Matches.TagName
    if (!$tagName) {
      throw 'Tag name not defined.'
    }
  }
  Write-Verbose "TagName: $tagName"
  $version = Get-Version $tagName
  Write-Verbose "Version: $version"
  $stream = @{ Version = $version }

  $pattern = "{0}$" -f [regex]::Escape(".$FileType")
  if (!$SkipTagName) {
    $pattern = "{0}.*$pattern" -f [regex]::Escape($tagName)
  }
  $links = $release.Links | Where-Object "href" -Match $pattern

  if ($IsUri32 -or !$IsUri64) {
    $uri = $links `
    | Get-Uri -ForceHttps:$ForceHttps `
    | Where-Object { !$IsUri32 -or (& $IsUri32 -Uri $_ -TagName $tagName -Version $version) } `
    | Assert-Uri -Type x86 -Version $version
    $stream += @{ Url32 = $uri }
    'Url32: {0}' -f $stream.Url32 | Write-Verbose
  }

  if ($IsUri64) {
    $uri = $links `
    | Get-Uri -ForceHttps:$ForceHttps `
    | Where-Object { & $IsUri64 -Uri $_ -TagName $tagName -Version $version } `
    | Assert-Uri -Type x64 -Version $version
    $stream += @{ Url64 = $uri }
    'Url64: {0}' -f $stream.Url64 | Write-Verbose
  }

  return $stream + $Latest
}

function global:au_GetLatest {
  Get-Latest `
    -ReleasesUri 'https://wiki.eclipse.org/Simultaneous_Release' `
    -TagNamesPattern '<th\b[^>]*>\s*.*\b(?<Release>\d+-\d+)\b.*\s*</th\b[^>]*>\s*<td\b[^>]*>\s*.*\b(?<TagName>\d+\.\d+)\b.*\s*</td\b' `
    -LinkPattern '/downloads/packages/release/(?<Release>\d+-\d+)/r' `
    -StreamFieldCount 2
}

function Get-Latest {
  [CmdletBinding()]
  param(
    [uri] $ReleasesUri,
    [string] $TagNamesPattern, # must include Release and TagName captures
    [string] $LinkPattern, # must include a Release capture
    [int] $StreamFieldCount
  )
  $releases = Invoke-WebRequest -Uri $ReleasesUri -UseBasicParsing

  $tagNames = @{ }
  $result = $releases.Content | Select-String -Pattern $TagNamesPattern -AllMatches
  $result.Matches | ForEach-Object {
    $tagNames.Add($_.Groups['Release'].Value, $_.Groups['TagName'].Value)
  }

  $result = [ordered] @{ }
  $releases.Links `
  | Where-Object { $_.href -match $LinkPattern -and $tagNames.Keys -contains $Matches.Release } `
  | ForEach-Object {
    $_.href -match $LinkPattern
    $release = $Matches.Release
    $tagName = $tagNames.$release
    $version = Get-Version $tagName

    $uri = $_ | Get-Uri -BaseUri $ReleasesUri -ForceHttps
    $isUri32 = if ($version -lt '4.10') {
      { param($Uri) $Uri -match "\bjee\b.*\bwin32\b" -and $Uri -notmatch '\bx86_64\b' }
    }
    $isUri64 = if ($version -lt '4.10') {
      { param($Uri) $Uri -match "\bjee\b.*\bwin32\b" -and $Uri -notmatch '\bx86_64\b' }
    }
    else {
      { param($Uri) $Uri -match "\bjee\b.*\bwin32\b" }
    }

    $latest = Get-BasicLatest `
      -ReleaseUri $uri `
      -GetTagName { $tagName } `
      -FileType 'zip' `
      -SkipTagName `
      -IsUri32 $isUri32 `
      -IsUri64 $isUri64 `
      -ForceHttps
    if ($latest.Url32) { $latest.Url32 = '{0}&r=1' -f $latest.Url32 }
    if ($latest.Url64) { $latest.Url64 = '{0}&r=1' -f $latest.Url64 }
    $result.Add($version.ToString($StreamFieldCount), $latest)
  }
  return @{ Streams = $result }
}

function global:au_BeforeUpdate {
  if ($Latest.Url32) {
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32 = Get-RemoteChecksum -Url $Latest.Url32 -Algorithm $Latest.ChecksumType32
  }
  if ($Latest.Url64) {
    $Latest.ChecksumType64 = 'sha256'
    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.Url64 -Algorithm $Latest.ChecksumType64
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url64bit\s*=\s*)('.*')"      = "`$1`'$($Latest.Url64)`'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1`'$($Latest.Checksum64)`'"
    }
  }
}

Update-Package -ChecksumFor none -NoCheckChocoVersion