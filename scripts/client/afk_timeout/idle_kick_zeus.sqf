time_to_idle = time + 60;

waitUntil { !isNull findDisplay 312 };

(findDisplay 312) displayAddEventHandler ["KeyDown", {
	time_to_idle = time + 60;
}];

(findDisplay 312) displayAddEventHandler ["MouseMoving", {
	time_to_idle = time + 60;
}];

fnc_idle = {
	if (local player) then {
		endMission "LOSER";
		forceEnd;
	}
};

while {true} do {
	if (time_to_idle - time <= 30) then{
		systemChat "Warning! Detected as AFK! Please press a button or move mouse!";
	};

	if (time > time_to_idle) then {
		0 = [] spawn fnc_idle;
	};

	if !(findDisplay 312 in allDisplays ) exitWith {
		findDisplay 312 displayRemoveAllEventHandlers "KeyDown";
		findDisplay 312 displayRemoveAllEventHandlers "MouseMoving";
		execVM "scripts\client\afk_timeout\idle_kick.sqf";
	};
	sleep 5;	
};