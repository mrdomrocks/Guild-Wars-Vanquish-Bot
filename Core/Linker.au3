
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

#include "..\Moving\GoOut.au3"
#include "..\Moving\MoveFunctions.au3"

#include "..\Fighting\Fight.au3"



;MAP FILES
;Ascalon
#include "..\Maps\Proph_Ascalon\AscalonFoothills.au3"
#include "..\Maps\Proph_Ascalon\DiessaLowlands.au3"
#include "..\Maps\Proph_Ascalon\DragonsGullet.au3"
#include "..\Maps\Proph_Ascalon\EasternFrontier.au3"
#include "..\Maps\Proph_Ascalon\FlameTempleCorridor.au3"
#include "..\Maps\Proph_Ascalon\OldAscalon.au3"
#include "..\Maps\Proph_Ascalon\PockmarkFlats.au3"
#include "..\Maps\Proph_Ascalon\RegentValley.au3"
#include "..\Maps\Proph_Ascalon\TheBreach.au3"
;NorthernShiverpeaks
#include "..\Maps\Proph_NorthernShiverpeaks\AnvilRock.au3"
#include "..\Maps\Proph_NorthernShiverpeaks\DeldrimorBowl.au3"
#include "..\Maps\Proph_NorthernShiverpeaks\GriffonsMouth.au3"
#include "..\Maps\Proph_NorthernShiverpeaks\IronHorseMine.au3"
#include "..\Maps\Proph_NorthernShiverpeaks\TravelersVale.au3"
;Maguuma
#include "..\Maps\Proph_Maguuma\DryTop.au3"
#include "..\Maps\Proph_Maguuma\EttinsBack.au3"
#include "..\Maps\Proph_Maguuma\MamnoonLagoon.au3"
#include "..\Maps\Proph_Maguuma\ReedBog.au3"
#include "..\Maps\Proph_Maguuma\SageLands.au3"
#include "..\Maps\Proph_Maguuma\Silverwood.au3"
#include "..\Maps\Proph_Maguuma\TangleRoot.au3"
#include "..\Maps\Proph_Maguuma\TheFalls.au3"
;CrystalDesert
#include "..\Maps\Proph_CrystalDesert\DivinersAscent.au3"
#include "..\Maps\Proph_CrystalDesert\ProphetsPath.au3"
#include "..\Maps\Proph_CrystalDesert\SaltFlats.au3"
#include "..\Maps\Proph_CrystalDesert\SkywardReach.au3"
#include "..\Maps\Proph_CrystalDesert\TheAridSea.au3"
#include "..\Maps\Proph_CrystalDesert\TheScar.au3"
#include "..\Maps\Proph_CrystalDesert\VultureDrifts.au3"
;Kryta
#include "..\Maps\Proph_Kryta\CursedLands.au3"
#include "..\Maps\Proph_Kryta\KessexPeak.au3"
#include "..\Maps\Proph_Kryta\MajestysRest.au3"
#include "..\Maps\Proph_Kryta\NeboTerrace.au3"
#include "..\Maps\Proph_Kryta\NorthKrytaProvince.au3"
#include "..\Maps\Proph_Kryta\ScoundrelsRise.au3"
#include "..\Maps\Proph_Kryta\StingrayStrand.au3"
#include "..\Maps\Proph_Kryta\TalmarkWilderness.au3"
#include "..\Maps\Proph_Kryta\TearsoftheFallen.au3"
#include "..\Maps\Proph_Kryta\TheBlackCurtain.au3"
#include "..\Maps\Proph_Kryta\TwinSerpentLakes.au3"
#include "..\Maps\Proph_Kryta\WatchtowerCoast.au3"
;SouthernShiverpeaks
#include "..\Maps\Proph_SouthernShiverpeaks\DreadnoughtsDrift.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\FrozenForest.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\GrenthsFootprint.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\IceFloe.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\IceDome.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\LornarsPass.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\MineralSprings.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\SnakeDance.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\SpearheadPeak.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\TalusChute.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\TascasDemise.au3"
#include "..\Maps\Proph_SouthernShiverpeaks\WitmansFolly.au3"
;RingOfFireIsland
#include "..\Maps\Proph_RingOfFireIsland\PerditionRock.au3"
;ShingJeaIsland
#include "..\Maps\Factions_ShingJeaIsland\HaijuLagoon.au3"
#include "..\Maps\Factions_ShingJeaIsland\JayaBluffs.au3"
#include "..\Maps\Factions_ShingJeaIsland\KinyaProvince.au3"
#include "..\Maps\Factions_ShingJeaIsland\MinisterChosEstate.au3"
#include "..\Maps\Factions_ShingJeaIsland\PanjiangPeninsula.au3"
#include "..\Maps\Factions_ShingJeaIsland\SaoshangTrail.au3"
#include "..\Maps\Factions_ShingJeaIsland\SunquaVale.au3"
#include "..\Maps\Factions_ShingJeaIsland\ZenDaijun.au3"
;KainengCity
#include "..\Maps\Factions_KainengCity\BukdekByway.au3"
#include "..\Maps\Factions_KainengCity\NahpuiQuarter.au3"
#include "..\Maps\Factions_KainengCity\PongmeiValley.au3"
#include "..\Maps\Factions_KainengCity\RaisuPalace.au3"
#include "..\Maps\Factions_KainengCity\ShadowsPassage.au3"
#include "..\Maps\Factions_KainengCity\ShenzunTunnels.au3"
#include "..\Maps\Factions_KainengCity\SunjiangDistrict.au3"
#include "..\Maps\Factions_KainengCity\TahnnakiTemple.au3"
#include "..\Maps\Factions_KainengCity\WajjunBazaar.au3"
#include "..\Maps\Factions_KainengCity\XaquangSkyway.au3"
;Echovald Forest
#include "..\Maps\Factions_EchovaldForest\Arborstone.au3"
#include "..\Maps\Factions_EchovaldForest\DrazachThicket.au3"
#include "..\Maps\Factions_EchovaldForest\Ferndale.au3"
#include "..\Maps\Factions_EchovaldForest\MelandrusHope.au3"
#include "..\Maps\Factions_EchovaldForest\MorostavTrail.au3"
#include "..\Maps\Factions_EchovaldForest\MourningVeilFalls.au3"
#include "..\Maps\Factions_EchovaldForest\TheEternalGrove.au3"
;TheJadeSea
#include "..\Maps\Factions_TheJadeSea\Archipelagos.au3"
#include "..\Maps\Factions_TheJadeSea\BoreasSeabed.au3"
#include "..\Maps\Factions_TheJadeSea\GyalaHatchery.au3"
#include "..\Maps\Factions_TheJadeSea\MaishangHills.au3"
#include "..\Maps\Factions_TheJadeSea\MountQinkai.au3"
#include "..\Maps\Factions_TheJadeSea\RheasCrater.au3"
#include "..\Maps\Factions_TheJadeSea\SilentSurf.au3"
#include "..\Maps\Factions_TheJadeSea\UnwakingWaters.au3"
;Istan
#include "..\Maps\NF_Istan\CliffsOfDohjok.au3"
#include "..\Maps\NF_Istan\FahranurTheFirstCity.au3"
#include "..\Maps\NF_Istan\IssnurIsles.au3"
#include "..\Maps\NF_Istan\LahtendaBog.au3"
#include "..\Maps\NF_Istan\MehtaniKeys.au3"
#include "..\Maps\NF_Istan\PlainsofJarin.au3"
#include "..\Maps\NF_Istan\ZehlonReach.au3"
;Kourna
#include "..\Maps\NF_Kourna\ArkjokWard.au3"
#include "..\Maps\NF_Kourna\BahdokCaverns.au3"
#include "..\Maps\NF_Kourna\BarbarousShore.au3"
#include "..\Maps\NF_Kourna\DejarinEstate.au3"
#include "..\Maps\NF_Kourna\GandaraTheMoonFortress.au3"
#include "..\Maps\NF_Kourna\JahaiBluffs.au3"
#include "..\Maps\NF_Kourna\MargaCoast.au3"
#include "..\Maps\NF_Kourna\SunwardMarches.au3"
#include "..\Maps\NF_Kourna\TheFloodplainOfMahnkelon.au3"
#include "..\Maps\NF_Kourna\TuraisProcession.au3"
;Vabbi
#include "..\Maps\NF_Vabbi\ForumHighlands.au3"
#include "..\Maps\NF_Vabbi\GardenOfSeborhin.au3"
#include "..\Maps\NF_Vabbi\HoldingsOfChokhin.au3"
#include "..\Maps\NF_Vabbi\ResplendentMakuun.au3"
#include "..\Maps\NF_Vabbi\TheHiddenCityOfAhdashim.au3"
#include "..\Maps\NF_Vabbi\TheMirrorOfLyss.au3"
#include "..\Maps\NF_Vabbi\VehjinMines.au3"
#include "..\Maps\NF_Vabbi\VehtendiValley.au3"
#include "..\Maps\NF_Vabbi\WildernessOfBahdza.au3"
#include "..\Maps\NF_Vabbi\YatendiCanyons.au3"
;TheDesolation
#include "..\Maps\NF_TheDesolation\CrystalOverlook.au3"
#include "..\Maps\NF_TheDesolation\JokosDomain.au3"
#include "..\Maps\NF_TheDesolation\PoisonedOutcrops.au3"
#include "..\Maps\NF_TheDesolation\TheAlkaliPan.au3"
#include "..\Maps\NF_TheDesolation\TheRupturedHeart.au3"
#include "..\Maps\NF_TheDesolation\TheShatteredRavines.au3"
#include "..\Maps\NF_TheDesolation\TheSulfurousWastes.au3"
;CharrHomelands
#include "..\Maps\EOTN_CharrHomelands\DaladaUplands.au3"
#include "..\Maps\EOTN_CharrHomelands\GrothmarWardowns.au3"
#include "..\Maps\EOTN_CharrHomelands\SacnothValley.au3"
;FarShiverpeaks
#include "..\Maps\EOTN_FarShiverpeaks\BjoraMarches.au3"
#include "..\Maps\EOTN_FarShiverpeaks\DrakkarLake.au3"
#include "..\Maps\EOTN_FarShiverpeaks\IceCliffChasms.au3"
#include "..\Maps\EOTN_FarShiverpeaks\JagaMoraine.au3"
#include "..\Maps\EOTN_FarShiverpeaks\NorrhartDomains.au3"
#include "..\Maps\EOTN_FarShiverpeaks\VarajarFells.au3"
;TarnishedCoast
#include "..\Maps\EOTN_TarnishedCoast\ArborBay.au3"
#include "..\Maps\EOTN_TarnishedCoast\AlcaziaTangle.au3"
#include "..\Maps\EOTN_TarnishedCoast\MagusStones.au3"
#include "..\Maps\EOTN_TarnishedCoast\RivenEarth.au3"
#include "..\Maps\EOTN_TarnishedCoast\SparkflySwamp.au3"
#include "..\Maps\EOTN_TarnishedCoast\VerdantCascades.au3"
