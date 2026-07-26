
Func _Vanquisher_IsOnTransitToFarm()
	Switch $Title
		Case "AscalonFoothills"
			Return GetMapID() = $AscalonFoothills_Transit
		Case "DiessaLowlands"
			Return GetMapID() = $DiessaLowlands_Transit
		Case "FlameTempleCorridor"
			Return GetMapID() = $FlameTempleCorridor_Transit
		Case "DragonsGullet"
			Return GetMapID() = $DragonsGullet_Transit Or GetMapID() = $DragonsGullet_Transit2
		Case "TheBreach"
			Return GetMapID() = $TheBreach_Transit Or GetMapID() = $TheBreach_Transit2 Or GetMapID() = $TheBreach_Transit3
		Case "OldAscalon"
			Return GetMapID() = $OldAscalon_Transit
		Case "RegentValley"
			Return GetMapID() = $RegentValley_Transit
		Case "PockmarkFlats"
			Return GetMapID() = $PockmarkFlats_Transit
		Case "EasternFrontier"
			Return GetMapID() = $EasternFrontier_Transit
	EndSwitch
	Return False
EndFunc

Func GoOut()
	If _Vanquisher_ShouldStop() Then Return
	RndSleep(250)

	If GetGoldCharacter() < 100 AND GetGoldStorage() > 100 Then
		CurrentAction("Grabbing gold for shrine")
		RndSleep(250)
		WithdrawGold(100)
		RndSleep(250)
	EndIf

	CurrentAction("Going out")
	_Vanquisher_ResetGoOutRouteProgress()
	ReDim $heroNumberWithRez[0]
	CacheHeroesWithRez()

	Do
		If _Vanquisher_ShouldStop() Then Return

		Switch $Title
		;Ascalon
			Case "AscalonFoothills"
				GoOutAscalonFoothills()
			Case "DiessaLowlands"
				GoOutDiessaLowlands()
			Case "DragonsGullet"
				GoOutDragonsGullet()
			Case "EasternFrontier"
				GoOutEasternFrontier()
			Case "FlameTempleCorridor"
				GoOutFlameTempleCorridor()
			Case "OldAscalon"
				GoOutOldAscalon()
			Case "PockmarkFlats"
				GoOutPockmarkFlats()
			Case "RegentValley"
				GoOutRegentValley()
			Case "TheBreach"
				GoOutTheBreach()
		;NorthernShiverpeaks
			Case "AnvilRock"
				GoOutAnvilRock()
			Case "DeldrimorBowl"
				GoOutDeldrimorBowl()
			Case "GriffonsMouth"
				GoOutGriffonsMouth()
			Case "IronHorseMine"
				GoOutIronHorseMine()
			Case "TravelersVale"
				GoOutTravelersVale()
		;Maguuma
			Case "DryTop"
				GoOutDryTop()
			Case "EttinsBack"
				GoOutEttinsBack()
			Case "MamnoonLagoon"
				GoOutMamnoonLagoon()
			Case "ReedBog"
				GoOutReedBog()
			Case "SageLands"
				GoOutSageLands()
			Case "Silverwood"
				GoOutSilverwood()
			Case "TangleRoot"
				GoOutTangleRoot()
			Case "TheFalls"
				GoOutTheFalls()
		;CrystalDesert
			Case "DivinersAscent"
				GoOutDivinersAscent()
			Case "ProphetsPath"
				GoOutProphetsPath()
			Case "SaltFlats"
				GoOutSaltFlats()
			Case "SkywardReach"
				GoOutSkywardReach()
			Case "TheAridSea"
				GoOutTheAridSea()
			Case "TheScar"
				GoOutTheScar()
			Case "VultureDrifts"
				GoOutVultureDrifts()
		;Kryta
			Case "CursedLands"
				GoOutCursedLands()
			Case "KessexPeak"
				GoOutKessexPeak()
			Case "MajestysRest"
				GoOutMajestysRest()
			Case "NeboTerrace"
				GoOutNeboTerrace()
			Case "NorthKrytaProvince"
				GoOutNorthKrytaProvince()
			Case "ScoundrelsRise"
				GoOutScoundrelsRise()
			Case "StingrayStrand"
				GoOutStingrayStrand()
			Case "TalmarkWilderness"
				GoOutTalmarkWilderness()
			Case "TearsoftheFallen"
				GoOutTearsoftheFallen()
			Case "TheBlackCurtain"
				GoOutTheBlackCurtain()
			Case "TwinSerpentLakes"
				GoOutTwinSerpentLakes()
			Case "WatchtowerCoast"
				GoOutWatchtowerCoast()
		;SouthernShiverpeaks
			Case "DreadnoughtsDrift"
				GoOutDreadnoughtsDrift()
			Case "FrozenForest"
				GoOutFrozenForest()
			Case "GrenthsFootprint"
				GoOutGrenthsFootprint()
			Case "IceFloe"
				GoOutIceFloe()
			Case "Icedome"
				GoOutIcedome()
			Case "LornarsPass"
				GoOutLornarsPass()
			Case "MineralSprings"
				GoOutMineralSprings()
			Case "SnakeDance"
				GoOutSnakeDance()
			Case "SpearheadPeak"
				GoOutSpearheadPeak()
			Case "TalusChute"
				GoOutTalusChute()
			Case "TascasDemise"
				GoOutTascasDemise()
			Case "WitmansFolly"
				GoOutWitmansFolly()
		;RingOfFireIsland
			Case "PerditionRock"
				GoOutPerditionRock()
		;ShingJeaIsland
			Case "HaijuLagoon"
				GoOutHaijuLagoon()
			Case "JayaBluffs"
				GoOutJayaBluffs()
			Case "KinyaProvince"
				GoOutKinyaProvince()
			Case "MinisterChosEstate"
				GoOutMinisterChosEstate()
			Case "PanjiangPeninsula"
				GoOutPanjiangPeninsula()
			Case "SaoshangTrail"
				GoOutSaoshangTrail()
			Case "SunquaVale"
				GoOutSunquaVale()
			Case "ZenDaijun"
				GoOutZenDaijun()
		;KainengCity
			Case "BukdekByway"
				GoOutBukdekByway()
			Case "NahpuiQuarter"
				GoOutNahpuiQuarter()
			Case "PongmeiValley"
				GoOutPongmeiValley()
			Case "RaisuPalace"
				GoOutRaisuPalace()
			Case "ShadowsPassage"
				GoOutShadowsPassage()
			Case "ShenzunTunnels"
				GoOutShenzunTunnels()
			Case "SunjiangDistrict"
				GoOutSunjiangDistrict()
			Case "TahnnakiTemple"
				GoOutTahnnakiTemple()
			Case "WajjunBazaar"
				GoOutWajjunBazaar()
			Case "XaquangSkyway"
				GoOutXaquangSkyway()
		;Echovald Forest
			Case "Arborstone"
				GoOutArborstone()
			Case "DrazachThicket"
				GoOutDrazachThicket()
			Case "Ferndale"
				GoOutFerndale()
			Case "MelandrusHope"
				GoOutMelandrusHope()
			Case "MorostavTrail"
				GoOutMorostavTrail()
			Case "MourningVeilFalls"
				GoOutMourningVeilFalls()
			Case "TheEternalGrove"
				GoOutTheEternalGrove()
		;TheJadeSea
			Case "Archipelagos"
				GoOutArchipelagos()
			Case "BoreasSeabed"
				GoOutBoreasSeabed()
			Case "GyalaHatchery"
				GoOutGyalaHatchery()
			Case "MaishangHills"
				GoOutMaishangHills()
			Case "MountQinkai"
				GoOutMountQinkai()
			Case "RheasCrater"
				GoOutRheasCrater()
			Case "SilentSurf"
				GoOutSilentSurf()
			Case "UnwakingWaters"
				GoOutUnwakingWaters()
		;Istan
			Case "CliffsOfDohjok"
				GoOutCliffsOfDohjok()
			Case "FahranurTheFirstCity"
				GoOutFahranurTheFirstCity()
			Case "IssnurIsles"
				GoOutIssnurIsles()
			Case "LahtendaBog"
				GoOutLahtendaBog()
			Case "MehtaniKeys"
				GoOutMehtaniKeys()
			Case "PlainsofJarin"
				GoOutPlainsofJarin()
			Case "ZehlonReach"
				GoOutZehlonReach()
		;Kourna
			Case "ArkjokWard"
				GoOutArkjokWard()
			Case "BahdokCaverns"
				GoOutBahdokCaverns()
			Case "BarbarousShore"
				GoOutBarbarousShore()
			Case "DejarinEstate"
				GoOutDejarinEstate()
			Case "GandaraTheMoonFortress"
				GoOutGandaraTheMoonFortress()
			Case "JahaiBluffs"
				GoOutJahaiBluffs()
			Case "MargaCoast"
				GoOutMargaCoast()
			Case "SunwardMarches"
				GoOutSunwardMarches()
			Case "TheFloodplainOfMahnkelon"
				GoOutTheFloodplainOfMahnkelon()
			Case "TuraisProcession"
				GoOutTuraisProcession()
		;Vabbi
			Case "ForumHighlands"
				GoOutForumHighlands()
			Case "GardenOfSeborhin"
				GoOutGardenOfSeborhin()
			Case "HoldingsOfChokhin"
				GoOutHoldingsOfChokhin()
			Case "ResplendentMakuun"
				GoOutResplendentMakuun()
			Case "TheHiddenCityOfAhdashim"
				GoOutTheHiddenCityOfAhdashim()
			Case "TheMirrorOfLyss"
				GoOutTheMirrorOfLyss()
			Case "VehjinMines"
				GoOutVehjinMines()
			Case "VehtendiValley"
				GoOutVehtendiValley()
			Case "WildernessOfBahdza"
				GoOutWildernessOfBahdza()
			Case "YatendiCanyons"
				GoOutYatendiCanyons()
		;TheDesolation
			Case "CrystalOverlook"
				GoOutCrystalOverlook()
			Case "JokosDomain"
				GoOutJokosDomain()
			Case "PoisonedOutcrops"
				GoOutPoisonedOutcrops()
			Case "TheAlkaliPan"
				GoOutTheAlkaliPan()
			Case "TheRupturedHeart"
				GoOutTheRupturedHeart()
			Case "TheShatteredRavines"
				GoOutTheShatteredRavines()
			Case "TheSulfurousWastes"
				GoOutTheSulfurousWastes()
		;CharrHomelands
			Case "DaladaUplands"
				GoOutDaladaUplands()
			Case "GrothmarWardowns"
				GoOutGrothmarWardowns()
			Case "SacnothValley"
				GoOutSacnothValley()
		;FarShiverpeaks
			Case "BjoraMarches"
				GoOutBjoraMarches()
			Case "DrakkarLake"
				GoOutDrakkarLake()
			Case "IceCliffChasms"
				GoOutIceCliffChasms()
			Case "JagaMoraine"
				GoOutJagaMoraine()
			Case "NorrhartDomains"
				GoOutNorrhartDomains()
			Case "VarajarFells"
				GoOutVarajarFells()
		;TarnishedCoast
			Case "ArborBay"
				GoOutArborBay()
			Case "AlcaziaTangle"
				GoOutAlcaziaTangle()
			Case "MagusStones"
				GoOutMagusStones()
			Case "RivenEarth"
				GoOutRivenEarth()
			Case "SparkflySwamp"
				GoOutSparkflySwamp()
			Case "VerdantCascades"
				GoOutVerdantCascades()
		EndSwitch
		RndSleep(2000)
	Until GetMapID() = $Map_To_Farm Or _Vanquisher_ShouldStop()
EndFunc
