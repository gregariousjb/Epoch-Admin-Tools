private ["_playerUID","_clientKey","_worldspace","_selectDelay","_crate","_pos","_dir","_activatingPlayer","_bloodBag","_cfgweapons","_weapon","_key_colors","_wpn_type","_cfgmagazines","_magazine","_mag_type","_classname","_spawnCrate"];

#define EAT_CrateSetup _spawnCrate = _classname createVehicle _pos; _spawnCrate setposATL _pos; _spawnCrate setDir _dir; clearWeaponCargoGlobal _spawnCrate; clearMagazineCargoGlobal _spawnCrate; clearBackpackCargoGlobal _spawnCrate; _spawnCrate setVariable ["ObjectID","1",true]; dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_spawnCrate];

// Backpack crate
EAT_backpackCrateContents = [["DZ_Backpack_EP1", 1],["DZ_British_ACU", 1],["DZ_CivilBackpack_EP1", 1],["DZ_GunBag_EP1", 1],["DZ_LargeGunBag_EP1", 1]];

// Items Crate
_bloodBag = "ItemBloodbag";
if(dayz_classicBloodBagSystem) then {_bloodBag = "bloodBagONEG";};
EAT_itemCrateWeapons = [["Binocular", 5],["Binocular_Vector", 5],["ItemCompass", 5],["ItemCrowbar", 5],["ItemEtool", 5],["ItemFishingPole", 5],["ItemFlashlight", 5],["ItemFlashlightRed", 5],["ItemGPS", 5],["ItemHatchet", 5],["ItemKeyKit", 5],["ItemKnife", 5],["ItemMap", 5],["ItemMatchBox", 5],["ItemRadio", 5],["ItemSledge", 5],["ItemToolbox", 5],["ItemWatch", 5],["Laserdesignator", 5],["NVGoggles", 5]];
EAT_itemCrateMagazines = [["FoodbeefCooked", 10],["HandChemBlue", 10],["HandChemGreen", 10],["HandChemRed", 10],["HandRoadFlare", 10],["ItemAntibiotic", 10],["ItemBandage", 10],[_bloodBag, 10],["ItemBriefcase100oz", 10],["ItemBriefcaseEmpty", 10],["ItemCopperBar", 10],["ItemCopperBar10oz", 10],["ItemEpinephrine", 10],["ItemFuelBarrel", 10],["ItemGoldBar", 10],["ItemGoldBar10oz", 10],["ItemHeatPack", 10],["ItemJerrycan", 10],["ItemMorphine", 10],["ItemOilBarrel", 10],["ItemPainkiller", 10],["ItemSilverBar", 10],["ItemSilverBar10oz", 10],["ItemSodaMdew", 10],["PartEngine", 10],["PartFueltank", 10],["PartGeneric", 10],["PartGlass", 10],["PartVRotor", 10],["PartWheel", 10],["Skin_Bandit1_DZ", 10],["Skin_Bandit2_DZ", 10],["Skin_BanditW1_DZ", 10],["Skin_BanditW2_DZ", 10],["Skin_CZ_Soldier_Sniper_EP1_DZ", 10],["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10],["Skin_Drake_Light_DZ", 10],["Skin_FR_OHara_DZ", 10],["Skin_FR_Rodriguez_DZ", 10],["Skin_Functionary1_EP1_DZ", 10],["Skin_Graves_Light_DZ", 10],["Skin_GUE_Commander_DZ", 10],["Skin_GUE_Soldier_2_DZ", 10],["Skin_GUE_Soldier_CO_DZ", 10],["Skin_GUE_Soldier_Crew_DZ", 10],["Skin_GUE_Soldier_MG_DZ", 10],["Skin_GUE_Soldier_Sniper_DZ", 10],["Skin_Haris_Press_EP1_DZ", 10],["Skin_Ins_Soldier_GL_DZ", 10],["Skin_Pilot_EP1_DZ", 10],["Skin_Priest_DZ", 10],["Skin_Rocker1_DZ", 10],["Skin_Rocker2_DZ", 10],["Skin_Rocker3_DZ", 10],["Skin_Rocker4_DZ", 10],["Skin_Rocket_DZ", 10],["Skin_RU_Policeman_DZ", 10],["Skin_Sniper1_DZ", 10],["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10],["Skin_Soldier_Sniper_PMC_DZ", 10],["Skin_Soldier_TL_PMC_DZ", 10],["Skin_SurvivorW2_DZ", 10],["Skin_SurvivorW3_DZ", 10],["Skin_SurvivorWcombat_DZ", 10],["Skin_SurvivorWdesert_DZ", 10],["Skin_SurvivorWpink_DZ", 10],["Skin_SurvivorWurban_DZ", 10],["Skin_Assistant_DZ", 10],["Skin_TK_INS_Soldier_EP1_DZ", 10],["Skin_TK_INS_Warlord_EP1_DZ", 10],["TrapBear", 10],["TrashJackDaniels", 10],["TrashTinCan", 10]];

