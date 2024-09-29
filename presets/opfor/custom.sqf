// This is a custom preset made by StormCircuit. It is designed to be a combination of technology available today
// using equipment fought today with technology you can see on the battlefield plus some other frightening shit


// Enemy infantry classes
opfor_officer = "rhs_msv_emr_officer";                                  // Officer
opfor_squad_leader = "rhs_msv_emr_sergeant";                            // Squad Leader
opfor_team_leader = "rhs_msv_emr_at";                                  // Rifleman (LAT)
opfor_sentry = "rhs_msv_emr_aa";                                        // AT Specialist
opfor_rifleman = "rhs_msv_emr_at";                                      // AT Specialist
opfor_rpg = "rhs_msv_emr_at";                                           // AT Specialist
opfor_grenadier = "rhs_msv_emr_grenadier";                              // Grenadier
opfor_machinegunner = "rhs_msv_emr_arifleman";                          // Autorifleman
opfor_heavygunner = "rhs_msv_emr_machinegunner";                        // Heavy Gunner
opfor_marksman = "rhs_msv_emr_marksman";                                // Marksman
opfor_sharpshooter = "rhs_msv_emr_marksman";                            // Sharpshooter
opfor_sniper = "rhs_msv_emr_marksman";                                  // Sniper
opfor_at = "rhs_msv_emr_at";                                            // AT Specialist
opfor_aa = "rhs_msv_emr_aa";                                            // AA Specialist
opfor_medic = "rhs_msv_emr_medic";                                      // Combat Life Saver
opfor_engineer = "rhs_msv_emr_at";                                      // AT Specialist
opfor_paratrooper = "rhs_msv_emr_RShG2";                                // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "rhs_tigr_msv";                                            // GAZ-233011
opfor_mrap_armed = "rhs_tigr_sts_msv";                                  // GAZ-233014 (Armed)
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";                          // Mi-8MT (Cargo)
opfor_transport_truck = "RHS_Ural_MSV_01";                              // Ural-4320 Transport (Covered)
opfor_ammobox_transport = "RHS_Ural_Open_MSV_01";                       // Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";                              // Ural-4320 Fuel
opfor_ammo_truck = "rhs_gaz66_ammo_msv";                                // GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "Flag_CSAT_F";                                       		// Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "rhs_msv_emr_LAT",                                                  // Rifleman (LAT)
    "rhs_msv_emr_aa",                                                   // rifleman AA
    "rhs_msv_emr_aa",                                                   // rifleman AA
    "rhs_msv_emr_arifleman",                                            // Autorifleman
    "rhs_msv_emr_marksman",                                             // Marksman
    "rhs_msv_emr_medic",                                                // Medic
    "rhs_msv_emr_at",                                                   // AT Specialist
    "rhs_msv_emr_at"                                                    // AT Specialist
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders
militia_vehicles = [
    "O_SAM_System_04_F",                                                // CSAT Sam site
    "rhs_2b14_82mm_vmf",                                                // RHS Podnos
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_bmd2m",                                                        // RHS bmd2m
    "O_UGV_01_rcws_F"                                                 	// ugv saif
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
// spawns when readiness above 40
opfor_vehicles = [
    "O_SAM_System_04_F",                                                // CSAT Sam site
    "rhs_2b14_82mm_vmf",                                                // RHS Podnos
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
    "rhs_t90sm_tv",                                                    	// T90SM
    "O_APC_Tracked_02_cannon_F",                                        // BTR Kamysh/Stalker
    "O_UGV_01_rcws_F"                                                 	// ugv saif
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
// spawns when combat readiness below 40
// note: patrols can pick from chopper group below, no need to add them here too
opfor_vehicles_low_intensity = [
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
    "rhs_bmd2m",                                                        // RHS bmd2m
    "O_UGV_01_rcws_F",                                                 	// ugv saif
    "O_UGV_01_rcws_F"                                                 	// ugv saif
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
    "rhs_bmd2m",                                                        // RHS bmd2m   
    "O_Truck_03_covered_F",                                             // Tempest Transport (Covered)
    "O_APC_Tracked_02_cannon_F",                                        // BTR Kamysh/Stalker
    "rhs_t90sm_tv",                                                    	// T90SM
    "O_MBT_04_command_F",                                               // T-140K Angara
    "RHS_Ka52_vvsc",                                                    // Ka-52
    "O_Heli_Attack_02_dynamicLoadout_F"                                 // Mi-48 Kajman
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
// below 50 readiness they spawn these 
opfor_battlegroup_vehicles_low_intensity = [
	"O_APC_Tracked_02_AA_F",											// Tigris from vanilla. Far more adept at CIWS
    "O_Truck_03_covered_F",                                             // Tempest Transport (Covered)
    "rhs_bmd2m",                                                        // RHS bmd2m
    "rhs_t90sm_tv",                                                    	// T90SM
    "O_UGV_01_rcws_F",                                                 	// ugv saif
    "O_Heli_Attack_02_dynamicLoadout_F"                                 // Mi-48 Kajman
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */

opfor_troup_transports = [
    "O_Heli_Light_02_dynamicLoadout_F",                                 // CSAT Kasatka
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_Truck_03_covered_F",                                             // Tempest Transport (Covered)
    "rhs_btr80a_vdv"                                                    // RHS BTR-80a
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "O_Heli_Light_02_dynamicLoadout_F",                                 // CSAT Kasatka    
    "RHS_Ka52_vvsc",                                                    // Ka-52
    "O_Heli_Attack_02_dynamicLoadout_F"                                 // Mi-48 Kajman
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "O_Plane_Fighter_02_Stealth_F"                                     	// To-201 Shikra added by Storm
];

opfor_CAP = [
    "O_Plane_Fighter_02_Stealth_F"                                     	// To-201 Shikra added by Storm
];

// enemy vehicles to ALWAYS spawn at a military outpost
opfor_military_defense = [
    "O_APC_Tracked_02_AA_F",                                            // tigris
    "O_APC_Tracked_02_AA_F",                                            // tigris
    "B_AAA_System_01_F",                                                // CIWS
    "B_AAA_System_01_F",                                                // CIWS
    "rhs_2b14_82mm_vmf",                                                // RHS Podnos
    "O_MBT_04_command_F",                                               // T-140K Angara
    "O_MBT_04_command_F",                                               // T-140K Angara
    "O_SAM_System_04_F"                                                 // CSAT Sam site
];
