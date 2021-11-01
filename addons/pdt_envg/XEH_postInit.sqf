/*
 *	Author: PDT
 *	creates CBA event handler
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 */

["visionMode", {
  params ["_unit", "_visionMode"];
  [] spawn PDT_ENVG_fnc_setNvgEffect;
}, true] call CBA_fnc_addPlayerEventHandler;
