#include-once
; Master Vanquisher globals loaded before GwAu3_AddOns.au3 (avoid duplicate constant errors)

Global Const $VANQUISHER_APP_DIR = @ScriptDir & "\app"
Global Const $VANQUISHER_CONFIG_DIR = $VANQUISHER_APP_DIR & "\Config"
Global Const $VANQUISHER_CHAR_INI = $VANQUISHER_CONFIG_DIR & "\Vanquisher.ini"
Global Const $VANQUISHER_CHAR_INI_LOCAL = $VANQUISHER_CONFIG_DIR & "\Vanquisher.local.ini"

Global Enum $INSTANCETYPE_OUTPOST = 0, $INSTANCETYPE_EXPLORABLE, $INSTANCETYPE_LOADING

Global Enum $BAG_Backpack = 1, $BAG_BeltPouch, $BAG_Bag1, $BAG_Bag2, $BAG_EquipmentPack, $BAG_UnclaimedItems = 7, $BAG_Storage1, $BAG_Storage2, _
        $BAG_Storage3, $BAG_Storage4, $BAG_StorageAnniversary, $BAG_Storage5, $BAG_Storage6, $BAG_Storage7, $BAG_Storage8

Global Enum $HERO_Norgu = 1, $HERO_Goren, $HERO_Tahlkora, $HERO_MasterOfWhispers, $HERO_AcolyteJin, $HERO_Koss, $HERO_Dunkoro, $HERO_AcolyteSousuke, $HERO_Melonni, _
        $HERO_ZhedShadowhoof, $HERO_GeneralMorgahn, $HERO_MargridTheSly, $HERO_Olias = 14, $HERO_Razah, $HERO_MOX, $HERO_Jora = 18, $HERO_PyreFierceshot, _
        $HERO_Livia = 21, $HERO_Hayda, $HERO_Kahmu, $HERO_Gwen, $HERO_Xandra, $HERO_Vekk, $HERO_Ogden
Global Enum $HERO_MercenaryHero1 = 28, $HERO_MercenaryHero2 = 29, $HERO_MercenaryHero3 = 30, $HERO_MercenaryHero4 = 31, $HERO_MercenaryHero5 = 32, $HERO_MercenaryHero6 = 33, $HERO_MercenaryHero7 = 34, $HERO_MercenaryHero8 = 35

; Standard loot pickup defaults (used by GwAu3_AddOns CanPickUp)
Global $isGoldPickup = True
Global $isPurplePickup = False
Global $isBluePickup = False
Global $isWhiteRarityPickup = False
Global $isWhitePickup = True
Global $isBlackPickup = True
Global $isOtherPickup = False
Global $isCollPickup = False
Global $isCSalvPickup = False
Global $isCBagPickup = False

; Dyes to pickup: black (1670), white (1678)
Global Const $VANQUISHER_DYE_MODEL_IDS[] = [1670, 1678]

; Tomes to pickup [20]
Global Const $VANQUISHER_TOME_MODEL_IDS[] = [21796, 21797, 21798, 21799, 21800, 21801, 21802, 21803, 21804, 21805, 21786, 21787, 21788, 21789, 21790, 21791, 21792, 21793, 21794, 21795]
; Alcohol to pickup [17]
Global Const $VANQUISHER_ALCOHOL_MODEL_IDS[] = [910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682]
; Pcons to pickup or use [39]
Global Const $VANQUISHER_PCON_MODEL_IDS[] = [910, 5585, 6366, 6375, 22190, 24593, 28435, 30855, 31145, 35124, 36682, 6376, 21809, 21810, 21813, 36683, 21492, 21812, 22269, 22644, 22752, 28436, 15837, 21490, 30648, 31020, 6370, 21488, 21489, 22191, 26784, 28433, 5656, 18345, 21491, 37765, 21833, 28433, 28434]
; If death occurs use model IDs [6]
Global Const $VANQUISHER_DEATH_MODEL_IDS[] = [6370, 21488, 21489, 22191, 26784, 28433]

Global $OpenedChestAgentIDs[1] = [0]
Global $aChestID[24]
$aChestID[0] = 65   ; Krytan Chest
$aChestID[1] = 66   ; Elonian Chest
$aChestID[2] = 67   ; Maguuma Chest
$aChestID[3] = 68   ; Phantom Chest
$aChestID[4] = 69   ; Ascalonian Chest
$aChestID[5] = 70   ; Miners Chest
$aChestID[6] = 71   ; Steel Chest
$aChestID[7] = 72   ; Shiverpeak Chest
$aChestID[8] = 73   ; Darkstone Chest
$aChestID[9] = 74   ; Obsidian Chest
$aChestID[10] = 4576 ; Forbidden Chest
$aChestID[11] = 4577 ; Kurzick Chest
$aChestID[12] = 4578 ; Stoneroot Chest
$aChestID[13] = 4579 ; Shing Jea Chest
$aChestID[14] = 4580 ; Luxon Chest
$aChestID[15] = 4581 ; Deep Jade Chest
$aChestID[16] = 4582 ; Canthan Chest
$aChestID[17] = 6061 ; Ancient Elonian Chest
$aChestID[18] = 6062 ; Istani Chest
$aChestID[19] = 6063 ; Vabbi Chest
$aChestID[20] = 6064 ; Kournan Chest
$aChestID[21] = 6065 ; Margonite Chest
$aChestID[22] = 7053 ; Demonic Chest
$aChestID[23] = 8141 ; Locked Chest

