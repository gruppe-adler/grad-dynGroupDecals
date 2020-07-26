params ["_driver"];

private _group = group _driver;
private _vehicle = vehicle _driver;

private _groupID = toLower (groupId _group);

private _found = false;

{
    private _groupName = _x;
    private _groupPrefix = _groupName splitString [0,1];
    // detect alpha
    if (_groupID find _groupName > -1) exitWith {
        {
            private _number = _x;
            if (_groupID find _number > -1) then {
                private _groupPrefixNumber = format [(_groupPrefix + "%1"), _number];
                [_groupPrefixNumber] call GRAD_dynGroupDecals_fnc_setTexture;
            } else {
                [_groupPrefix] call GRAD_dynGroupDecals_fnc_setTexture;
            };
            _found = true;
        } forEach ["1","2","3","4"];
    };

  } forEach [
      "alpha",
      "bravo",
      "charlie",
      "delta"
  ];

if (!_found) then {

};
