#Installpaths
$ZuluPathx64 = "C:\Program Files\Zulu\zulu-8"


[Environment]::SetEnvironmentVariable("JAVA_HOME", 'C:\Program Files\Zulu\zulu-8', "Machine")
[Environment]::SetEnvironmentVariable("EXE4J_JAVA_HOME", 'C:\Program Files (x86)\Zulu\zulu-8', "Machine")
[Environment]::SetEnvironmentVariable("JDK_HOME", "%JAVA_HOME%", "Machine")
[Environment]::SetEnvironmentVariable("JRE_HOME", "%JAVA_HOME%\jre", "Machine")

foreach ($level in "Machine", "User") {
    [Environment]::GetEnvironmentVariables($level)
}

#--------------------------
#Java FX installieren
#--------------------------
#FX JRE x64
$ZIPfxJREx64 = (Get-ChildItem "$PSScriptRoot\FX\JRE" -filter *fx*x64.zip).Name
$I = $ZIPfxJREx64.TrimEnd(".zip")
Expand-Archive -Path "$PSScriptRoot\FX\JRE\$ZIPfxJREx64" -DestinationPath "$PSScriptRoot\FX\JRE" -Force -ErrorAction SilentlyContinue
Copy-Item -Path "$PSScriptRoot\FX\JRE\$I\*" -Destination $ZuluPathx64 -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$PSScriptRoot\FX\JRE\$I" -Force -Recurse -ErrorAction SilentlyContinue

#FX JDK x64
$ZIPfxJDKx64 = (Get-ChildItem "$PSScriptRoot\FX\JDK" -filter *fx*x64.zip).Name
$I = $ZIPfxJDKx64.TrimEnd(".zip")
Expand-Archive -Path "$PSScriptRoot\FX\JDK\$ZIPfxJDKx64" -DestinationPath "$PSScriptRoot\FX\JDK" -Force -ErrorAction SilentlyContinue
Copy-Item -Path "$PSScriptRoot\FX\JDK\$I\*" -Destination $ZuluPathx64 -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$PSScriptRoot\FX\JDK\$I" -Force -Recurse -ErrorAction SilentlyContinue

#--------------------------


#--------------------------
#Java JRE installieren
#--------------------------

#JRE x64
$ZIPJREx64 = (Get-ChildItem "$PSScriptRoot\JRE" -filter *jre*x64.zip).Name
$I = $ZIPJREx64.TrimEnd(".zip")
Expand-Archive -Path "$PSScriptRoot\JRE\$ZIPJREx64" -DestinationPath "$PSScriptRoot\JRE" -Force -ErrorAction SilentlyContinue
Copy-Item -Path "$PSScriptRoot\JRE\$I\*" -Destination $ZuluPathx64 -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$PSScriptRoot\JRE\$I" -Force -Recurse -ErrorAction SilentlyContinue

#--------------------------

#Env Variablen neu einlesen
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")