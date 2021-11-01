// import stuff
#include "macros.hpp"

/*
 *	Author: PDT
 *	sets the player's NVG effect; effects are defined in macros.hpp
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	<ARRAY> - [<STRING>, <BOOL>], ["NVG Effect", true if effect was set; false if not]
 *
 * example:
 * [] spawn PDT_EnhancedNVG_fnc_setNvgEffect;
 */

// player is not using NVGs, exit
if !(call PDT_ENVG_fnc_getVisionMode) exitWith {
  _return = ["", false];
  _return
};

private _nvgEffect = call PDT_ENVG_fnc_getNvgEffect; // nvg effect

if !(_nvgEffect isEqualTo []) then {
  private _effect = ppEffectCreate ["ColorCorrections", 16735]; // effect

  _effect ppEffectAdjust _nvgEffect; // set the effect
  _effect ppEffectForceInNVG true;   // force it in NVGs
  _effect ppEffectCommit 0.01;       // commit the effect
  _effect ppEffectEnable true;

  // wait until player isn't using NVGs or entered Zeus
  waitUntil {!(call PDT_ENVG_fnc_getVisionMode) || !(isNull findDisplay 312)};
  _effect ppEffectEnable false; // hide the effect
  ppEffectDestroy _effect;      // get rid of the effect

  /* if the player entered Zeus we need to keep the effect when they exit
     to do this we check if they entered Zeus and if they did
     we spawn some code that will wait until they are not in Zeus
    then re-call the setNvgEffect function to reapply the effect
  */
  if (!isNull findDisplay 312) exitWith {    // did the player enter Zeus
    [] spawn {                               // yes, so spawn some code
      waitUntil {isNull findDisplay 312};    // wait until they exit Zeus
      call PDT_EnhancedNVG_fnc_setNvgEffect; // re-call the setNvgEffect function

      /* note on the above: normally you need to spawn the function since it needs
         to be able to suspend but since we are calling it in a schedualled
         enviroment the code will be able to suspend even when called.
      */

    };
  };
};
