$ErrorActionPreference = 'Stop'
Import-Module chocolatey-au

$releases = 'https://www.paraview.org/files/'

function global:au_SearchReplace {
	@{
		'tools/chocolateyInstall.ps1' = @{
			"(^[$]url\s*=\s*)('.*')"      		= "`$1'$($Latest.URL64)'"
			"(^[$]checksum\s*=\s*)('.*')" 		= "`$1'$($Latest.Checksum64)'"
			"(^[$]checksumType\s*=\s*)('.*')" 	= "`$1'$($Latest.ChecksumType64)'"
		}
	}
}

function global:au_GetLatest {
    # check last 3 releases, in case folder has already been created but no installers uploaded yet
    $i = 1
    while ($file -eq $null -and $i -le 3){
	    $folder = (((Invoke-WebRequest -Uri $releases -UseBasicParsing).Links | Where-Object {$_ -match 'v[0-9].'}).href)[-$i]
	    $file = (((Invoke-WebRequest -Uri $releases$folder -UseBasicParsing).Links | Where-Object {$_ -match ".msi"} | Select-Object -Last 1).href)
        $i++
    }
    $file = $file.replace('.0&','&')
	$url = "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=$folder&type=binary&os=Windows&downloadFile=$file"
	$version=($file).Split("-")[1]
	$checksumType = 'sha256'
	$checksum = Get-RemoteChecksum($url,$checksumType)

	$Latest = @{ 
		URL64 = $url; 
		Version = $version
	}
	return $Latest
}


update -NoCheckChocoVersion
