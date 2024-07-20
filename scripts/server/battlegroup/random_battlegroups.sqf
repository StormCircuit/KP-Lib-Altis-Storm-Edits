
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

/*
switch (GRLIB_csat_aggressivity) do {
    case 0: {GRLIB_csat_aggressivity = 0.25;};
    case 1: {GRLIB_csat_aggressivity = 0.5;};
    case 2: {GRLIB_csat_aggressivity = 1;};
    case 3: {GRLIB_csat_aggressivity = 2;};
    case 4: {GRLIB_csat_aggressivity = 4;};
    default {GRLIB_csat_aggressivity = 1;};
};
*/


sleep (5);
private _sleeptime = 0;
while {GRLIB_csat_aggressivity > 0.9 && GRLIB_endgame == 0} do {
    
    //storms edit: changed _sleeptime to be ~20 mins (max aggression setting) to 2+ hours
    // if aggresion is >= 90 then minimum is 6 minutes. Every spawn reduces readiness.
    _sleeptime =  (1800 + (random 1800)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);
    
    // debug sleep time setting
    //_sleeptime = 10;

    //Note, these are cumulative so you can be SLAMMED with random battlegroups should
    // your readiness be very high
    if (combat_readiness >= 40) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 50) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 75) then {_sleeptime = _sleeptime * 0.75;};
    if (combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75;};

    sleep _sleeptime;



    //place a minimum delay between battlegroups
    // By default this is 30 mins at normal. See aggressivity at top of file for reference
    if (!isNil "GRLIB_last_battlegroup_time") then {
        waitUntil {
            sleep 5;
            diag_tickTime > (GRLIB_last_battlegroup_time + (900 / GRLIB_csat_aggressivity))
        };
    };


    if (
        //storm edits: changed combat readiness check. Normal lets them spawn with 40 aggressivity
        combat_readiness >= (60 - (20 * GRLIB_csat_aggressivity))
        && [] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap
        && diag_fps > 15.0
    ) then {
        //if combat readiness above 30 then do vehicle rush else do infantry
        // this should help provide the sense of an active warzone for vehicle players
        // that otherwise slaughter infantry only
        ["", if (combat_readiness >= 30) then {false} else {true}] spawn spawn_battlegroup;
    };
};
