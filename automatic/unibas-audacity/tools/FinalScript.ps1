Set-Location "$PSScriptRoot"

Copy-Item -Path ".\lame_enc.dll" -Destination "C:\Program Files (x86)\Audacity" -Force 

Copy-Item -Path ".\FFMPEG\*" -Destination "C:\Program Files (x86)\Audacity" -Force 

Remove-Item -Path "C:\Users\Public\Desktop\Audacity.lnk" -Force -ErrorAction SilentlyContinue

