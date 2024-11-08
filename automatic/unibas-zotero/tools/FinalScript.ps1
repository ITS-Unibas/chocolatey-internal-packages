# This script is run prior/post to the installation.
$FFExtensionPath = "C:\Program Files\Mozilla Firefox\browser\extensions"
$FFInstalled = (Test-Path $FFExtensionPath)

If ($FFInstalled){

  Copy-Item -Path "$PSScriptRoot\zotero@chnm.gmu.edu.xpi" -Destination "$FFExtensionPath" -Force -ErrorAction SilentlyContinue

}
Remove-Item -Path "C:\Users\Public\Desktop\Zotero.lnk" -Force -ErrorAction SilentlyContinue

    if (!(Test-Path 'C:\Program Files (x86)\Zotero\defaults\')){
    	New-Item -Path 'C:\Program Files (x86)\Zotero\' -Name 'defaults' -ItemType Directory -Force -ErrorAction SilentlyContinue
      New-Item -Path 'C:\Program Files (x86)\Zotero\defaults' -Name 'preferences' -ItemType Directory -Force -ErrorAction SilentlyContinue
	}   

Copy-Item -Path "$PSScriptRoot\prefs.js" -Destination "C:\Program Files (x86)\Zotero\defaults\preferences\" -Force -ErrorAction SilentlyContinue
Copy-Item -Path "$PSScriptRoot\zotero.js" -Destination "C:\Program Files (x86)\Zotero\defaults\preferences\" -Force -ErrorAction SilentlyContinue
