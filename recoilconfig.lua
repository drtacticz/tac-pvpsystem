Config = {}

Config.Weapons = {
    -- 🔫 PISTOLS
    [GetHashKey('WEAPON_PISTOL')] = {recoil = 2.0, shake = 0.015},
    [GetHashKey('WEAPON_PISTOL_MK2')] = {recoil = 3.5, shake = 0.015},
    [GetHashKey('WEAPON_COMBATPISTOL')] = {recoil = 3.5, shake = 0.015},
    [GetHashKey('WEAPON_PISTOL50')] = {recoil = 7.0, shake = 0.02},
    [GetHashKey('WEAPON_SNSPISTOL')] = {recoil = 2.5, shake = 0.015},
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = {recoil = 2.5, shake = 0.015},
    [GetHashKey('WEAPON_HEAVYPISTOL')] = {recoil = 3.5, shake = 0.015},
    [GetHashKey('WEAPON_CERAMICPISTOL')] = {recoil = 3.5, shake = 0.015},
    [GetHashKey('WEAPON_PISTOLXM3')] = {recoil = 3.0, shake = 0.015},
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = {recoil = 3.0, shake = 0.015},
    [GetHashKey('WEAPON_APPISTOL')] = {recoil = 6.0, shake = 0.015},

    -- 🔫 SMGs
    [GetHashKey('WEAPON_MICROSMG')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_SMG')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_SMG_MK2')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_ASSAULTSMG')] = {recoil = 2.5, shake = 0.015},
    [GetHashKey('WEAPON_MACHINEPISTOL')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_MINISMG')] = {recoil = 2.5, shake = 0.015},
    [GetHashKey('WEAPON_COMBATPDW')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_GUSENBERG')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_TECPISTOL')] = {recoil = 5.0, shake = 0.015},

    -- 🔫 RIFLES
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_CARBINERIFLE')] = {recoil = 3.0, shake = 0.015},
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_SPECIALCARBINE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_COMPACTRIFLE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_MILITARYRIFLE')] = {recoil = 5.0, shake = 0.015},
    [GetHashKey('WEAPON_HEAVYRIFLE')] = {recoil = 5.5, shake = 0.02},
    [GetHashKey('WEAPON_BATTLERIFLE')] = {recoil = 5.5, shake = 0.02},
    [GetHashKey('WEAPON_TACTICALRIFLE')] = {recoil = 5.5, shake = 0.02},

    -- Config
    Config = {
        RecoilMultiplier = 0.25,  -- increase global multiplier for stronger recoil
        VehicleMultiplier = 0.7    -- slightly stronger recoil in vehicles
    }
}