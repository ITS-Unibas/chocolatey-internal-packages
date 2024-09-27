#Import packages needed (au module has to be imported, in case it does not run on your machine, make sure AU is installed)
 
import-module chocolatey-au
 
#Releases is the page where you find the releases of the software. Often this is also the download page. If not, you can crawl multiple sites to obtain necessary information.
 
$releases = 'https://www.teamviewer.com/en/download/windows/'
 
#Search and replace is the core of what the update.ps1 script does. It takes the newly found version and download url (these two are at least required) and other information and replaces them in the nuspec and chocolatey install scprit of the respective SW package
 
function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*fileType\s*=\s*)('.*')"     = "`$1'$($Latest.FileType)'"
            "(?i)(^\s*softwareName\s*=\s*)('.*')" = "`$1'$($Latest.packageName)'"
        }
    }
}
 
#GetLatest crawls through the release page and download page to obtain the latest version and its respective download link (we generally only work with the x64 version of a SW).
 
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
	$regex = "Current version:(.+)(\d+(\d+.(.\d+.(.+))))<"
     
    #User code does here - use REGEX patterns to select the information which you need. You can find an example in our package gallery
    $version = ([regex]::Match($download_page.RawContent, $regex)).Captures.Groups[2].value
    $url = $download_page.links | ? -match href "TeamViewer_Setup_x64.exe*" | % href
 
    @{ #This output table is the input for "Latest" variable in Search and replace. It must feature at least the Version and URL
        Version      = $version
        URL          = $url
    }
}
 
update -ChecksumFor 64