// Building Crate
EAT_buildingCrateWeapons = [["ItemCrowbar", 5],["ItemEtool", 5],["ItemHatchet", 5],["ItemMatchBox", 5],["ItemSledge", 5],["ItemToolbox", 5]];
EAT_buildingCrateMagazines = [["plot_pole_kit", 10],["bulk_empty", 10],["bulk_ItemTankTrap", 20],["bulk_ItemWire",  10],["CinderBlocks", 30],["cinder_door_kit", 10],["cinder_garage_kit", 10],["full_cinder_wall_kit", 60],["deer_stand_kit", 10],["desert_large_net_kit", 10],["desert_net_kit", 10],["forest_large_net_kit", 10],["forest_net_kit", 10],["fuel_pump_kit", 10],["ItemBurlap", 10],["ItemCanvas", 10],["ItemComboLock", 10],["ItemCorrugated", 10],["ItemFireBarrel_Kit", 10],["ItemFuelBarrelEmpty", 10],["ItemGenerator", 10],["ItemGunRackKit", 10],["ItemHotwireKit", 10],["ItemJerrycan", 10],["ItemLockbox", 10],["ItemPole", 10],["ItemSandbag", 50],["ItemSandbagExLarge", 20],["ItemSandbagExLarge5x", 20],["ItemSandbagLarge", 20],["ItemScaffoldingKit", 10],["BagFenceRound_DZ_kit",20],["ItemTankTrap", 10],["ItemTent", 5],["ItemDesertTent", 5],["ItemVault", 10],["ItemWire", 10],["ItemWoodFloor", 30],["ItemWoodFloorHalf", 30],["ItemWoodFloorQuarter", 30],["ItemWoodLadder", 30],["ItemWoodStairs", 10],["ItemWoodStairsSupport", 10],["ItemWoodWall", 30],["ItemWoodWallDoor", 10],["ItemWoodWallDoorLg", 10],["ItemWoodWallGarageDoor", 10],["ItemWoodWallGarageDoorLocked", 10],["ItemWoodWallLg", 30],["ItemWoodWallThird", 20],["ItemWoodWallWindow", 20],["ItemWoodWallWindowLg", 30],["ItemWoodWallWithDoor", 10],["ItemWoodWallwithDoorLg", 10],["ItemWoodWallWithDoorLgLocked", 10],["ItemWoodWallWithDoorLocked", 10],["light_pole_kit", 10],["m240_nest_kit", 5],["metal_floor_kit", 60],["metal_panel_kit", 20],["MortarBucket", 5],["outhouse_kit", 5],["park_bench_kit", 5],["PartGeneric", 30],["PartPlankPack", 30],["PartPlywoodPack", 30],["PartWoodLumber", 30],["PartWoodPile", 30],["PartWoodPlywood", 30],["rusty_gate_kit", 5],["sandbag_nest_kit", 30],["stick_fence_kit", 5],["storage_shed_kit", 10],["sun_shade_kit", 10],["wooden_shed_kit", 10],["wood_ramp_kit", 10],["wood_shack_kit", 10],["workbench_kit", 5]];

