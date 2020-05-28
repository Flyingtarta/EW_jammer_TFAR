params ["_player"];
_player setvariable ["tf_receivingDistanceMultiplicator",1];
while {true} do {
  _jammers = missionNamespace getvariable "JammerActivos";
  _jam = objNull;
  _njam = count _jammers;
  if (_njam > 0) then { //si hay jammers activos
    if (_njam isequalto 1) then {
      _jam = _jammers select 0;
    } else  {
      _jammers_sorted = _jammers apply { [(_player distance2d _x),_x ] };
      _jammers_sorted sort true;
      _jam = _jammers_sorted select 0 select 1;//elegimos el mas cercano
    };
    _interf_r = linearConversion [500,2000, _jam distance2d _player, 10,2,true];
    _interf_s = linearConversion [250,1000, _jam distance2d _player, 0.4,1,true];
    _player setvariable ["tf_receivingDistanceMultiplicator",_interf_r];
    _player setVariable ["tf_sendingDistanceMultiplicator",_interf_s];
  } else {//si no hay jammers activos
    _player setvariable ["tf_receivingDistanceMultiplicator",1];
    _player setVariable ["tf_sendingDistanceMultiplicator",1];
  };
  /*
  cosas para debug
  hint format ["Recepcion: %1 \nEnvio %2\nCantidad: %3",_player getvariable "tf_receivingDistanceMultiplicator",_player getvariable "tf_sendingDistanceMultiplicator",(count(missionNamespace getvariable "JammerActivos"))];
  systemchat ("recepcion: " + str(_player getvariable "tf_receivingDistanceMultiplicator"));
  systemchat ("envio: " + str(_player getvariable "tf_sendingDistanceMultiplicator"));
  systemchat ("cantidad de jammers:" + str(count(missionNamespace getvariable "JammerActivos")));
  */
  sleep 1;
};
