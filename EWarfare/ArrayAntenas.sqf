/*

Funcion que agrega todas las antenas a un array y les pone un marcador para que sean mas visibles

*/

#define radioworld (worldSize/2)
private _antenas = [];
private _antenasMapa = nearestTerrainObjects [[radioworld,radioworld],["TRANSMITTER"],radioworld,false,true];
private _antenasEditor = nearestObjects [[radioworld,radioworld], ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"], radioworld];
hint str ( count _antenasEditor);
_antenas append _antenasMapa;
{
  if !(_x in _antenas) then {
    _antenas pushBack _x};
}foreach _antenasEditor;//;as agregamos a un unico array

{
  _m = createMarker [str _x, getpos _x];
  _m setmarkertype "loc_Transmitter";
} forEach _antenas; //creamos marcadores para las antenasd

_antenasMapa = nil;
_antenasEditor = nil;

_antenas
