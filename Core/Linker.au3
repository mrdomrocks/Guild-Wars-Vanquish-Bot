
#include-once
#RequireAdmin
#NoTrayIcon
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <GuiRichEdit.au3>
#include <ScrollBarsConstants.au3>
#include <Math.au3>
#include <Array.au3>
#include <File.au3>
#include <Date.au3>
#include <GuiStatusBar.au3>
#include <String.au3>
#include <Misc.au3>
#include <ComboConstants.au3>
#include <SliderConstants.au3>
#include <TabConstants.au3>
#include <ListViewConstants.au3>
#include <AVIConstants.au3>
#include <GUIListBox.au3>
#include <GuiListView.au3>
#include <GuiComboBox.au3>
#Include <WinAPIEx.au3>
#include <WinAPIFiles.au3>
#include <GuiSlider.au3>
#include <WinAPITheme.au3>
#include <WinAPI.au3>
#include <Memory.au3>
#include <Process.au3>

; Legacy linker entry point retained for route-centric workflows.
; Keep includes aligned with the current Guild Wars Vanquish Bot layout.
#include "../../../API/_GwAu3.au3"
#include "Vanquisher_Globals.au3"
#include "Vanquisher_Compat.au3"
#include "Caravan_Controller.au3"
#include "GwAu3_AddOns.au3"

; Command line: -character <name> (AscEnd-style auto-attach)
For $l_i_Cmd = 1 To $CmdLine[0]
    If $CmdLine[$l_i_Cmd] = "-character" And $l_i_Cmd < $CmdLine[0] Then
        $g_s_MainCharName = $CmdLine[$l_i_Cmd + 1]
        $g_bAutoStart = True
        ExitLoop
    EndIf
Next

_Crypt_Startup()

#include "..\GUi\GW_Vanquish_Bot_GUI.au3"

#include "..\Maps\LocationsIDS.au3"
#include "Vanquish_Routes.au3"
