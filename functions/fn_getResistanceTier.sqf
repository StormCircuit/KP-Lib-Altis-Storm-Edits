/*
    File: fn_getResistanceTier.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2019-12-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the current tier level of the resistance forces.

    Parameter(s):
        NONE

    Returns:
        Tier level [NUMBER]
*/

//storm's edit: KP_liberation_guerilla_strength appears to be a vestigial variable left
// all over the code base. KP_liberation_civ_rep is the value listed in the UI.

switch (true) do {
    case (abs (KP_liberation_civ_rep) >= KP_liberation_resistance_tier3): {3};
    case (abs (KP_liberation_civ_rep) >= KP_liberation_resistance_tier2): {2};
    default {1};
};
