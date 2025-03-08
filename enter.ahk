#NoEnv  
#SingleInstance Force
SendMode Input  

; SHIFT+ENTER: Insert a new line BELOW the current line.
+Enter::
    Send, {End}{Enter}
Return

; CTRL+ALT+ENTER: Insert a new line ABOVE the current line.
^!Enter::
    Send, {Home}{Enter}{Up}
Return