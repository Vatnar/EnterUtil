#NoEnv  
#SingleInstance Force
SendMode Input  

global ExcludedApps := []  ; array to hold app names
configFile := A_ScriptDir "\config.ini"

IniRead, appList, %configFile%, Exclusions, Apps, 
if (appList != "")
{
    ExcludedApps := StrSplit(appList, ",")
    for index, app in ExcludedApps
        ExcludedApps[index] := Trim(app)
}

; Function: returns true if the active window’s process name is in the exclusion list.
IsExcluded() {
    global ExcludedApps
    WinGet, processName, ProcessName, A
    for index, app in ExcludedApps {
         if (processName = app)
             return true
    }
    return false
}

#If !IsExcluded()

; SHIFT+ENTER: insert a new line BELOW current line.
+Enter::
    Send, {End}{Enter}
Return

; CTRL+ALT+ENTER: insert a new line ABOVE current line.
^!Enter::
    Send, {Home}{Enter}{Up}
Return

#If  
