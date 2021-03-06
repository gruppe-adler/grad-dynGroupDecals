params ["_texture"];

private _texture = format ["gm\gm_core\gm_core_vehicles\data\systems\vehicleMarkings\insignias\formation\gm_%1_%2_ca.paa", _texture, GRAD_DYNGROUPDECALS_INSIGNIA_COLOR];

// we assume rhs escalation is always loaded fully
if (isClass (configFile >> "CfgPatches" >> "rhsusf_main")) then {

    _vehicle setVariable ["RHS_Decal_Number_Enabled", false, true];

    if (_vehicle isKindOf "rhs_tracked_base" ||
        _vehicle isKindOf "rhs_wheeled_base" ||
        _vehicle isKindOf "rhs_air_base") then {
      [_vehicle,
      [
        "Label",
        [1,2,3,4,5,6,7,8,9],
        "LicensePlate",
        [
            _texture,
        ]
      ]] spawn rhs_fnc_decalsInit; // todo find right hidden selection on each vehicle
    };
};

if (_vehicle isKindOf "gm_tracked_base" ||
    _vehicle isKindOf "gm_wheeled_base" ||
    _vehicle isKindOf "gm_air_base") then {

    _vehicle setObjectTextureGlobal [27, _texture];
};
