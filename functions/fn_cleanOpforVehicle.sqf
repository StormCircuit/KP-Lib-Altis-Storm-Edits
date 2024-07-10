/*
    File: fn_cleanOpforVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-04-20
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Deletes given vehicle, if not an opfor vehicle captured by players.

    Parameter(s):
        _veh - Vehicle to delete if not captured [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_veh", objNull, [objNull]]
];

if (isNull _veh) exitWith {["Null object given"] call BIS_fnc_error; false};

//note by storm: check if crew is on GRLIB_side_friendly side. This is mostly for UAV/UGVs.
if !((_veh getVariable ["KPLIB_captured", false]) || (side _veh == GRLIB_side_friendly)) then {
    deleteVehicle _veh;
};

true
