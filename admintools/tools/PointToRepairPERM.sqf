private ["_vehicle","_type","_name","_hitpoints","_player","_strH"];

_vehicle = cursorTarget;
_type = typeOf _vehicle;
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_hitpoints = _vehicle call vehicle_getHitpoints;
_player = player;

{
    private ["_damage","_selection"];
    _damage = [_vehicle,_x] call object_getHit;

    if (_damage > 0) then {
		_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
		_strH = "hit_" + (_selection);
		_vehicle setHit[_selection,0];
		_vehicle setVariable[_strH,0,true];
	};
} forEach _hitpoints;
PVDZ_veh_Save = [_vehicle,"repair"];
publicVariableServer "PVDZ_veh_Save";

_vehicle setDamage 0;
_vehicle setFuel 1;
_vehicle setVehicleAmmo 1;
_vehicle setVelocity [0,0,1];
format["%1 permanently repaired, refuelled and rearmed.", _name] call dayz_rollingMessages;

// Tool use logger
if(EAT_logMinorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has permanently repaired %3",name _player,getPlayerUID _player,_vehicle];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};
