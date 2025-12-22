Import-Module chocolatey-au

$releases = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jdk&features=&ext=msi&os=windows&arch=x86&hw_bitness=32'
$jrerelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=&ext=zip&os=windows&arch=x86&hw_bitness=32'
$jdkfxrelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jdk&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=32'
$jrefxrelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=32'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"          = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*\`$urljre\s*=\s*)('.*')"           = "`$1'$($Latest.URLJRE)'"
            "(?i)(^\s*\`$urljdkfx\s*=\s*)('.*')"         = "`$1'$($Latest.URLJDKFX)'"
            "(?i)(^\s*\`$urljrefx\s*=\s*)('.*')"         = "`$1'$($Latest.URLJREFX)'"
            "(?i)(^\s*\`$checksumurljre\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumURLJRE)'"
            "(?i)(^\s*\`$checksumurljdkfx\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumURLJDKFX)'"
            "(?i)(^\s*\`$checksumurljrefx\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumURLJREFX)'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json

    $url = $release.url
    $version = $release.zulu_version -Join '.'
    $checksum = $release.sha256_hash

    $releasejre = Invoke-WebRequest -Uri $jrerelease -UseBasicParsing | ConvertFrom-Json
    $releasejdkfx = Invoke-WebRequest -Uri $jdkfxrelease -UseBasicParsing | ConvertFrom-Json
    $releasejrefx = Invoke-WebRequest -Uri $jrefxrelease -UseBasicParsing | ConvertFrom-Json

    @{
        URL64            = $url
        Version          = $version
        Checksum64       = $checksum
        ChecksumType64   = 'sha256'
        URLJRE           = $releasejre.url
        URLJDKFX         = $releasejdkfx.url
        URLJREFX         = $releasejrefx.url
        ChecksumURLJRE   = $releasejre.sha256_hash
        ChecksumURLJDKFX = $releasejdkfx.sha256_hash
        ChecksumURLJREFX = $releasejrefx.sha256_hash
    }
}

update -ChecksumFor none -NoCheckChocoVersion
