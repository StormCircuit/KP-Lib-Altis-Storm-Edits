/*
    Needed Mods:
    - None

    Optional Mods:
    - BWMod
    - RHSUSAF
    - F-15C
    - F/A-18
    - CUP Weapons
    - CUP Vehicles
    - USAF Main Pack
    - USAF Fighters Pack
    - USAF Utility Pack
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy";                                // This is the FOB as a vehicle.
Arsenal_typename = "B_supplyCrate_F";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy";    // This is the mobile respawn (and medical) truck.
huron_typename = "B_Heli_Transport_03_unarmed_F";                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "rhsusf_army_ocp_combatcrewman";                    // This defines the crew for vehicles.
pilot_classname = "rhsusf_airforce_jetpilot";                           // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "B_Heli_Light_01_F";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "B_Boat_Transport_01_F";                 // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "B_Truck_01_transport_F";               // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_sand_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_sand_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_tan_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "B_Radar_System_01_F";             // The building defined to unlock FOB air vehicle functionality.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";             // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                       // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";                      // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                     // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
    ["rhsusf_army_ocp_riflemanl",1,0,0],                                // Rifleman (Light)
    ["rhsusf_army_ocp_riflemanat",5,0,0],                               // Rifleman (AT)
    ["rhsusf_army_ocp_rifleman",20,0,0],                                // Rifleman
    ["rhsusf_army_ocp_grenadier",25,0,0],                               // Grenadier
    ["rhsusf_army_ocp_autorifleman",25,0,0],                            // Autorifleman
    ["rhsusf_army_ocp_machinegunner",35,0,0],                           // Heavygunner
    ["rhsusf_army_ocp_marksman",30,0,0],                                // Marksman
    ["rhsusf_army_ocp_javelin",50,10,0],                                // AT Specialist
    ["rhsusf_army_ocp_aa",50,10,0],                                     // AA Specialist
    ["rhsusf_army_ocp_medic",30,0,0],                                   // Combat Life Saver
    ["rhsusf_army_ocp_engineer",30,0,0],                                // Engineer
    ["rhsusf_army_ocp_explosives",30,0,0],                              // Explosives Specialist
    ["rhsusf_usmc_recon_marpat_d_rifleman",20,0,0],                     // Recon Rifleman
    ["rhsusf_usmc_recon_marpat_d_rifleman_at",30,0,0],                  // Recon Rifleman (AT)
    ["rhsusf_usmc_recon_marpat_d_machinegunner_m249",25,0,0],           // Recon Autorifleman
    ["rhsusf_usmc_recon_marpat_d_machinegunner",35,0,0],                // Recon Machine Gunner
    ["rhsusf_usmc_recon_marpat_d_marksman",30,0,0],                     // Recon Marksman
    ["rhsusf_usmc_recon_marpat_d_sniper_M107",70,5,0],                  // Recon Sniper (M107)
    ["rhsusf_army_ocp_sniper",70,5,0],                                  // Sniper
    ["rhsusf_army_ocp_sniper_m107",70,5,0],                             // Sniper (M107)
    ["rhsusf_army_ocp_sniper_m24sws",70,5,0],                           // Sniper (M24 SWS)
    ["rhsusf_army_ocp_combatcrewman",10,0,0],                           // Crewman
    ["rhsusf_army_ocp_rifleman_101st",20,0,0],                          // Para Trooper
    ["rhsusf_army_ocp_helicrew",10,0,0],                                // Helicopter Crew
    ["rhsusf_army_ocp_helipilot",10,0,0],                               // Helicopter Pilot
    ["rhsusf_airforce_jetpilot",10,0,0]                                 // Pilot
];

light_vehicles = [
    ["C_Kart_01_F",0,0,0],                                        		// Pity kart added by Storm
	["US85_M1030",5,0,5],												// CSLA Motorcycle added by Storm    
    ["B_Quadbike_01_F",10,0,10],                                        // Quad Bike modified by Storm
    ["B_LSV_01_unarmed_F",20,0,10],                                     // Prowler
    ["B_LSV_01_AT_F",75,60,50],                                         // Prowler (AT)
    ["B_ION_APC_Wheeled_02_hmg_lxWS",200,20,50],                        // Marid M2 by Storm from WS
    ["B_MRAP_01_F",100,0,50],                                           // Hunter
    ["B_MRAP_01_hmg_F",100,40,50],                                      // Hunter (HMG)
    ["B_MRAP_01_gmg_F",100,60,50],                                      // Hunter (GMG)
    ["I_MRAP_03_F",100,0,50],                                           // Strider
    ["I_MRAP_03_hmg_F",100,40,50],                                      // Strider (HMG)
    ["I_MRAP_03_gmg_F",100,60,50],                                      // Strider (GMG)
    ["rhsusf_m1025_w",100,0,50],                                        // M1025A2
    ["rhsusf_m1025_w_m2",100,40,50],                                    // M1025A2 (M2)
    ["rhsusf_m1025_w_mk19",100,60,50],                                  // M1025A2 (Mk19)
    ["rhsusf_m998_w_2dr_fulltop",100,0,50],                             // M1097A2 (2D)
    ["rhsusf_m998_w_2dr_halftop",100,0,50],                             // M1097A2 (2D / open back)
    ["rhsusf_M1220_usarmy_wd",120,0,60],                                // M1220
    ["rhsusf_M1220_M2_usarmy_wd",120,40,60],                            // M1220 (M2)
    ["rhsusf_M1220_MK19_usarmy_wd",120,60,60],                          // M1220 (Mk19)
    ["rhsusf_M1232_usarmy_wd",140,0,60],                                // M1220
    ["rhsusf_M1232_M2_usarmy_wd",140,40,60],                            // M1220 (M2)
    ["rhsusf_M1232_MK19_usarmy_wd",140,60,60],                          // M1220 (Mk19)
    ["BWA3_Eagle_Fleck",100,0,50],                                      // Eagle IV
    ["BWA3_Eagle_FLW100_Fleck",100,100,50],                             // Eagle IV (FLW 100)
    ["rhsusf_M1230a1_usarmy_wd",120,0,60],                              // M1230A1 (MEDEVAC)
    ["B_Truck_01_transport_F",125,0,75],                                // HEMTT Transport
    ["B_Truck_01_covered_F",125,0,75],                                  // HEMTT Transport (Covered)
    ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy",125,0,75],                  // M1083A1P2 Transport
    ["rhsusf_M1083A1P2_wd_fmtv_usarmy",125,0,75],                       // M1083A1P2 Transport (Covered)
    ["rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy",100,0,50],               // M1083A1P2
    ["rhsusf_M977A4_BKIT_usarmy_wd",125,0,75],                          // M977A4 BKIT
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd",125,40,75],                      // M977A4 BKIT (HMG)
    ["rhsusf_M1117_W",150,50,50],                                       // M1117 ASV
    ["B_UGV_01_F",150,0,50],                                            // UGV Stomper
    ["B_UGV_01_rcws_F",150,40,50],                                      // UGV Stomper (RCWS)
    ["B_Boat_Transport_01_F",100,0,25],                                 // Assault Boat
    ["B_Boat_Armed_01_minigun_F",200,80,75],                            // Speedboat Minigun
    ["rhsusf_mkvsoc",250,200,100],                                      // Mk.V SOCOM
    ["B_SDV_01_F",150,0,50]                                             // SDV
];

heavy_vehicles = [
    ["rhsusf_m113_usarmy",200,40,100],                                  // M113A3 (M2)
    ["rhsusf_m113_usarmy_MK19",200,60,100],                             // M113A3 (Mk19)
    ["rhsusf_m113_usarmy_medical",200,0,100],                           // M113A3 (Medical)
    ["rhsusf_stryker_m1126_mk19_d",200,100,100],                        // Stryker Mk19 variant added by Storm
    ["rhsusf_stryker_m1126_m2_d",200,100,100],                        	// Stryker m2 variant added by Storm
    ["B_APC_Wheeled_01_cannon_F",200,75,125],                           // AMV-7 Marshall
    ["B_APC_Wheeled_01_atgm_lxWS",200,75,125],                          // AMV-7 Marshall ATGM by storm
    ["B_APC_Wheeled_01_mortar_lxWS",200,75,125],                        // AMV-7 Marshall Mortar by storm
    ["US85_LAV25",200,75,125],                        					// LAV25 from CSLA by Storm
    ["O_APC_Wheeled_02_rcws_v2_F",150,100,125],                         // Marid
    ["I_APC_Wheeled_03_cannon_F",200,75,125],                           // AFV-4 Gorgon
    ["B_APC_Tracked_01_rcws_F",300,100,150],                            // IFV-6c Panther
    ["I_APC_tracked_03_cannon_F",300,150,150],                          // FV-720 Mora
    ["RHS_M2A3_BUSKIII",300,200,150],                                   // M2A3 bradley by storm
    ["BWA3_Puma_Fleck",300,225,150],                                    // IFV Puma
    ["RHS_M2A3_BUSKIII_wd",300,250,175],                                // M2A3 (Busk III)
    ["B_APC_Tracked_01_AA_F",300,250,175],                              // IFV-6a Cheetah
    ["O_APC_Tracked_02_cannon_F",200,200,150],                          // Stalker
    ["I_LT_01_AA_F",300,250,175],                                       // AWC 302 Nyx (AA)
    ["I_LT_01_AT_F",300,250,175],                                       // AWC 302 Nyx (AT)
    ["I_LT_01_cannon_F",300,250,175],                                   // AWC 302 Nyx (Cannon)
    ["RHS_M6_wd",300,250,175],                                          // M6A2
    ["B_MBT_01_cannon_F",400,300,200],                                  // M2A1 Slammer
    ["CUP_B_Challenger2_NATO",400,300,200],                             // FV4034 Challenger 2
    ["I_MBT_03_cannon_F",400,300,200],                                  // MBT-52 Kuma
    ["rhsusf_m1a2sep1tuskiid_usarmy",400,350,225],                      // M1A2sep1TUSK by Storm
    ["rhsusf_m1a2sep2d_usarmy",400,350,225],                            // M1A2SEPv2 by Storm
    ["B_MBT_01_TUSK_F",500,350,225],                                    // M2A4 Slammer UP
    ["rhsusf_m1a2sep1tuskiiwd_usarmy",500,400,250],                     // M1A2SEPv1 (Tusk II)
    ["BWA3_Leopard2_Fleck",500,400,250],                                // MBT Leopard 2A6M
    ["B_AFV_Wheeled_01_cannon_F",500,500,250],                          // Rhino MGS
    ["B_AFV_Wheeled_01_up_cannon_F",550,550,250],                       // Rhino MGS UP
    ["B_MBT_01_arty_F",600,1250,300],                                   // M4 Scorcher
    ["rhsusf_m109_usarmy",600,1250,300],                                // M109A6
    ["B_MBT_01_mlrs_F",800,1750,400]                                    // M5 Sandstorm MLRS
];

air_vehicles = [
    ["O_Heli_Attack_02_dynamicLoadout_F",700,400,200],
    ["B_Heli_Light_01_dynamicLoadout_F",200,100,100],                   // AH-9 Pawnee
    ["RHS_MELB_MH6M",200,0,100],                                        // MH-6M Little Bird
    ["RHS_MELB_AH6M",200,200,100],                                      // AH-6M Pawnee
    ["I_Heli_light_03_unarmed_F",225,0,125],                            // WY-55 Hellcat
    ["I_Heli_light_03_dynamicLoadout_F",225,200,125],                   // WY-55 Hellcat (Armed)
    ["RHS_UH1Y_GS",225,200,125],                                        // UH-1Y (Ground Suppression)
    ["B_Heli_Attack_01_dynamicLoadout_F",500,400,200],                  // AH-99 Blackfoot
    ["RHS_AH1Z",500,500,200],                                           // AH-1Z (Multi-Role)
    ["RHS_AH64D_wd",750,750,250],                                       // AH-64D (Multi-Role)
    ["BWA3_Tiger_RMK_Universal",750,750,250],                           // UH Tiger RMK (Universal)
    ["B_Heli_Transport_01_F",250,80,150],                               // UH-80 Ghost Hawk
    ["B_Heli_Transport_01_camo_F",250,80,150],                          // UH-80 Ghost Hawk (Camo)
    ["RHS_UH60M2",250,0,150],                                           // UH-60M (Unarmed)
    ["RHS_UH60M",250,80,150],                                           // UH-60M
    ["RHS_UH60M_MEV2",300,0,150],                                       // UH-60M MEV2
    ["RHS_CH_47F",275,80,175],                                          // CH-47 Chinook (Armed)
    ["I_Heli_Transport_02_F",275,0,175],                                // CH-49 Mohawk
    ["rhsusf_CH53E_USMC",300,0,175],                                    // CH-53E Super Stallion
    ["rhsusf_CH53E_USMC_GAU21_D",300,100,175],                          // CH-53E Super Stallion (GAU-21)
    ["B_Heli_Transport_03_F",300,80,175],                               // CH-67 Huron (Armed)
    ["B_UAV_02_dynamicLoadout_F",400,400,200],                          // MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",450,500,250],                        // MQ-12 Falcon
    ["B_UAV_05_F",500,500,200],                                         // UCAV Sentinel
    ["USAF_RQ4A",500,0,200],                                            // RQ-4A Global Hawk
    ["USAF_MQ9",500,750,200],                                           // MQ-9 Reaper
    ["I_Plane_Fighter_03_dynamicLoadout_F",500,400,350],                // A-143 Buzzard
    ["B_Plane_CAS_01_dynamicLoadout_F",1000,800,400],                   // A-164 Wipeout (CAS)
    ["RHS_A10",1000,1000,400],                                          // A-10A (CAS)
    ["USAF_A10",1500,1000,400],                                         // A-10C Thunderbolt II
    ["I_Plane_Fighter_04_F",1000,1200,400],                             // A-149 Gryphon
    ["FIR_F15C",1250,1250,450],                                         // F-15C Eagle
    ["FIR_F15D",1250,1250,450],                                         // F-15D Eagle
    ["FIR_F15E",1250,1500,450],                                         // F-15E Strike Eagle
    ["JS_JC_FA18E",1500,1750,450],                                      // F/A-18 E Super Hornet
    ["JS_JC_FA18F",1500,1750,450],                                      // F/A-18 F Super Hornet
    ["USAF_F22",1800,2000,500],                                         // F-22A Raptor
    ["USAF_F22_EWP_AA",1800,2100,500],                                  // F-22A Raptor (EWP-AA)
    ["USAF_F22_EWP_AG",1800,2100,500],                                  // F-22A Raptor (EWP-AG)
    ["USAF_F22_Heavy",1800,2250,500],                                   // F-22A Raptor (Heavy)
    ["USAF_F35A_STEALTH",2250,2000,750],                                // F-35A Lightning II
    ["USAF_F35A",2250,2250,750],                                        // F-35A Lightning II (Heavy)
    ["B_Plane_Fighter_01_F",1500,1750,450],                             // F/A-181 Black Wasp II
    ["B_Plane_Fighter_01_Stealth_F",1500,1750,450],                     // F/A-181 Black Wasp II (Stealth)
    ["B_T_VTOL_01_armed_F",750,1500,500],                               // V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",750,0,500],                               // V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",750,0,500]                                 // V-44 X Blackfish (Vehicle)
];

static_vehicles = [
    ["B_Mortar_01_F",0,0,0],                                            // Nato MK6 mortar
    ["B_TwinMortar_RF",1000,1000,500],                                  // Reaction Forced Twin Mortar
    ["RHS_TOW_TriPod_D",0,0,0],                                  	    // RHS TOW by Storm
    ["RHS_Stinger_AA_pod_D",50,100,0],                                  // RHS Stinger pod by Storm
    ["RHS_M119_WD",100,200,0],                                          // M119A2 howitzer added by Storm
    ["B_SAM_System_03_F",1000,1000,500]                                 // MIM-145 Defender
];

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
    ["Flag_UK_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["Campfire_burning_F",0,0,0],										// burning campfire added by Storm
    ["CamoNet_BLUFOR_F",0,0,0],
    ["CamoNet_BLUFOR_open_F",0,0,0],
    ["CamoNet_BLUFOR_big_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_LampSolar_F",0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_LampStreet_small_F",0,0,0],
    ["Land_LampAirport_F",0,0,0],
    ["Land_HelipadCircle_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["Land_HelipadRescue_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
    ["PortableHelipadLight_01_red_F",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingChair_V2_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["MapBoard_altis_F",0,0,0],
    ["MapBoard_stratis_F",0,0,0],
    ["MapBoard_seismic_F",0,0,0],
    ["Land_Pallet_MilBoxes_F",0,0,0],
    ["Land_PaperBox_open_empty_F",0,0,0],
    ["Land_PaperBox_open_full_F",0,0,0],
    ["Land_PaperBox_closed_F",0,0,0],
    ["Land_DieselGroundPowerUnit_01_F",0,0,0],
    ["Land_ToolTrolley_02_F",0,0,0],
    ["Land_WeldingTrolley_01_F",0,0,0],
    ["Land_Workbench_01_F",0,0,0],
    ["Land_GasTank_01_blue_F",0,0,0],
    ["Land_GasTank_01_khaki_F",0,0,0],
    ["Land_GasTank_01_yellow_F",0,0,0],
    ["Land_GasTank_02_F",0,0,0],
    ["Land_BarrelWater_F",0,0,0],
    ["Land_BarrelWater_grey_F",0,0,0],
    ["Land_WaterBarrel_F",0,0,0],
    ["Land_WaterTank_F",0,0,0],
    ["Target_PopUp_Moving_90deg_Acc2_F",0,0,0], 							// begin targets added by Storm
    ["Target_PopUp_Moving_90deg_Acc1_F",0,0,0],
    ["Land_Wreck_Offroad_F",0,0,0],
    ["Target_PopUp_Moving_90deg_Acc1_F",0,0,0],
    ["Rusty_Wreck_Ural_F",0,0,0],											// end added by storm
    ["Land_BagFence_Round_F",0,0,0],
    ["Land_BagFence_Short_F",0,0,0],
    ["Land_BagFence_Long_F",0,0,0],
    ["Land_BagFence_Corner_F",0,0,0],
    ["Land_BagFence_End_F",0,0,0],
    ["Land_BagBunker_Small_F",0,0,0],
    ["Land_BagBunker_Large_F",0,0,0],
    ["Land_BagBunker_Tower_F",0,0,0],
    ["Land_HBarrier_1_F",0,0,0],
    ["Land_HBarrier_3_F",0,0,0],
    ["Land_HBarrier_5_F",0,0,0],
    ["Land_HBarrier_Big_F",0,0,0],
    ["Land_HBarrierWall4_F",0,0,0],
    ["Land_HBarrierWall6_F",0,0,0],
    ["Land_HBarrierWall_corner_F",0,0,0],
    ["Land_HBarrierWall_corridor_F",0,0,0],
    ["Land_HBarrierTower_F",0,0,0],
    ["Land_CncBarrierMedium_F",0,0,0],
    ["Land_CncBarrierMedium4_F",0,0,0],
    ["Land_Concrete_SmallWall_4m_F",0,0,0],
    ["Land_Concrete_SmallWall_8m_F",0,0,0],
    ["Land_CncShelter_F",0,0,0],
    ["Land_CncWall1_F",0,0,0],
    ["Land_CncWall4_F",0,0,0],
    ["Land_Sign_WarningMilitaryArea_F",0,0,0],
    ["Land_Sign_WarningMilAreaSmall_F",0,0,0],
    ["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
    ["Land_Razorwire_F",0,0,0],
    ["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles = [
    [Arsenal_typename,100,200,0],
    [Respawn_truck_typename,200,0,100],
    [FOB_box_typename,300,500,0],
    [FOB_truck_typename,300,500,75],
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,250,0,0],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_heli_slot_building,250,0,0],
    [KP_liberation_plane_slot_building,500,0,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["CUP_B_TowingTractor_NATO",50,0,25],                               // Towing Tractor
    ["B_APC_Tracked_01_CRV_F",500,250,350],                             // CRV-6e Bobcat
    ["B_Truck_01_Repair_F",325,0,75],                                   // HEMTT Repair
    ["B_Truck_01_fuel_F",125,0,275],                                    // HEMTT Fuel
    ["B_Truck_01_ammo_F",125,200,75],                                   // HEMTT Ammo
    ["rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",325,0,75],                   // M977A4 Repair
    ["rhsusf_M978A4_BKIT_usarmy_wd",125,0,275],                         // M978A4 Fuel
    ["rhsusf_M977A4_AMMO_BKIT_usarmy_wd",125,200,75],                   // M977A4 Ammo
    ["B_Slingload_01_Repair_F",275,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",75,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",75,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
    "rhsusf_army_ocp_teamleader",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_riflemanat",
    "rhsusf_army_ocp_grenadier",
    "rhsusf_army_ocp_autorifleman",
    "rhsusf_army_ocp_autorifleman",
    "rhsusf_army_ocp_marksman",
    "rhsusf_army_ocp_medic",
    "rhsusf_army_ocp_engineer"
];

// Heavy infantry squad.
blufor_squad_inf = [
    "rhsusf_army_ocp_teamleader",
    "rhsusf_army_ocp_riflemanat",
    "rhsusf_army_ocp_riflemanat",
    "rhsusf_army_ocp_grenadier",
    "rhsusf_army_ocp_autorifleman",
    "rhsusf_army_ocp_autorifleman",
    "rhsusf_army_ocp_machinegunner",
    "rhsusf_army_ocp_marksman",
    "rhsusf_army_ocp_medic",
    "rhsusf_army_ocp_engineer"
];

// AT specialists squad.
blufor_squad_at = [
    "rhsusf_army_ocp_teamleader",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_javelin",
    "rhsusf_army_ocp_javelin",
    "rhsusf_army_ocp_javelin",
    "rhsusf_army_ocp_medic",
    "rhsusf_army_ocp_rifleman"
];

// AA specialists squad.
blufor_squad_aa = [
    "rhsusf_army_ocp_teamleader",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_rifleman",
    "rhsusf_army_ocp_aa",
    "rhsusf_army_ocp_aa",
    "rhsusf_army_ocp_aa",
    "rhsusf_army_ocp_medic",
    "rhsusf_army_ocp_rifleman"
];

// Force recon squad.
blufor_squad_recon = [
    "rhsusf_usmc_recon_marpat_d_teamleader",
    "rhsusf_usmc_recon_marpat_d_rifleman",
    "rhsusf_usmc_recon_marpat_d_rifleman",
    "rhsusf_usmc_recon_marpat_d_rifleman_at",
    "rhsusf_usmc_recon_marpat_d_autorifleman",
    "rhsusf_usmc_recon_marpat_d_machinegunner",
    "rhsusf_usmc_recon_marpat_d_marksman",
    "rhsusf_usmc_recon_marpat_d_sniper_M107",
    "rhsusf_army_ocp_medic",
    "rhsusf_army_ocp_engineer"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st",
    "rhsusf_army_ocp_rifleman_101st"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
    "rhsusf_mkvsoc",                                                    // Mk.V SOCOM
    "rhsusf_m1a1aim_tuski_wd",                                          // M1A1SA (Tusk I)
    "B_MBT_01_TUSK_F",                                                  // M2A4 Slammer UP
    "rhsusf_m1a2sep1tuskiiwd_usarmy",                                   // M1A2SEPv1 (Tusk II)
    "BWA3_Leopard2_Fleck",                                              // MBT Leopard 2A6M
    "B_MBT_01_arty_F",                                                  // M4 Scorcher
    "rhsusf_m109_usarmy",                                               // M109A6
    "B_MBT_01_mlrs_F",                                                  // M5 Sandstorm MLRS
    "B_Heli_Attack_01_dynamicLoadout_F",                                // AH-99 Blackfoot
    "RHS_AH64D_wd",                                                     // AH-64D (Multi-Role)
    "BWA3_Tiger_RMK_Universal",                                         // UH Tiger RMK (Universal)
    "B_UAV_02_dynamicLoadout_F",                                        // MQ-4A Greyhawk
    "B_T_UAV_03_dynamicLoadout_F",                                      // MQ-12 Falcon
    "B_UAV_05_F",                                                       // UCAV Sentinel
    "B_Plane_CAS_01_dynamicLoadout_F",                                  // A-164 Wipeout (CAS)
    "I_Plane_Fighter_04_F",                                             // A-149 Gryphon
    "RHS_A10",                                                          // A-10A (CAS)
    "USAF_MQ9",                                                         // MQ-9 Reaper
    "USAF_A10",                                                         // A-10C Thunderbolt II
    "USAF_F22",                                                         // F-22A Raptor
    "USAF_F22_EWP_AA",                                                  // F-22A Raptor (EWP-AA)
    "USAF_F22_EWP_AG",                                                  // F-22A Raptor (EWP-AG)
    "USAF_F22_Heavy",                                                   // F-22A Raptor (Heavy)
    "USAF_F35A_STEALTH",                                                // F-35A Lightning II
    "USAF_F35A",                                                        // F-35A Lightning II (Heavy)
    "FIR_F15C",                                                         // F-15C Eagle
    "FIR_F15D",                                                         // F-15D Eagle
    "FIR_F15E",                                                         // F-15E Strike Eagle
    "JS_JC_FA18E",                                                      // F/A-18 E Super Hornet
    "JS_JC_FA18F",                                                      // F/A-18 F Super Hornet
    "B_Plane_Fighter_01_F",                                             // F/A-181 Black Wasp II
    "B_Plane_Fighter_01_Stealth_F",                                     // F/A-181 Black Wasp II (Stealth)
    "B_T_VTOL_01_armed_F"                                               // V-44 X Blackfish (Armed)
];
