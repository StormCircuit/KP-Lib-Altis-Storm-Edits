/*
    Specific object init codes depending on classnames.

    Format:
    [
        Array of classnames as strings <ARRAY>,
        Code to apply <CODE>,
        Allow inheritance <BOOL> (default false)
    ]
    _this is the reference to the object with the classname

    Example:
        KPLIB_objectInits = [
            [
                ["O_soldierU_F"],
                {systemChat "CSAT urban soldier was spawned!"}
            ],
            [
                ["CAManBase"],
                {systemChat format ["Some human named '%1' was spawned!", name _this]},
                true
            ]
        ];
*/

KPLIB_objectInits = [
    // Set KP logo on white flag
    [
        ["Flag_White_F"],
        {_this setFlagTexture "res\flag_kp_co.paa";}
    ],

    // Add helipads to zeus, as they can't be recycled after built
    [
        ["Helipad_base_F", "LAND_uns_Heli_pad", "Helipad", "LAND_uns_evac_pad", "LAND_uns_Heli_H"],
        {{[_x, [[_this], true]] remoteExecCall ["addCuratorEditableObjects", 2]} forEach allCurators;},
        true
    ],

    // Add ViV and build action to FOB box/truck
    [
        [FOB_box_typename, FOB_truck_typename],
        {
            [_this] spawn {
                params ["_fobBox"];
                waitUntil {sleep 0.1; time > 0};
                [_fobBox] call KPLIB_fnc_setFobMass;
                if ((typeOf _fobBox) isEqualTo FOB_box_typename) then {
                    [_fobBox] call KPLIB_fnc_setFobMass;
                    [_fobBox] remoteExecCall ["KPLIB_fnc_setLoadableViV", 0, _fobBox];
                };
                [_fobBox] remoteExecCall ["KPLIB_fnc_addActionsFob", 0, _fobBox];
            };
        }
    ],

    // Add FOB building damage handler override and repack action
    [
        [FOB_typename],
        {
            _this addEventHandler ["HandleDamage", {0}];
            [_this] spawn {
                params ["_fob"];
                waitUntil {sleep 0.1; time > 0};
                [_fob] remoteExecCall ["KPLIB_fnc_addActionsFob", 0, _fob];
            };
        }
    ],

    // Add ViV action to Arsenal crate
    [
        [Arsenal_typename],
        {
            [_this] spawn {
                params ["_arsenal"];
                waitUntil {sleep 0.1; time > 0};
                [_arsenal] remoteExecCall ["KPLIB_fnc_setLoadableViV", 0, _arsenal];
            };
        }
    ],

    // Add storage type variable to built storage areas (only for FOB built/loaded ones)
    [
        [KP_liberation_small_storage_building, KP_liberation_large_storage_building],
        {_this setVariable ["KP_liberation_storage_type", 0, true];}
    ],

    // Add ACE variables to corresponding building types
    [
        [KP_liberation_recycle_building],
        {_this setVariable ["ace_isRepairFacility", 1, true];}
    ],
    [
        KP_liberation_medical_facilities,
        {_this setVariable ["ace_medical_isMedicalFacility", true, true];}
    ],
    [
        KP_liberation_medical_vehicles,
        {_this setVariable ["ace_medical_isMedicalVehicle", true, true];}
    ],

    // Hide Cover on big GM trucks
    [
        ["gm_ge_army_kat1_454_cargo", "gm_ge_army_kat1_454_cargo_win"],
        {_this animateSource ["cover_unhide", 0, true];}
    ],

    // Make sure a slingloaded object is local to the helicopter pilot (avoid desync and rope break)
    [
        ["Helicopter"],
        {if (isServer) then {[_this] call KPLIB_fnc_addRopeAttachEh;} else {[_this] remoteExecCall ["KPLIB_fnc_addRopeAttachEh", 2];};},
        true
    ],

    // Add valid vehicles to support module, if system is enabled
    [
        KP_liberation_suppMod_artyVeh,
        {if (KP_liberation_suppMod > 0) then {KPLIB_suppMod_arty synchronizeObjectsAdd [_this];};}
    ],

    // Disable autocombat (if set in parameters) and fleeing
    [
        ["Man"],
        {
            if (!(GRLIB_autodanger) && {(side _this) isEqualTo GRLIB_side_friendly}) then {
                _this disableAI "AUTOCOMBAT";
            };
            _this allowFleeing 0;
        },
        true
    ],
	
	// custom code added by Storm below
	// based on ColinM's radar fix
	// Switch on AA radars also makes radars rotate, thanks to LEGION and UD1E from Arma 3 Scripts discord!!
	[
		["B_Radar_System_01_F"],
		{
			
			_this setVehicleRadar 1;
			
			[_this] spawn {
				params ["_obj"];
				while {true} do {
					{
						_obj lookAt (_obj getRelPos [100, _x]);
						sleep 2.45;
					} forEach [120, 240, 0];
				};
			};
		}
	],
	
	// Give sam sites infinite reloads with a 300 second cooldown
	[
		["B_SAM_System_03_F","O_SAM_System_04_F"],
		{
            [_this] spawn {
				params ["_obj"];
                _obj addEventHandler ["Fired", { 
                    params ["_unit", "", "_muzzle", "", "", "_magazine"]; 
                    if (!local  _unit) exitWith {}; 
    
                    private _ammo = _unit ammo _muzzle; 
    
                    if (_ammo == 0) then {
                        _unit addMagazine _magazine; 
                    };
                }];
            }
		}
	],

	// Lock all SAMS and radars
	[
		["B_Radar_System_01_F", "B_SAM_System_03_F"],
		{
			_this setVehicleLock "LOCKED";
			_this lockDriver true;
			_this lockTurret [[0],true];
		}
	],
	
	// custom code by storm to fix UGV spawns such that they are no longer MANNED Ground Vehicles 
	// AKA removes the previous dudes and fills it with unmanned AI.
	[
		["B_UGV_01_F", "B_UGV_01_rcws_F", "B_T_UGV_01_olive_F", "B_T_UGV_01_rcws_olive_F", "B_D_UGV_01_rcws_lxWS", "B_D_UGV_01_lxWS", "O_UGV_01_F", "O_UGV_01_rcws_F", "O_T_UGV_01_ghex_F", "O_T_UGV_01_rcws_ghex_F"],
		{

            //spawn a separate thread for each UGV, if its within 30 seconds of server start
            //set them to friendly side otherwise they must be on enemy side
        	[_this, GRLIB_side_friendly] spawn {
				params ["_obj","_sideFriendly"];
                //delete the crew of the UGV since they spawn as normal AI and do not work
                { _obj deleteVehicleCrew _x } forEach crew _obj;
                createVehicleCrew _obj;

                //check time since server start, if within 30 secs then set them friendly
                //otherwise they are spawned as an enemy, so set them to enemy
                if (time < 5) then {
                    crew _obj joinSilent createGroup _sideFriendly;
                }
			};
		}
	],
	
	//Set pilot AI to fly at 800m ASL, if not using this they will attempt to maintain their height whatever they spawned at
	//(this is not a good thing). Trying 700m. (standardAltitude, combatAltitude, stealthAltitude]). They may still have problems with SAMs
	[
		opfor_air,
		{
			_this flyInHeightASL [700, 700, 700];
		}
	],

    //set the CAP to come in low so they avoid SAM sites
    [
		opfor_CAP,
		{
			_this flyInHeightASL [200, 200, 200];
		}
	],

    //set Kajmans to spawn with SR Anti Air missile racks (2 each)
	[
		["O_Heli_Attack_02_dynamicLoadout_F"],
		{
            _this setPylonLoadout ["PylonLeft2", "PylonRack_1Rnd_Missile_AA_03_F", true, [-1]];
            _this setPylonLoadout ["PylonRight2", "PylonRack_1Rnd_Missile_AA_03_F", true, [-1]];
		}
	],

    //give AT specialists Titans, remove their RPGs
    [
        ["rhs_msv_emr_at"],
        {
            _this removeWeapon "rhs_weap_rpg7";
            _this removeMagazine "rhs_rpg7_pg7vl_mag";
            _this removeMagazine "rhs_rpg7_pg7vr_mag";
            removeBackpack _this;

            _this addBackpack "B_Carryall_oli";
            _this addWeapon "launch_B_Titan_short_tna_F";
            _this addMagazine "Titan_AT";
            unitbackpack _this addMagazineCargoGlobal ["Titan_AT", 3];
        }
    ],

	//disable FOB crate and building damage. I would just disable fall damage but not an easy thing to do.
	[
		["B_Slingload_01_Cargo_F", "Land_Pod_Heli_Transport_04_box_F", "Land_Cargo_HQ_V1_F","Land_Cargo_House_V1_F","Land_Cargo_Tower_V1_F","Land_Cargo_Patrol_V1_F"],
		{
			_this allowDamage false;
		}
	]
];
