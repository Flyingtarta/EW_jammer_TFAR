/*
Autor : Tarta

Descripcion:s
  Script para agregar un jammer a la lista (solo al principio de la mision no funciona durante)
  si el objeto es destruido le saca el jammeo

Entrada:
  _jammer = (objecto)
  _Radio = (Numero) valor maximo de accion del Jammer:
          1/2 de _radio empieza a afectar salida
          1/4 de radio, interferencia practicamente total
          (default = 2000)
*/
if !(isServer) exitWith {};
waituntil {time > 1};

params["_jammer","_radio"];

Jammers pushbackunique _jammer; //agregamos el jammer a la lista
missionNamespace setvariable [str _jammer, _radio]; //guardamos la variable del radio para ese jammer en particular

_jammer addeventhandler ["killed",{
  params ["_jammer"];
  _JammerActivos = missionNamespace getvariable "JammerActivos";
  _JammerActivos = _JammerActivos - [_Jammer];
  missionNamespace setVariable ["JammerActivos", _JammerActivos, true];
  _jammer removealleventhandlers "killed";
  }];

_jammer addEventHandler ["Deleted", {
  params ["_jammer"];
  _JammerActivos = missionNamespace getvariable "JammerActivos";
  _JammerActivos = _JammerActivos - [_Jammer];
  missionNamespace setVariable ["JammerActivos", _JammerActivos, true];
  _jammer removealleventhandlers "Deleted";
}];
