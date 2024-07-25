time_to_idle = time + 60;

waitUntil { !isNull findDisplay 46 };

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	time_to_idle = time + 60;
}];

(findDisplay 46) displayAddEventHandler ["MouseMoving", {
	time_to_idle = time + 60;
}];

fnc_idle = {
	if (local player) then {
		playerKick = true;
		publicVariableServer "playerKick";
	}
};

while {true} do {
	if (time_to_idle - time <= 30) then{
		systemChat "Warning! Detected as AFK! Please press a button or move mouse!";
	};

	if (time > time_to_idle) then {
		0 = [] spawn fnc_idle;
	};

	if (findDisplay 312 in allDisplays) exitWith {
		findDisplay 46 displayRemoveAllEventHandlers "KeyDown";
		findDisplay 46 displayRemoveAllEventHandlers "MouseMoving";
		execVM "scripts\client\afk_timeout\idle_kick_zeus.sqf"
	};
	sleep 5;	
};