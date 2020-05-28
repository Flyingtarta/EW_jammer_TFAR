/*
#define TESCUCHA 60
#define TCALCULO 180
#define RANGOANTENA 2000
waituntil {time >0};
systemchat "triangulacion activa";
private _antenas = missionNamespace getvariable "AntenasRadio";
while { count (_antenas) > 0 } do {
  missionNamespace setvariable ["posTrianguladas",[],true];
  sleep TESCUCHA; //periodo de escucha
  systemchat "fin periodo escucha";
  private _posTr = missionNamespace getVariable "posTrianguladas";
  if (count (_posTR) > 0) then {
    private _gridPos = [];
    private _gridsUnicos = [];
    private _gridN = [];
    {
      _grid = (_x select 0) + (_x select 1);
      _gridPos pushBack _grid;
      if !(_grid in _gridsUnicos) then {
        _gridsUnicos pushBack _grid;
      };
    }foreach _posTr;
    {//contamos los grids que se repiten
      _gridunico = _x;
      _count = {_x isequalto _gridunico }count _gridPos;
      _gridN pushback [_count, _gridunico];
    }foreach _gridsUnicos;
    _gridN sort false; //lo ordenamos
    private _posArty = ((_gridN select 0 select 1) call bis_fnc_gridtopos)select 0;//seleccionamos el grid que mas se repite para pasarselo a la artilleria
    private _m =createMarker [str _posArty, _posArty];
    _m setMarkertype "hd_objective";
    _m setMarkercolor "ColorRed";
    private _CountAntenas = count (_antenas select {round (_x distance2d _posArty) < RANGOANTENA });
    private _disp = linearConversion  [count(_antenas),2,_CountAntenas , 200 , 700, true];
    sleep TCALCULO;
    _posArty = [(_posArty select 0)+25, (_posArty select 1)+25, 0];
    [_posArty,"Sh_155mm_AMOS",_disp,4,8,{false},50] call BIS_fnc_fireSupportVirtuaL;
  };
};
