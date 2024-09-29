//Script notes:
/*
TODO:
-Possibly add a separate array in preset for CAP planes (CAS planes do not make sense)


*/
private [ "_headless_client" ];
_last_CAP_spawn = 0;
_CAP_living_planes = 0;
_CAP_planes_to_spawn = 0;
_CAP_vehicle_array = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };

//if no units in the opfor_CAP array then exit
if (count opfor_CAP == 0) exitWith {false};

//setup the amount of planes we should spawn
/*
switch (GRLIB_difficulty_modifier) do {
    case 0: {GRLIB_difficulty_modifier = 0.5;};
    case 1: {GRLIB_difficulty_modifier = 0.75;}; 	1
    case 2: {GRLIB_difficulty_modifier = 1;};
    case 3: {GRLIB_difficulty_modifier = 1.25;};
    case 4: {GRLIB_difficulty_modifier = 1.5;}; 	
    case 5: {GRLIB_difficulty_modifier = 2;};		2
    case 6: {GRLIB_difficulty_modifier = 4;}; 		3
    case 7: {GRLIB_difficulty_modifier = 10;}; 		4
*/

if (GRLIB_difficulty_modifier < 1) then {_CAP_planes_to_spawn = 0};
if (GRLIB_difficulty_modifier <= 2) then {_CAP_planes_to_spawn = 2};
if (GRLIB_difficulty_modifier == 4) then {_CAP_planes_to_spawn = 3};
if (GRLIB_difficulty_modifier == 10) then {_CAP_planes_to_spawn = 4};

while { GRLIB_endgame == 0 } do {

	//wait until all the CAP planes are dead before spawning another CAP

	while {_CAP_living_planes > 0} do {
		// sleep to save CPU cycles
		sleep 5;
		//start iterating through array of CAP vehicles
		for "_i" from 0 to (count _CAP_vehicle_array) -1 do {

			//do a check to see if the plane is alive
			// if plane is not alive, delete it and decrement count
			if (!alive (_CAP_vehicle_array select _i)) then {
				_CAP_vehicle_array deleteAt _i;
				_CAP_living_planes = _CAP_living_planes - 1;
			};
			
		}
	};

	//set the next spawn time to 35 minutes plus a random amount of time between 0 and 25 minutes
	_next_spawn_time = _last_CAP_spawn + 2100 + random 1500;
	//_next_spawn_time = _last_CAP_spawn + 10;

	//wait 35 minutes + a random amount up to +25 minutes since last spawn AND 40 air kills 
	// AND 20 minutes has passed since AND combat readiness is >50
	waitUntil {
		sleep 1;
		time > _next_spawn_time && 
		air_weight >= 40 &&
		combat_readiness >= 50;
	};

	//set last spawn time equal to time, all checks have passed and so plane spawn should commence
	_last_CAP_spawn = time;


	//prepare spawnpoint in variables for readability

	//get the enarest blufor sector
	private _objective = [] call KPLIB_fnc_getNearestBluforObjective;

	//select one class of plane to spawn randomly
	private _class = selectRandom opfor_CAP;

	//get the airspawn sector spawn point
	//We sort by ASCEND to get furthest marker
	private _spawnPoint = ([sectors_airspawn, [_objective], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
	
	//get the xyz of the marker
	_spawnPos = markerPos _spawnPoint;

	//set x y to random values close to the marker, set the z to 200 meters
    _spawnPos = [(((_spawnPos select 0) + 500) - random 1000), (((_spawnPos select 1) + 500) - random 1000), 200];
	
	//create the group for the CAP
	private _grp = createGroup [GRLIB_side_enemy, true];
	
	//create 2 planes and their crews, give them the killed handlers + apply init from kp object init
	// _plane refers to the vehicle instance its self

	//spawn planes depending on difficulty. See top of this script for how _CAP_planes_to_spawn
	// is calculated
	for "_i" from 1 to _CAP_planes_to_spawn do {

		//create the plane and its occupants
		_plane = createVehicle [_class, _spawnPos, [], 0, "FLY"];
		createVehicleCrew _plane;
		_plane flyInHeight (120 + (random 180));
		_plane addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
		[_plane] call KPLIB_fnc_addObjectInit;

		{_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _plane);

		//add the plane to the vehicle array
		_CAP_vehicle_array pushBack _plane;

		crew _plane joinSilent _grp;
		sleep 2;
	};

    sleep 1;

	//setup their waypoints, command the squad to follow leader to create wingmen
	while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
	sleep 1;
	
	{_x doFollow leader _grp} forEach (units _grp);
	sleep 1;

	for "_i" from 1 to 6 do {
		_waypoint = _grp addWaypoint [_objective, 500];
		_waypoint setWaypointType "SAD";
	};

	_CAP_living_planes = count _CAP_vehicle_array;
}