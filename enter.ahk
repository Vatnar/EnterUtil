#NoEnv  ; Recommended for performance and compatibility.
#SingleInstance Force
SendMode Input  ; Recommended for speed.

; Read exclusion list from config
global ExcludedApps := []  ; array to hold app names
configFile := A_ScriptDir "\config.ini"

; Read the "Apps" key from section "Exclusions" of the config file.  
; If the key is not found, appList remains blank.
IniRead, appList, %configFile%, Exclusions, Apps, 
if (appList != "")
{
    ; Split the comma-separated list into an array.
    ExcludedApps := StrSplit(appList, ",")
    ; Trim any extra whitespace.
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

; Custom hotkeys are active only when the active window does NOT match an exclusion.
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