; Faction guild donation: 5k per deposit packet, start only once 10k+ is held
Global Const $VANQUISHER_FACTION_DONATE_CHUNK = 5000
Global Const $VANQUISHER_FACTION_DONATE_MIN = 10000

; Harvest/event BUs: candy corn, cupcake, candy apple, pie, golden egg, skalefin soup, war supplies, rations, compass, honeycomb
Global Const $VANQUISHER_BU_MODEL_IDS[] = [ _
		$GC_I_MODELID_CANDY_CORN, _
		$GC_I_MODELID_CUPCAKE, _
		$GC_I_MODELID_CANDY_APPLE, _
		$GC_I_MODELID_PUMPKIN_PIE, _
		$GC_I_MODELID_GOLDEN_EGG, _
		$GC_I_MODELID_SKALEFIN_SOUP, _
                $GC_I_MODELID_WAR_SUPPLIES, _
                38613, _
                38614, _
                $GC_I_MODELID_HONEYCOMB _
]
; Parallel effect skill IDs (0 = no effect tracking, use if item present)
Global Const $VANQUISHER_BU_EFFECT_IDS[] = [ _
		$GC_I_SKILL_ID_CANDY_CORN_SKILL, _
		$GC_I_SKILL_ID_BIRTHDAY_CUPCAKE_SKILL, _
		$GC_I_SKILL_ID_CANDY_APPLE_SKILL, _
		0, _
		$GC_I_SKILL_ID_GOLDEN_EGG_SKILL, _
		0, _
                0, _
                0, _
                0, _
		0 _
]
; Per-zone startup usage target for each BU entry.
Global Const $VANQUISHER_BU_START_USE_COUNTS[] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2]
; All summoning stones from GwAu3 API ($GC_AI_ALL_SUMMONING_STONES)
Global Const $VANQUISHER_STONE_MODEL_IDS[] = [ _
		$GC_I_MODELID_MERCANTILE_SUMMONING_STONE, _
		$GC_I_MODELID_TENGU_SUPPORT_FLARE, _
		$GC_I_MODELID_IMPERIAL_GUARD_REINFORCEMENT_ORDER, _
		$GC_I_MODELID_AUTOMATON_SUMMONING_STONE, _
		$GC_I_MODELID_IGNEOUS_SUMMONING_STONE, _
		$GC_I_MODELID_CHITINOUS_SUMMONING_STONE, _
		$GC_I_MODELID_MYSTICAL_SUMMONING_STONE, _
		$GC_I_MODELID_AMBER_SUMMONING_STONE, _
		$GC_I_MODELID_ARTIC_SUMMONING_STONE, _
		$GC_I_MODELID_DEMONIC_SUMMONING_STONE, _
		$GC_I_MODELID_GELATINOUS_SUMMONING_STONE, _
		$GC_I_MODELID_FOSSILIZED_SUMMONING_STONE, _
		$GC_I_MODELID_JADEITE_SUMMONING_STONE, _
		$GC_I_MODELID_MISCHIEVOUS_SUMMONING_STONE, _
		$GC_I_MODELID_FROSTY_SUMMONING_STONE, _
		$GC_I_MODELID_MYSTERIOUS_SUMMONING_STONE, _
		$GC_I_MODELID_ZAISHEN_SUMMONING_STONE, _
		$GC_I_MODELID_GHASTLY_SUMMONING_STONE, _
		$GC_I_MODELID_CELESTIAL_SUMMONING_STONE, _
		$GC_I_MODELID_SHINING_BLADE_WAR_HORN, _
		$GC_I_MODELID_LEGIONNAIRE_SUMMONING_STONE _
]
Global Const $VANQUISHER_CONSUMABLE_BUFFER_MS = 1800000 ; 30 min between stone summons while pet is alive
Global Const $VANQUISHER_CONSUMABLE_DEBOUNCE_MS = 5000 ; short anti-spam after use while effect applies
Global Const $VANQUISHER_CONSUMABLE_POLL_MS = 10000 ; check effects every 10s during movement (not every tick)
Global Const $VANQUISHER_REZ_COMBAT_WAIT_MS = 30000 ; max wait for party rez during aggro movement
Global Const $VANQUISHER_BLOCK_COUNT_DEFAULT = 20
Global Const $VANQUISHER_BLOCK_COUNT_DEATH_RECOVERY = 2
Global Const $VANQUISHER_DEATH_RESTART_MAX = 3
Global $g_i_Vanquisher_DeathRestartCount = 0
Global $g_b_Vanquisher_PathfinderZoneActive = False
Global $g_i_Vanquisher_PathfinderZoneMapID = 0
Global Const $VANQUISHER_STONE_INTERVAL = $VANQUISHER_CONSUMABLE_BUFFER_MS
Global $g_h_Vanquisher_FightTimer = 0
Global $g_i_Vanquisher_FightStartMapID = 0

