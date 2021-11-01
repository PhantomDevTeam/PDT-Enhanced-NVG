/*
 *	Author: PDT
 *	gets the player's select NVG effect and checks if ACE is running
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	<ARRAY> - [<NUMBER>] Color correction array
 *
 * example:
 * call PDT_EnhancedNVG_fnc_getNvgEffect;
 */

private _effectSelection = PDT_ENVG_Effect;
private _nvgBlacklist    = PDT_ENVG_Blacklist; // nvg blacklist
private _effect = [];

if !((hmd player) in _nvgBlacklist) then {
  if !(_effectSelection isEqualTo "") then {
      _effect = (
      configFile >> "CfgEffects" >> format [
          "%1%2", _effectSelection, ["", "Ace"] select PDT_ENVG_ACE
      ]
    ) call BIS_fnc_returnConfigEntry;    // selected effect
  };
};

_return = _effect;
_return
