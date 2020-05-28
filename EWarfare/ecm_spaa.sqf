params ["_spaa"];
//_target = player;
waitUntil {time>1};
private _pos = getpos _spaa;
private _side = west;
private _posRad =[];
#define TARGETSLEEP 3600
for "_i" from 0 to 4 do {
  _rad =[_pos,(500*_i),(4+_i),false,false] call clv_fnc_alrededorLoc;
  {_posRad pushBack _x;} foreach _rad;
};

{
  _decoy="Land_HelipadEmpty_F" createvehicle _x;
  (side player)  reportRemoteTarget [_decoy,TARGETSLEEP];
} forEach _posRad;

while {alive _spaa} do {
  (side driver _spaa)  reportRemoteTarget [_decoy,TARGETSLEEP];
  sleep TARGETSLEEP;
};
