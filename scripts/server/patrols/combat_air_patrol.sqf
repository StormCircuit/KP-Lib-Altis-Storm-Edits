private [ "_headless_client" ];
private _CAP_living_planes = 0;
private _last_CAP_spawn = 0;

private _plane = objNull;

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "combat_readiness" };

while { GRLIB_endgame == 0 } do {

	//wait until all the CAP planes are dead before spawning another CAP
	waitUntil {_CAP_living_planes == 0};
	_last_CAP_spawn = time;

	//wait 30 minutes or until the player gets 20 air kills AND 10 minutes has passed since
	// last spawn
	waitUntil {time > (_last_CAP_spawn + 2700) || air_weight == 20 && time > _last_CAP_spawn + 600};
	
	//systemChat "here they come!!!";

	//get the enarest blufor sector
	private _objective = [] call KPLIB_fnc_getNearestBluforObjective;

	//select one class of plane to spawn randomly
	private _class = selectRandom opfor_air;

	//get the airspawn sector spawn point
	private _spawnPoint = ([sectors_airspawn, [_objective], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
	
	_spawnPos = markerPos _spawnPoint;
    _spawnPos = [(((_spawnPos select 0) + 500) - random 1000), (((_spawnPos select 1) + 500) - random 1000), 200];
	
	//create the group for the CAP
	private _grp = createGroup [GRLIB_side_enemy, true];
	
	//create 3 planes and their crews, give them the killed handlers + apply init from kp object init
	for "_i" from 1 to 2 do {
		_plane = createVehicle [_class, _spawnPos, [], 0, "FLY"];
		createVehicleCrew _plane;
		_plane flyInHeight (120 + (random 180));
		_plane addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
		[_plane] call KPLIB_fnc_addObjectInit;
		{_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _plane);
		_plane addMPEventHandler ["MPKilled", {_CAP_living_planes = _CAP_living_planes - 1}];
		(crew _plane) joinSilent _grp;
		sleep 2;
	};

    sleep 1;

	while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
	sleep 1;
	
	{_x doFollow leader _grp} forEach (units _grp);
	sleep 1;

	for "_i" from 1 to 6 do {
		_waypoint = _grp addWaypoint [_objective, 500];
		_waypoint setWaypointType "SAD";
	};

	_CAP_living_planes = 3;
}