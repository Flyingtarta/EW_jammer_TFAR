params["_player"];
[_player] spawn {
  params["_player"];
  [_player] call clv_fnc_jammer_initPlayer;
};
/*
["id_1", "OnTangent",
  {
  params ["_player","_radioClass","_SWLR","_esAdicional","_ButtonDown"];
  [_player,_radioClass,_SWLR,_esAdicional,_ButtonDown] spawn clv_fnc_EH_Emision;
  },
  _player
  ] call TFAR_fnc_addEventHandler;