// Weapons Crate
EAT_weaponCrateWeapons = [["G36C_DZ", 5],["G36C_CCO_DZ", 5],["G36C_Holo_DZ", 5],["G36C_ACOG_DZ", 5],["G36C_SD_DZ", 5],["G36C_CCO_SD_DZ", 5],["G36C_Holo_SD_DZ", 5],["G36C_ACOG_SD_DZ", 5],["G36C_camo", 5],["G36A_Camo_DZ", 5],["G36K_Camo_DZ", 5],["G36K_Camo_SD_DZ", 5],["M16A2_DZ", 5],["M16A2_GL_DZ", 5],["M16A4_DZ", 5],["M16A4_CCO_DZ", 5],["M16A4_Holo_DZ", 5],["M16A4_ACOG_DZ", 5],["M16A4_GL_DZ", 5],["M16A4_FL_DZ", 5],["M16A4_MFL_DZ", 5],["M16A4_CCO_FL_DZ", 5],["M16A4_Holo_FL_DZ", 5],["M16A4_ACOG_FL_DZ", 5],["M16A4_GL_FL_DZ", 5],["M16A4_CCO_MFL_DZ", 5],["M16A4_Holo_MFL_DZ", 5],["M16A4_ACOG_MFL_DZ", 5],["M16A4_GL_MFL_DZ", 5],["M16A4_GL_CCO_DZ", 5],["M16A4_GL_Holo_DZ", 5],["M16A4_GL_ACOG_DZ", 5],["M16A4_GL_CCO_FL_DZ", 5],["M16A4_GL_Holo_FL_DZ", 5],["M16A4_GL_ACOG_FL_DZ", 5],["M16A4_GL_CCO_MFL_DZ", 5],["M16A4_GL_Holo_MFL_DZ", 5],["M16A4_GL_ACOG_MFL_DZ", 5],["M4A1_DZ", 5],["M4A1_FL_DZ", 5],["M4A1_MFL_DZ", 5],["M4A1_SD_DZ", 5],["M4A1_SD_FL_DZ", 5],["M4A1_SD_MFL_DZ", 5],["M4A1_CCO_DZ", 5],["M4A1_CCO_FL_DZ", 5],["M4A1_CCO_MFL_DZ", 5],["M4A1_CCO_SD_DZ", 5],["M4A1_CCO_SD_FL_DZ", 5],["M4A1_CCO_SD_MFL_DZ", 5],["M4A1_Holo_DZ", 5],["M4A1_Holo_FL_DZ", 5],["M4A1_Holo_MFL_DZ", 5],["M4A1_Holo_SD_DZ", 5],["M4A1_Holo_SD_FL_DZ", 5],["M4A1_Holo_SD_MFL_DZ", 5],["M4A1_ACOG_DZ", 5],["M4A1_ACOG_FL_DZ", 5],["M4A1_ACOG_MFL_DZ", 5],["M4A1_ACOG_SD_DZ", 5],["M4A1_ACOG_SD_FL_DZ", 5],["M4A1_ACOG_SD_MFL_DZ", 5],["M4A1_GL_DZ", 5],["M4A1_GL_FL_DZ", 5],["M4A1_GL_MFL_DZ", 5],["M4A1_GL_SD_DZ", 5],["M4A1_GL_SD_FL_DZ", 5],["M4A1_GL_SD_MFL_DZ", 5],["M4A1_GL_CCO_DZ", 5],["M4A1_GL_CCO_FL_DZ", 5],["M4A1_GL_CCO_MFL_DZ", 5],["M4A1_GL_CCO_SD_DZ", 5],["M4A1_GL_CCO_SD_FL_DZ", 5],["M4A1_GL_CCO_SD_MFL_DZ", 5],["M4A1_GL_Holo_DZ", 5],["M4A1_GL_Holo_FL_DZ", 5],["M4A1_GL_Holo_MFL_DZ", 5],["M4A1_GL_Holo_SD_DZ", 5],["M4A1_GL_Holo_SD_FL_DZ", 5],["M4A1_GL_Holo_SD_MFL_DZ", 5],["M4A1_GL_ACOG_DZ", 5],["M4A1_GL_ACOG_FL_DZ", 5],["M4A1_GL_ACOG_MFL_DZ", 5],["M4A1_GL_ACOG_SD_DZ", 5],["M4A1_GL_ACOG_SD_FL_DZ", 5],["M4A1_GL_ACOG_SD_MFL_DZ", 5],["M4A1_HWS_GL_camo", 5],["M4A1_HWS_GL_SD_Camo", 5],["M4A3_CCO_EP1", 5],["SCAR_L_CQC", 5],["SCAR_L_CQC_CCO_SD", 5],["SCAR_L_CQC_Holo", 5],["SCAR_L_CQC_EGLM_Holo", 5],["SCAR_L_STD_EGLM_RCO", 5],["SCAR_L_STD_HOLO", 5],["SCAR_L_STD_Mk4CQT", 5],["SA58_DZ", 5],["SA58_RIS_DZ", 5],["SA58_RIS_FL_DZ", 5],["SA58_RIS_MFL_DZ", 5],["SA58_CCO_DZ", 5],["SA58_CCO_FL_DZ", 5],["SA58_CCO_MFL_DZ", 5],["SA58_Holo_DZ", 5],["SA58_Holo_FL_DZ", 5],["SA58_Holo_MFL_DZ", 5],["SA58_ACOG_DZ", 5],["SA58_ACOG_FL_DZ", 5],["SA58_ACOG_MFL_DZ", 5],["Sa58V_CCO_EP1", 5],["Sa58V_RCO_EP1", 5],["AKS74U_DZ", 5],["AKS74U_Kobra_DZ", 5],["AKS74U_SD_DZ", 5],["AKS74U_Kobra_SD_DZ", 5],["AKM_DZ", 5],["AKM_Kobra_DZ", 5],["AKM_PSO1_DZ", 5],["AK74_DZ", 5],["AK74_Kobra_DZ", 5],["AK74_PSO1_DZ", 5],["AK74_GL_DZ", 5],["AK74_SD_DZ", 5],["AK74_Kobra_SD_DZ", 5],["AK74_PSO1_SD_DZ", 5],["AK74_GL_SD_DZ", 5],["AK74_GL_Kobra_DZ", 5],["AK74_GL_PSO1_DZ", 5],["AK74_GL_Kobra_SD_DZ", 5],["AK74_GL_PSO1_SD_DZ", 5],["FNFAL_DZ", 5],["FNFAL_CCO_DZ", 5],["FNFAL_Holo_DZ", 5],["BAF_L86A2_ACOG", 5],["L110A1_DZ", 5],["L110A1_CCO_DZ", 5],["L110A1_Holo_DZ", 5],["M249_DZ", 5],["M249_CCO_DZ", 5],["M249_Holo_DZ", 5],["M240_DZ", 5],["M240_CCO_DZ", 5],["M240_Holo_DZ", 5],["Mk48_DZ", 5],["Mk48_CCO_DZ", 5],["Mk48_Holo_DZ", 5],["RPK_DZ", 5],["RPK_Kobra_DZ", 5],["RPK_PSO1_DZ", 5],["RPK74_DZ", 5],["RPK74_Kobra_DZ", 5],["RPK74_PSO1_DZ", 5],["UK59_DZ", 5],["PKM_DZ", 5],["Pecheneg_DZ", 5],["Crossbow_DZ", 5],["Crossbow_CCO_DZ", 5],["Crossbow_FL_DZ", 5],["Crossbow_MFL_DZ", 5],["Crossbow_Scope_DZ", 5],["Crossbow_CCO_FL_DZ", 5],["Crossbow_Scope_FL_DZ", 5],["Crossbow_CCO_MFL_DZ", 5],["Crossbow_Scope_MFL_DZ", 5],["RedRyder", 5],["MR43_DZ", 5],["Winchester1866_DZ", 5],["M1014_DZ", 5],["M1014_CCO_DZ", 5],["M1014_Holo_DZ", 5],["Remington870_DZ", 5],["Remington870_FL_DZ", 5],["Remington870_MFL_DZ", 5],["LeeEnfield_DZ", 5],["Mosin_DZ", 5],["Mosin_FL_DZ", 5],["Mosin_MFL_DZ", 5],["Mosin_Belt_DZ", 5],["Mosin_Belt_FL_DZ", 5],["Mosin_Belt_MFL_DZ", 5],["Mosin_PU_DZ", 5],["Mosin_PU_FL_DZ", 5],["Mosin_PU_MFL_DZ", 5],["Mosin_PU_Belt_DZ", 5],["Mosin_PU_Belt_FL_DZ", 5],["Mosin_PU_Belt_MFL_DZ", 5],["M4SPR", 5],["M14_DZ", 5],["M14_Gh_DZ", 5],["M14_CCO_DZ", 5],["M14_Holo_DZ", 5],["M14_CCO_Gh_DZ", 5],["M14_Holo_Gh_DZ", 5],["CZ550_DZ", 5],["M24_DZ", 5],["M24_Gh_DZ", 5],["M24_des_EP1", 5],["M40A3_DZ", 5],["M40A3_Gh_DZ", 5],["SVD_DZ", 5],["SVD_Gh_DZ", 5],["SVD_PSO1_DZ", 5],["SVD_PSO1_Gh_DZ", 5],["SVD_des_EP1", 5],["Sa61_EP1", 5],["PDW_DZ", 5],["UZI_SD_EP1", 5],["MP5_DZ", 5],["MP5_SD_DZ", 5],["Bizon_DZ", 5],["Bizon_SD_DZ", 5],["MeleeBaseBallBat", 5],["Saiga12K", 5],["AA12_PMC", 5],["m8_compact", 5],["m8_sharpshooter", 5],["m8_holo_sd", 5],["m8_carbine", 5],["M8_SAW", 5],["SCAR_H_CQC_CCO", 5],["SCAR_H_CQC_CCO_SD", 5],["SCAR_H_STD_EGLM_Spect", 5],["MG36", 5],["MG36_camo", 5],["M249_m145_EP1_DZE", 5],["M60A4_EP1_DZE", 5],["m240_scoped_EP1_DZE", 5],["VSS_vintorez", 5],["KSVK_DZE", 5],["M9_DZ", 5],["M9_SD_DZ", 5],["G17_DZ", 5],["G17_FL_DZ", 5],["G17_MFL_DZ", 5],["G17_SD_DZ", 5],["G17_SD_FL_DZ", 5],["G17_SD_MFL_DZ", 5],["Makarov_DZ", 5],["Makarov_SD_DZ", 5],["Revolver_DZ", 5],["revolver_gold_EP1", 5],["M1911_DZ", 5],["G36_C_SD_camo", 5],["M4A1_AIM_SD_camo", 5],["FN_FAL_ANPVS4_DZE", 5],["SCAR_H_LNG_Sniper", 5],["SCAR_H_LNG_Sniper_SD", 5],["M110_NVG_EP1", 5],["DMR_DZ", 5],["DMR_Gh_DZ", 5],["BAF_LRR_scoped", 5],["BAF_LRR_scoped_W", 5],["m107_DZ", 5],["Anzio_20_DZ", 5],["BAF_AS50_scoped_DZ", 5],["L85A2_DZ", 5],["L85A2_FL_DZ", 5],["L85A2_MFL_DZ", 5],["L85A2_SD_DZ", 5],["L85A2_SD_FL_DZ", 5],["L85A2_SD_MFL_DZ", 5],["L85A2_CCO_DZ", 5],["L85A2_CCO_FL_DZ", 5],["L85A2_CCO_MFL_DZ", 5],["L85A2_CCO_SD_DZ", 5],["L85A2_CCO_SD_FL_DZ", 5],["L85A2_CCO_SD_MFL_DZ", 5],["L85A2_Holo_DZ", 5],["L85A2_Holo_FL_DZ", 5],["L85A2_Holo_MFL_DZ", 5],["L85A2_Holo_SD_DZ", 5],["L85A2_Holo_SD_FL_DZ", 5],["L85A2_Holo_SD_MFL_DZ", 5],["L85A2_ACOG_DZ", 5],["L85A2_ACOG_FL_DZ", 5],["L85A2_ACOG_MFL_DZ", 5],["L85A2_ACOG_SD_DZ", 5],["L85A2_ACOG_SD_FL_DZ", 5],["L85A2_ACOG_SD_MFL_DZ", 5]];
EAT_weaponCrateMagazines = [["2Rnd_12Gauge_Slug", 20],["2Rnd_12Gauge_Buck", 20],["5Rnd_127x108_KSVK", 20],["5Rnd_127x99_as50", 20],["5Rnd_762x51_M24", 20],["5Rnd_86x70_L115A1", 20],["5x_22_LR_17_HMR", 20],["6Rnd_45ACP", 20],["7Rnd_45ACP_1911", 20],["8Rnd_9x18_Makarov", 20],["8Rnd_9x18_MakarovSD", 20],["8Rnd_B_Beneli_74Slug", 20],["8Rnd_B_Beneli_Pellets", 20],["8Rnd_B_Saiga12_74Slug", 20],["8Rnd_B_Saiga12_Pellets", 20],["10Rnd_127x99_M107", 20],["3rnd_Anzio_20x102mm", 20],["10Rnd_762x54_SVD", 20],["10x_303", 20],["15Rnd_9x19_M9", 20],["15Rnd_9x19_M9SD", 20],["15Rnd_W1866_Slug", 20],["17Rnd_9x19_glock17", 20],["20Rnd_556x45_Stanag", 40],["20Rnd_762x51_DMR", 20],["20Rnd_762x51_FNFAL", 20],["20Rnd_B_765x17_Ball", 20],["30Rnd_545x39_AK", 20],["30Rnd_545x39_AKSD", 20],["30Rnd_556x45_G36", 30],["30Rnd_556x45_G36SD", 30],["30Rnd_556x45_Stanag", 40],["30Rnd_556x45_StanagSD", 20],["30Rnd_762x39_AK47", 20],["30Rnd_9x19_MP5", 20],["30Rnd_9x19_MP5SD", 20],["30Rnd_9x19_UZI", 20],["30Rnd_9x19_UZI_SD", 20],["50Rnd_127x108_KORD", 20],["64Rnd_9x19_Bizon", 20],["64Rnd_9x19_SD_Bizon", 20],["75Rnd_545x39_RPK", 20],["100Rnd_762x51_M240", 20],["100Rnd_762x54_PK", 20],["100Rnd_556x45_BetaCMag", 20],["100Rnd_556x45_M249", 20],["200Rnd_556x45_L110A1", 20],["200Rnd_556x45_M249", 20],["1Rnd_Bolt_Tranquilizer", 20],["1Rnd_Bolt_Explosive", 20],["12Rnd_Quiver_Wood", 20],["1Rnd_HE_M203", 20],["HandGrenade_west", 20],["SmokeShell", 20],["SmokeShellGreen", 20],["SmokeShellRed", 20],["PipeBomb", 20]];

