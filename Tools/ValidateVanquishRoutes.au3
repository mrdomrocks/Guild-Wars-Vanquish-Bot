#RequireAdmin
; Lightweight launcher for the route validation script.
; Run from the bot root folder: AutoIt3.exe "Tools\ValidateVanquishRoutes.au3"

Local $sPython = "python"
Local $sScript = @ScriptDir & "\validate_vanquish_routes.py"
If Not FileExists($sScript) Then
    ConsoleWrite("Missing validation script: " & $sScript & @CRLF)
    Exit 1
EndIf

Local $iExitCode = RunWait($sPython & ' "' & $sScript & '"', @ScriptDir, @SW_SHOW)
Exit $iExitCode
