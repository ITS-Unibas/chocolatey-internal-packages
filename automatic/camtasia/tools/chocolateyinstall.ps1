﻿$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Old Camtasia versions can be found at https://www.techsmith.com/download/oldversions
$url64      = 'https://download.techsmith.com/camtasiastudio/releases/2344/camtasia.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url64bit      = $url64

  checksum64    = '53cbf3b208a143a51c8abd8b85cf4e8adb87dfe3385a51085cfaa4988ba5af41'
  checksumType64= 'SHA256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

write-debug "OS Name: $($env:OS_NAME)"
if ($env:OS_NAME -like "*Server*") {
    throw "Cannot be installed on a Server operating system ($($env:OS_NAME))."
}

$arguments = Get-PackageParameters -Parameter $env:chocolateyPackageParameters
foreach ($param in $arguments.Keys) {
    switch ($param) {
        "licensekey" {
            $licenseKey = $arguments["licensekey"]
            Write-Verbose "Parameter - License Key: $licenseKey"
            $packageArgs.silentArgs = "TSC_SOFTWARE_KEY=$licenseKey " + $packageArgs.silentArgs

            if ($arguments.ContainsKey("licensename")) {
                $licenseName = $arguments["licensename"]
                Write-Verbose "Parameter - License Name: $licenseName"
                $packageArgs.silentArgs = "TSC_SOFTWARE_USER=$licenseName " + $packageArgs.silentArgs
            }
        }

        "nodesktopshortcut" {
            Write-Verbose "Parameter - Desktop Shortcut: Disabled"
            $packageArgs.silentArgs = "TSC_DESKTOP_LINK=0 " + $packageArgs.silentArgs
        }
    }
}

Install-ChocolateyPackage @packageArgs