_selectDelay = _this select 0;
_crate = _this select 1;
_worldspace = _this select 2;
_activatingPlayer = _this select 3;
_clientKey = _this select 4;
_playerUID = getPlayerUID _activatingPlayer;
_pos = _worldspace select 1;
_dir = _worldspace select 0;
_spawnCrate = "";


_exitReason = [_this,"EAT_crateSpawn",(_worldspace select 1),_clientKey,_playerUID,_activatingPlayer] call server_verifySender;
if (_exitReason != "") exitWith {diag_log _exitReason};

if (!(_playerUID in EAT_adminList)) exitWith {diag_log format["Unauthorized player (%1 - %2) trying to spawn crates",_activatingPlayer,_playerUID];};

call
{
	if (_crate == "AllWeapons") exitWith {
		if (isNil "weapons_list") then
		{
			weapons_list = [];
			_cfgweapons = configFile >> 'cfgWeapons';
			for "_i" from 0 to (count _cfgweapons)-1 do
			{
				_weapon = _cfgweapons select _i;
				if (isClass _weapon) then
				{
					_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
					if (getNumber (_weapon >> "scope") == 2 and getText(_weapon >> "picture") != "" and !(configName(inheritsFrom(_weapon)) in _key_colors)) then
					{
						_wpn_type = configName _weapon;
						weapons_list set [count weapons_list, _wpn_type];
					};
				};
			};
		};
		if (isNil "magazines_list") then
		{
			magazines_list = [];
			_cfgmagazines = configFile >> 'cfgMagazines';
			for "_i" from 0 to (count _cfgmagazines)-1 do
			{
				_magazine = _cfgmagazines select _i;
				if (isClass _magazine) then
				{
					if (getNumber (_magazine >> "scope") == 2 and getText(_magazine >> "picture") != "") then
					{
						_mag_type = configName _magazine;
						magazines_list set [count magazines_list, _mag_type];
					};
				};
			};
		};
		_classname = "USOrdnanceBox";
		EAT_CrateSetup;
		{
			if(_x != "MeleeBaseBallBat") then{
			_spawnCrate addWeaponCargoGlobal [_x, 5];
			};
		} forEach weapons_list;

		{
			if(_x != "AngelCookies") then{
				_spawnCrate addMagazineCargoGlobal [_x, 20];
			};
		} forEach magazines_list;
	};
	if (_crate == "Backpack") exitWith {
		_classname = "TentStorage";
		EAT_CrateSetup;
		// Add gear
		{_spawnCrate addBackpackCargoGlobal _x;}forEach EAT_backpackCrateContents;
	};
	if (_crate == "Building") exitWith {
		_classname = "USOrdnanceBox";
		EAT_CrateSetup;
		// Add gear
		{_spawnCrate addWeaponCargoGlobal _x;}forEach EAT_buildingCrateWeapons;
		{_spawnCrate addMagazineCargoGlobal _x;}forEach EAT_buildingCrateMagazines;
		_spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
	};
	if (_crate == "Items") exitWith {
		_classname = "USOrdnanceBox";
		EAT_CrateSetup;
		// Add gear
		{_spawnCrate addWeaponCargoGlobal _x;}forEach EAT_itemCrateWeapons;
		{_spawnCrate addMagazineCargoGlobal _x;}forEach EAT_itemCrateMagazines;
		_spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
	};
	if (_crate == "EpochWeapons") exitWith {
		_classname = "USOrdnanceBox";
		EAT_CrateSetup;
		// Add gear
		{_spawnCrate addWeaponCargoGlobal _x;}forEach EAT_weaponCrateWeapons;
		{_spawnCrate addMagazineCargoGlobal _x;}forEach EAT_weaponCrateMagazines;
		_spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
	};
};

if (_selectDelay != 0) then {
uiSleep _selectDelay;
deletevehicle _spawnCrate;
};