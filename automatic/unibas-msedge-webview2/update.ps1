import-module chocolatey-au

$urlEvergreenManifestMicrosoftEdgeWebView2Runtime = "https://raw.githubusercontent.com/aaronparker/evergreen/main/Evergreen/Manifests/MicrosoftEdgeWebView2Runtime.json"

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'            = "`$1'$($Latest.url)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    # Get the version for MicrosoftEdgeWebView2Runtime
    $content = Invoke-WebRequest -Uri $urlEvergreenManifestMicrosoftEdgeWebView2Runtime -UseBasicParsing
    $contentJSON = $content.Content | ConvertFrom-Json
    $uri = $contentJSON.Get.Update.Uri
    $ContentType = "application/json; charset=utf-8"
    $Method = "Default"

    $params = @{
        Uri                = $Uri
        ContentType        = $ContentType
        DisableKeepAlive   = $true
        MaximumRedirection = 2
        Method             = $Method
        UseBasicParsing    = $true
    }

    $products = Invoke-RestMethod @params
    $releases = ($products | Where-Object {$_.Product -eq 'Stable'}).Releases
    $winx64release = $releases | Where-Object {$_.Platform -eq 'Windows' -and $_.Architecture -eq 'x64'}

    $version = $winx64release.ProductVersion

    # Get the download URI for MicrosoftEdgeWebView2Runtime
    $downloadURIWebView = $contentJSON.Get.Download.Uri.x64

    $httpWebRequest = [System.Net.WebRequest]::Create($downloadURIWebView)
    $httpWebRequest.MaximumAutomaticRedirections = 3
    $httpWebRequest.AllowAutoRedirect = $true
    $webResponse = $httpWebRequest.GetResponse()

    $url = $webResponse.ResponseUri

    # return everything
    return @{
        url			= $url
        version		= $version
    }
}

Update-Package -NoCheckChocoVersion -ChecksumFor 64
