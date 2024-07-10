
/*
difficulty modifider param values for reference:
    case 0: {GRLIB_difficulty_modifier = 0.5;};
    case 1: {GRLIB_difficulty_modifier = 0.75;};
    case 2: {GRLIB_difficulty_modifier = 1;};
    case 3: {GRLIB_difficulty_modifier = 1.25;};
    case 4: {GRLIB_difficulty_modifier = 1.5;};
    case 5: {GRLIB_difficulty_modifier = 2;};
    case 6: {GRLIB_difficulty_modifier = 4;};
    case 7: {GRLIB_difficulty_modifier = 10;};
*/


sleep (5);
private _sleeptime = 0;
while {GRLIB_csat_aggressivity > 0.9 && GRLIB_endgame == 0} do {
    
    //storms edit: changed _sleeptime to be ~20 mins (max aggression setting) to 2+ hours
    // if aggresion is >= 90 then minimum is 6 minutes. Every spawn reduces readiness.
    //_sleeptime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);
    
    //_sleeptime = (900 + ((random(1350)/GRLIB_csat_aggressivity)));
    _sleeptime = 1;
    //hint format ["%1", _sleeptime];

    if (combat_readiness >= 80) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 95) then {_sleeptime = _sleeptime * 0.75;};

    sleep _sleeptime;

    if (!isNil "GRLIB_last_battlegroup_time") then {
        waitUntil {
            sleep 5;
            diag_tickTime > (GRLIB_last_battlegroup_time + (2100 / GRLIB_csat_aggressivity))
        };
    };

    if (
        (count (allPlayers - entities "HeadlessClient_F") >= (6 / GRLIB_csat_aggressivity))
        // csat aggressivity is the param value. Normal = 1 so players would need
        //  to get them up to 55 readiness to launch an attack randomly
        //storm edits: changed combat readiness check. Max aggressivity lets them spawn with 20 readiness
        //&& {combat_readiness >= (60 - (5 * GRLIB_csat_aggressivity))}
        && {combat_readiness >= (60 - (10 * GRLIB_csat_aggressivity))}
        && {[] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap}
        && {diag_fps > 15.0}
    ) then {
        ["", (random 100) < 45] spawn spawn_battlegroup;
    };
};
