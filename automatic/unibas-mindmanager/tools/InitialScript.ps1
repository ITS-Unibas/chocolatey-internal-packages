Set-Location "$PSScriptRoot"
Start-Process powershell -argument '.\Universal_Uninstaller.ps1 -ProgramName """*MindManager*""" -ProzessNames """MindManager.exe""" -SI -SF -SIS' -wait