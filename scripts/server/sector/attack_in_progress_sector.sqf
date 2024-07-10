params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ];

//variable added by storm. added value is despawn timer


sleep 5;

_ownership = [ markerpos _sector ] call KPLIB_fnc_getSectorOwnership;
if ( _ownership != GRLIB_side_enemy ) exitWith {};





// storm commented this out to buff blufor defense squads.

//_squad_type = blufor_squad_inf_light;
//if ( _sector in sectors_military ) then {
//    _squad_type = blufor_squad_inf;
//};


// By making _squad_type an array we can take advantage of the forEach below. 
// It should scale automatically and set combat

_squad_type = [blufor_squad_at, blufor_squad_aa];


//GRLIB_blufor_defenders is a mission parameter set by end user
if ( GRLIB_blufor_defenders ) then {
    _grp = creategroup [GRLIB_side_friendly, true];
    {
        {
            [_x, markerPos _sector, _grp] call KPLIB_fnc_createManagedUnit;
        } foreach _x; 
    } foreach _squad_type;
    sleep 3;
    _grp setBehaviour "COMBAT";
};


_ownership = [ markerpos _sector ] call KPLIB_fnc_getSectorOwnership;


//commented out by storm to revise defenders

//if ( _ownership == GRLIB_side_friendly ) exitWith {
//    if ( GRLIB_blufor_defenders ) then {
//        {
//            //if ( alive _x ) then { deleteVehicle _x };
//            if ( time < _future) exitWith{};
//            if ( alive _x) then { deleteVehicle _x };
//        } foreach units _grp;
//    };
//};


[_sector, 1] remoteExec ["remote_call_sector"];
_attacktime = GRLIB_vulnerability_timer;



while { _attacktime > 0 && ( _ownership == GRLIB_side_enemy || _ownership == GRLIB_side_resistance ) } do {
    _ownership = [markerpos _sector] call KPLIB_fnc_getSectorOwnership;
    _attacktime = _attacktime - 1;
    sleep 1;
};

waitUntil {
    sleep 1;
    [markerpos _sector] call KPLIB_fnc_getSectorOwnership != GRLIB_side_resistance;
};


//this code is used when the sector timer reaches 0. At this point the sector list is updated and factories removed from player logistics.
if ( GRLIB_endgame == 0 ) then {
    if ( _attacktime <= 1 && ( [markerpos _sector] call KPLIB_fnc_getSectorOwnership == GRLIB_side_enemy ) ) then {
        blufor_sectors = blufor_sectors - [ _sector ];
        publicVariable "blufor_sectors";
        [_sector, 2] remoteExec ["remote_call_sector"];
        reset_battlegroups_ai = true;
        [] spawn KPLIB_fnc_doSave;
        stats_sectors_lost = stats_sectors_lost + 1;
        {
            if (_sector in _x) exitWith {
                if ((count (_x select 3)) == 3) then {
                    {
                        detach _x;
                        deleteVehicle _x;
                    } forEach (attachedObjects ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0));

                    deleteVehicle ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0);
                };
                KP_liberation_production = KP_liberation_production - [_x];
            };
        } forEach KP_liberation_production;
    } else {
        [_sector, 3] remoteExec ["remote_call_sector"];
        {[_x] spawn prisonner_ai;} foreach (((markerpos _sector) nearEntities ["Man", GRLIB_capture_size * 0.8]) select {side group _x == GRLIB_side_enemy});
    };
};

sleep 300;

if ( GRLIB_blufor_defenders ) then {
    {
        //if ( time < _future ) then { waitUntil { time >= _future }; };
        if ( alive _x ) then 
        { 
            deleteVehicle _x 
        };
    } foreach units _grp;
};
