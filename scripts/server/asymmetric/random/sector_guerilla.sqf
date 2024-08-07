params ["_sector"];

if (KP_liberation_asymmetric_debug > 0) then {[format ["Sector %1 (%2) - sector_guerilla spawned on: %3", (markerText _sector), _sector, debug_source], "ASYMMETRIC"] remoteExecCall ["KPLIB_fnc_log", 2];};

private _startpos = (markerPos _sector) getPos [(1200 + (round (random 400))), (random 360)];

while {(([_startpos, 500, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount) > 0) || (surfaceIsWater _startpos)} do {
    _startpos = (markerPos _sector) getPos [(1200 + (round (random 400))), (random 360)];
};

private _incDir = (markerPos _sector) getDir _startpos;

// storm's edit: removed direction from guerilla message
private _incString = "nearby area";

//private _incString = "unknown";

/*
if (_incDir < 23) then {
    _incString = "N";
} else {
    if (_incDir < 68) then {
        _incString = "NE";
    } else {
        if (_incDir < 113) then {
            _incString = "E";
        } else {
            if (_incDir < 158) then {
                _incString = "SE";
            } else {
                if (_incDir < 203) then {
                    _incString = "S";
                } else {
                    if (_incDir < 248) then {
                        _incString = "SW";
                    } else {
                        if (_incDir < 293) then {
                            _incString = "W";
                        } else {
                            if (_incDir < 338) then {
                                _incString = "NW";
                            } else {
                                _incString = "N";
                            };
                        };
                    };
                };
            };
        };
    };
};

*/

[5, [(markerText _sector), _incString]] remoteExec ["KPLIB_fnc_crGlobalMsg"];

private _spawnedGroups = [];
private _grp = [_startpos] call KPLIB_fnc_spawnGuerillaGroup;

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
{_x doFollow (leader _grp)} forEach (units _grp);

private _waypoint = _grp addWaypoint [markerpos _sector, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 30;
_waypoint = _grp addWaypoint [markerpos _sector, 200];
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [markerpos _sector, 200];
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [markerpos _sector, 200];
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [markerpos _sector, 200];
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointType "CYCLE";

_spawnedGroups pushBack _grp;

sleep 10;

//storm's edit: added check for tier 3 resistance to make vehicle spawns more sensible
// 'if (1 in 2 chance) and resistance tier 3 and guerilla vic array not empty'
if (((random 100) >= 50) && [] call KPLIB_fnc_getResistanceTier >= 3 &&!(KP_liberation_guerilla_vehicles isEqualTo [])) then {
    private _vehicle = (selectRandom KP_liberation_guerilla_vehicles) createVehicle _startpos;
    
    //hint str (_vehicle);

    [_vehicle] call KPLIB_fnc_allowCrewInImmobile;

    private _grp = [_startpos, 2] call KPLIB_fnc_spawnGuerillaGroup;

    //assign as driver and gunner then move them in
    ((units _grp) select 0) assignAsDriver _vehicle;
    ((units _grp) select 1) assignAsGunner _vehicle;

    ((units _grp) select 0) moveInDriver _vehicle;
    ((units _grp) select 1) moveInGunner _vehicle;

    _waypoint = _grp addWaypoint [markerpos _sector, 100];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "YELLOW";
    _waypoint setWaypointCompletionRadius 30;
    _waypoint = _grp addWaypoint [markerpos _sector, 300];
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [markerpos _sector, 300];
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [markerpos _sector, 300];
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [markerpos _sector, 300];
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointType "CYCLE";

    _spawnedGroups pushBack _grp;
};

waitUntil {sleep 60; !(_sector in active_sectors)};

sleep 60;

private _strengthChanged = false;

{
    if (!isNull _x) then {
        {
            if (alive _x) then {
                deleteVehicle _x;
                KP_liberation_guerilla_strength = KP_liberation_guerilla_strength + 2;
                _strengthChanged = true;
            };
        } forEach (units _x);
    };
} forEach _spawnedGroups;

if (!isServer && _strengthChanged) then {
    publicVariableServer "KP_liberation_guerilla_strength";
};

if (KP_liberation_asymmetric_debug > 0) then {[format ["Sector %1 (%2) - sector_guerilla dropped on: %3", (markerText _sector), _sector, debug_source], "ASYMMETRIC"] remoteExecCall ["KPLIB_fnc_log", 2];};
