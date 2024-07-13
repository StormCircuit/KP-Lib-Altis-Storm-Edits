private _grp = _this select 0;
private _flagpos = _this select 1;
private _basepos = getpos (leader _grp);
private _is_infantry = false;
private _wpPositions = [];
private _waypoint = [];
if (vehicle (leader _grp) == (leader _grp)) then {_is_infantry = true;};

sleep 5;
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
sleep 1;
{_x doFollow leader _grp} foreach units _grp;
sleep 1;

if (_is_infantry) then {

    _wpPositions = [
        _flagpos getPos [random 150, random 360],
        _flagpos getPos [random 150, random 360],
        _flagpos getPos [random 150, random 360],
        _flagpos getPos [random 150, random 360],
        _flagpos getPos [random 150, random 360]
    ];

    _waypoint = _grp addWaypoint [_wpPositions select 0, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "YELLOW";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointCompletionRadius 10;

    _waypoint = _grp addWaypoint [_wpPositions select 1, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint = _grp addWaypoint [_wpPositions select 2, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint = _grp addWaypoint [_wpPositions select 3, 10];
    _waypoint setWaypointType "MOVE";

    _waypoint = _grp addWaypoint [_wpPositions select 4, 10];
    _waypoint setWaypointType "CYCLE";
} else {


    //Storm's edits: check if vehicle is a helicopter, if not it's a land vehicle so keep 
    // waypoints in a small range. Otherwise helicopters flip out and constantly reach WP
    if (typeOf vehicle leader _grp in opfor_choppers) then {

        _wpPositions = [
            _flagpos getPos [random 500 min 300, random 360],
            _flagpos getPos [random 500 min 300, random 360],
            _flagpos getPos [random 500 min 300, random 360],
            _flagpos getPos [random 500 min 300, random 360],
            _flagpos getPos [random 500 min 300, random 360]
        ];
    } else {
        _wpPositions = [
            _flagpos getPos [random 150, random 360],
            _flagpos getPos [random 150, random 360],
            _flagpos getPos [random 150, random 360],
            _flagpos getPos [random 150, random 360],
            _flagpos getPos [random 150, random 360]
        ];
    };
    
    _waypoint = _grp addWaypoint [_wpPositions select 0, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "YELLOW";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint = _grp addWaypoint [_wpPositions select 1, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint = _grp addWaypoint [_wpPositions select 2, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint = _grp addWaypoint [_wpPositions select 3, 10];
    _waypoint setWaypointType "MOVE";
    _waypoint = _grp addWaypoint [_wpPositions select 4, 10];
    _waypoint setWaypointType "CYCLE";
    _grp setCurrentWaypoint [_grp, 0];
};

_grp setCurrentWaypoint [_grp, 0];

waitUntil {
    sleep 10;
    ({alive _x} count (units _grp) == 0) || !(isNull ((leader _grp) findNearestEnemy (leader _grp)))
};

if ({alive _x} count (units _grp) > 0) then {
    while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0)};
    sleep 1;
    {_x doFollow leader _grp} foreach units _grp;
    sleep 1;
    _wpPositions = [
        _basepos getPos [random 150, random 360],
        _basepos getPos [random 150, random 360],
        _basepos getPos [random 150, random 360],
        _basepos getPos [random 150, random 360],
        _basepos getPos [random 150, random 360]
    ];
    _waypoint = _grp addWaypoint [_wpPositions select 0, 10];
    _waypoint setWaypointType "SAD";
    _waypoint setWaypointBehaviour "COMBAT";
    _waypoint setWaypointCombatMode "YELLOW";
    if (_is_infantry) then {
        _waypoint setWaypointSpeed "NORMAL";
    } else {
        _waypoint setWaypointSpeed "LIMITED";
    };
    _waypoint = _grp addWaypoint [_wpPositions select 1, 10];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_wpPositions select 2, 10];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_wpPositions select 3, 10];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_wpPositions select 4, 10];
    _waypoint setWaypointType "CYCLE";
    _grp setCurrentWaypoint [_grp, 0];
};