; Junundu skill IDs (bar slot order may vary — always resolve by SkillID)
Global Const $JUNUNDU_SKILL_TUNNEL = 1438
Global Const $JUNUNDU_SKILL_STRIKE = 1439
Global Const $JUNUNDU_SKILL_SMASH = 1440
Global Const $JUNUNDU_SKILL_FEAST = 1441
Global Const $JUNUNDU_SKILL_UNKNOWN = 1442
Global Const $JUNUNDU_SKILL_LEAVE = 1443 ; never cast
Global Const $JUNUNDU_SKILL_SIEGE = 1862
Global Const $JUNUNDU_SKILL_WAIL = 1865
Global Const $JUNUNDU_RANGE_MELEE = 400
Global Const $JUNUNDU_RANGE_SIEGE_MIN = 1250
Global Const $JUNUNDU_RANGE_SIEGE_MAX = 1450
Global Const $JUNUNDU_RANGE_AGGRO = 1450
Global Const $JUNUNDU_RANGE_FEAST = 144
Global Const $JUNUNDU_RANGE_WAIL = 1010
Global $g_h_Vanquisher_ConsumablePollTimer = 0
Global $g_h_Vanquisher_StoneTimer = 0
Global $g_a_Vanquisher_BULastUsed[10]
Global $g_a_Vanquisher_BUUsedThisZone[10]
Global $g_a_Vanquisher_ConsetLastUsed[3]
Global $g_b_Vanquisher_ConsetAppliedThisZone = False
Global $g_b_Vanquisher_ConsumablesAppliedThisZone = False
Global $g_b_Vanquisher_StoneHandledThisZone = False

Global $g_h_EditText = 0

; Character/client attach (AscEnd-style GwAu3 integration)
Global Const $doLoadLoggedChars = True
Global $ProcessID = ""
Global $Bot_Core_Initialized = False

; Legacy GWA/GWAPI names still referenced by some launcher builds (e.g. Gw2Auto_Reforged.au3)
Global $nHandle = 0
Global $nPID = 0

; Vanquish baseline on zone-in (foes remaining/killed when entering the explorable)
Global $g_i_Vanquisher_InitialFoesToKill = -1
Global $g_i_Vanquisher_InitialFoesKilled = 0
Global $g_b_Vanquisher_CounterUnreliable = False
Global $g_i_Vanquisher_SessionStartKilled = 0
Global $g_b_Vanquisher_HasRunRoute = False
Global $g_b_Vanquisher_RunFinished = False
Global $g_b_Vanquisher_AbortRoute = False
Global $g_b_Vanquisher_DeathResignPending = False
Global $g_b_Vanquisher_CombatAIReady = False
Global $g_i_Vanquisher_CombatAIReadyMapID = 0
Global $g_b_Vanquisher_TransitOnly = False
Global $g_i_Vanquisher_GoOutLastMapHandled = -1
Global $g_i_TearsRoute_LastMapHandled = -1
Global $g_i_StingrayRoute_LastMapHandled = -1
Global Const $VANQUISHER_CLIENT_HEARTBEAT_MS = 5000
Global $g_b_Vanquisher_ClientRecoveryInProgress = False

; Multi-zone queue (checked zones on Areas tab, run in order)
Global $g_a_VanquisherZoneQueue[0]
Global $g_a_VanquisherZoneRouteProfile[0]
Global $g_i_VanquisherZoneQueueIndex = -1
Global $g_b_Vanquisher_QueueAdvanced = False
Global $g_b_Vanquisher_SessionStarted = False
Global $g_b_AscalonCaravan_VisitedDG = False
Global $g_b_Vanquisher_CombinedMaguumaCaravanActive = False
Global $g_i_Vanquisher_CombinedMaguumaStage = 0
Global $g_b_Vanquisher_CombinedAscalonCaravanActive = False
Global $g_i_Vanquisher_CombinedAscalonStage = 0

; Declared early so caravan helpers (included before Bot.au3 body) always see the same arrays/flags.
; Columns: campaign, region, map name, checked, map id, vanquished, outpost id, max party size, script name, route function, pre-travel label
Global $g_aMapEntries[0][11]
Global $g_bVanquishHistoryLoaded = False
