import-module au

$releases = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jdk&features=&ext=msi&os=windows&arch=x86&hw_bitness=64'
$jrerelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=&ext=zip&os=windows&arch=x86&hw_bitness=64'
$jdkfxrelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jdk&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=64'
$jrefxrelease = 'https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=8&bundle_type=jre&features=fx&ext=zip&os=windows&arch=x86&hw_bitness=64'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*\`$urljre\s*=\s*)('.*')"   = "`$1'$($Latest.URLJRE)'"
            "(?i)(^\s*\`$urljdkfx\s*=\s*)('.*')" = "`$1'$($Latest.URLJDKFX)'"
            "(?i)(^\s*\`$urljrefx\s*=\s*)('.*')" = "`$1'$($Latest.URLJREFX)'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-WebRequest -Uri $releases | ConvertFrom-Json

    $url = $release.url
    $version = $release.zulu_version -Join '.'
    $checksum = $release.sha256_hash

    @{
        URL64          = $url
        Version        = $version
        Checksum64     = $checksum
        ChecksumType64 = 'sha256'
        URLJRE         = $jrerelease
        URLJDKFX       = $jdkfxrelease
        URLJREFX       = $jrefxrelease
    }
}

update -ChecksumFor none -NoCheckChocoVersion -Force