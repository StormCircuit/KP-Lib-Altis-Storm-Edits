if (isNil "infantry_weight") then {infantry_weight = 33;};
if (isNil "armor_weight") then {armor_weight = 33;};
if (isNil "air_weight") then {air_weight = 33;};

sleep 1800;
private _sleeptime = 0;
private _target_player = objNull;
private _target_pos = "";
while {GRLIB_csat_aggressivity >= 0.5 && GRLIB_endgame == 0} do {
    _sleeptime = (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);

    if (combat_readiness >= 50) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 75) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75;};

    sleep _sleeptime;

    waitUntil {sleep 5;
        combat_readiness >= 70 && {armor_weight >= 50 || air_weight >= 50}
    };

    _target_player = objNull;
    {
        if (
            (armor_weight >= 50 && {(objectParent _x) isKindOf "Tank"})
            || (air_weight >= 50 && {(objectParent _x) isKindOf "Air"})
        ) exitWith {
            _target_player = _x;
        };
    } forEach (allPlayers - entities "HeadlessClient_F");

    // todo add another plane spawn ( 2 planes in flight at once )

    if (!isNull _target_player) then {
        _target_pos = [99999, getPos _target_player] call KPLIB_fnc_getNearestSector;
        if !(_target_pos isEqualTo "") then {
            [_target_pos] spawn spawn_air;
            sleep 5;
            [_target_pos] spawn spawn_air;
        };
    };
};
