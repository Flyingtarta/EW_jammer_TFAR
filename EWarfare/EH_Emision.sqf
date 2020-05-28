//params ["_player","_radioClass","_SWLR","_esAdicional","_ButtonDown"];
private _player = _this select 0;
private _SWLR = _this select 2;

private _antenas = missionNamespace getvariable "AntenasRadio";                 // antenas para saber si hay al menos 3
if (_SWLR isequalto 1 && {isnull (objectparent _player)} && { (count ( _antenas select {_player distance2d _x < 2000})) > 1 } )then {
  private _tringPos = missionNamespace getVariable "posTrianguladas";           //trae el array de posiciones guardadas
  private _pos = _player call BIS_fnc_postogrid;                                // pasa la ubicacion a grid
  _tringPos = _tringPos + [_pos];                                               // agrega la nueva posicion al array
  missionNamespace setvariable ["posTrianguladas",_tringPos,true];              // guarda el nuevo array
};
