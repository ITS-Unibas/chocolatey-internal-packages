Import-Module chocolatey-au
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$update_api = 'https://update.filezilla-project.org/update.php?osarch=64&platform=x86_64-w64-mingw32&channel=release&version=0.0.0'

function global:au_SearchReplace {
  return @{
    ".\unibas-filezilla.nuspec" = @{
      "(?im)(<version>)[^<]+(</version>)" = "`${1}$($Latest.Version)`${2}"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?im)(^\s*file64\s*=\s*Join-Path\s+\`$toolsDir\s*).*$" = "`$1`"FileZilla_$($Latest.Version)_win64-setup.exe`""
    }
    ".\tools\InitialScript.ps1" = @{
      "(?i)(\`$installerUrl\s*=\s*)'[^']*'" = "`${1}'$($Latest.URL)'"
    }
  }
}

function global:au_GetLatest {
  $uri    = [System.Uri]$update_api
  $client = New-Object System.Net.Sockets.TcpClient
  $client.Connect($uri.Host, 443)
  $ssl = $null
  try {
    $ssl = New-Object System.Net.Security.SslStream($client.GetStream(), $false, { $true })
    $ssl.AuthenticateAsClient($uri.Host)
    $req   = "GET $($uri.PathAndQuery) HTTP/1.1`r`nHost: $($uri.Host)`r`nUser-Agent: FileZilla`r`nConnection: close`r`n`r`n"
    $bytes = [System.Text.Encoding]::ASCII.GetBytes($req)
    $ssl.Write($bytes, 0, $bytes.Length); $ssl.Flush()
    $mem = New-Object System.IO.MemoryStream
    $buf = New-Object byte[] 8192
    while (($n = $ssl.Read($buf, 0, $buf.Length)) -gt 0) { $mem.Write($buf, 0, $n) }
    $raw = $mem.ToArray()
  } finally {
    if ($ssl) { $ssl.Dispose() }
    $client.Close()
  }

  $content = ([System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString($raw) -split "`r`n`r`n", 2)[-1]

  if ($content -match '<html') {
    throw "update.php returned HTML (blocked)"
  }

  if (-not ($content -match "(?im)^\s*version\s*=\s*([0-9A-Za-z\.\-]+)\s*$") -and
      -not ($content -match "([0-9]+\.[0-9]+(\.[0-9]+)?)")) {
    throw "Unable to determine FileZilla version from update.php response."
  }

  $version = $Matches[1].Trim()
  return @{
    Version = $version
    URL     = "https://dl4.cdn.filezilla-project.org/client/FileZilla_${version}_win64-setup.exe"
  }
}

update -NoCheckChocoVersion -NoCheckUrl
