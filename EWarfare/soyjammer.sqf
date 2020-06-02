/*
Autor : Tarta

Descripcion:
  Script para agregar un jammer a la lista (solo al principio de la mision no funciona durante)
  si el objeto es destruido le saca el jammeo
TODO:
  Radio de accion variable
*/

if !(isServer) exitWith {};
waituntil {time > 1};
params["_this","_radio"];

Jammers pushbackunique _this;

_this addeventhandler ["killed", {
    params["_this"];
    _JA = missionNamespace getVariable "JammersActivos";
    _JAF = _JA - [_this];
    missionNamespace setvariable ["JammersActivos",_JAF,true];
}];
