/*
 *	Author: PDT
 *	creates CBA settings
 *
 *	Arguments:
 *  None
 *
 *	Return Value:
 *	None
 *
 */

// ACE check
[
  "PDT_ENVG_ACE",
  "CHECKBOX",
  [
    "Use ACE color preset",
    "Enable if using ACE"
  ],
  "Fawks' Enhanced NVGs",
  false
] call cba_settings_fnc_init;

// NVG effect select
[
  "PDT_ENVG_Effect",
  "LIST",
  [
    "NVG Effect",
    "
    Green Phosphor (no effect).\n
    Modern Warfare (greenish tint WP)\n
    White Phosphor (White Phosphor)
    "
  ],
  "Fawks' Enhanced NVGs",
  [
    [
      "",
      "gpEffect",
      "wpEffect",
      "mwEffect",
      "afEffect",
      "ofEffect",
      "rfEffect"
    ],
    [
      "None",
      "Green Phosphor",
      "White Phosphor",
      "Modern Warfare",
      "Amber Filter",
      "Orange Filter",
      "Red Filter"
    ],
    0
  ]
] call cba_settings_fnc_init;

// NVG blacklist
[
  "PDT_ENVG_Blacklist",
  "EDITBOX",
  [
    "Blacklisted NVG classnames", "Seperrate classnames by commas \nEg. className1, className2, className3, etc"
  ],
  "Fawks' Enhanced NVGs",
  ""
] call cba_settings_fnc_init;
