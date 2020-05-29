params ["_player"];
/*
Autor: [Calaveras] Tarta

Descripcion: 
    Script que se ejecuta en el jugador para medir la distancia al jammer activo mas cercano 
    y modificar el parametro que hace que la radio se deteriore de manera lineal de acuerdo a la distancia
   
   se afecta en 2 niveles, 500 metros a la redonda las radios larga tienen un radio efectivo de 500 metros y afecta tanto la recepcion como la emision
   entre los 500 y 2000 metros el efecto empieza a bajar y la emision no se ve tan comprometida, pero si la recepcion
   (alguien fuera del rango lo puede escuchar, pero el que este dentro no) 
   
Changelog: 
    29/5/2020: Simplificado para poder ser usado como script, sin el description.ext
Version: 
    v0.1
Todo:
    Que el rango del jammer pueda ser definido junto al jammer y que varios jammer puedan tener diferentes rangos de jammeo
*/


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
    _interf_r = linearConversion [500,2000, _jam distance2d _player, 10,1,true];
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
