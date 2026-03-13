# This script is run prior/post to the installation.
$ErrorActionPreference = 'Stop'

$toolsDir     = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installerUrl = 'https://dl4.cdn.filezilla-project.org/client/FileZilla_3.69.6_win64-setup.exe'

$packageVersion = if ($env:ChocolateyPackageVersion) { $env:ChocolateyPackageVersion }
                  elseif ($installerUrl -match 'FileZilla_([0-9]+\.[0-9]+(\.[0-9]+)?)') { $Matches[1] }
                  else { 'unknown' }

$installerFile = Join-Path $toolsDir "FileZilla_$packageVersion`_win64-setup.exe"

if (-not (Test-Path $installerFile)) {
  $currentUri = [System.Uri]$installerUrl
  for ($i = 0; $i -lt 3; $i++) {
    $client = New-Object System.Net.Sockets.TcpClient
    $client.Connect($currentUri.Host, 443)
    $ssl = $null
    try {
      $ssl = New-Object System.Net.Security.SslStream($client.GetStream(), $false, { $true })
      $ssl.AuthenticateAsClient($currentUri.Host)
      $req   = "GET $($currentUri.PathAndQuery) HTTP/1.1`r`nHost: $($currentUri.Host)`r`nUser-Agent: FileZilla`r`nConnection: close`r`n`r`n"
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

    $parts      = ([System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString($raw)) -split "`r`n`r`n", 2
    $headers    = $parts[0]
    $bodyOffset = if ($parts.Count -gt 1) { $headers.Length + 4 } else { 0 }
    $statusCode = if ($headers -match '(?m)^HTTP/\d\.\d\s+(\d+)') { [int]$Matches[1] } else { 0 }

    if ($statusCode -ge 300 -and $statusCode -lt 400 -and $headers -match '(?im)^Location:\s*(\S+)\s*$') {
      $currentUri = [System.Uri]::new($currentUri, $Matches[1].Trim())
      continue
    }

    [System.IO.File]::WriteAllBytes($installerFile, $raw[$bodyOffset..($raw.Length - 1)])
    break
  }
}
