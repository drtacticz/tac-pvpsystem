local weapons = {

-- eg     [GetHashKey('WEAPON_HEAVYPISTOL')] = {recoil = 0.2, shake = 0.00},
--                      recoil low/normal 0.0 - 4.0 anymore is hard 
--                      shake low/normal 0.0 - 0.2 anymore is hard
--                      even harder if combinded 

    -- 🔫 PISTOLS
    [GetHashKey('WEAPON_PISTOL')] = {recoil = 1.5, shake = 0.01},
    [GetHashKey('WEAPON_PISTOL_MK2')] = {recoil = 3.0, shake = 0.01},
    [GetHashKey('WEAPON_COMBATPISTOL')] = {recoil = 3.0, shake = 0.01},
    [GetHashKey('WEAPON_PISTOL50')] = {recoil = 6.0, shake = 0.015},
    [GetHashKey('WEAPON_SNSPISTOL')] = {recoil = 2.0, shake = 0.01},
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = {recoil = 2.0, shake = 0.01},
    [GetHashKey('WEAPON_HEAVYPISTOL')] = {recoil = 3.0, shake = 0.01},
    [GetHashKey('WEAPON_CERAMICPISTOL')] = {recoil = 3.0, shake = 0.01},
    [GetHashKey('WEAPON_PISTOLXM3')] = {recoil = 2.75, shake = 0.01},
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = {recoil = 2.75, shake = 0.01},
    [GetHashKey('WEAPON_APPISTOL')] = {recoil = 5.0, shake = 0.01},

    -- 🔫 SMGs
    [GetHashKey('WEAPON_MICROSMG')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_SMG')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_SMG_MK2')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_ASSAULTSMG')] = {recoil = 2.0, shake = 0.01},
    [GetHashKey('WEAPON_MACHINEPISTOL')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_MINISMG')] = {recoil = 2.0, shake = 0.01},
    [GetHashKey('WEAPON_COMBATPDW')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_GUSENBERG')] = {recoil = 4.0, shake = 0.01},
	[GetHashKey('WEAPON_TECPISTOL')] = {recoil = 4.0, shake = 0.01},

    -- 🔫 RIFLES
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_CARBINERIFLE')] = {recoil = 2.0, shake = 0.01},
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_SPECIALCARBINE')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_COMPACTRIFLE')] = {recoil = 4.0, shake = 0.01},
    [GetHashKey('WEAPON_MILITARYRIFLE')] = {recoil = 4.0, shake = 0.01},
	[GetHashKey('WEAPON_HEAVYRIFLE')] = {recoil = 4.0, shake = 0.01},
	[GetHashKey('WEAPON_BATTLERIFLE')] = {recoil = 4.0, shake = 0.01},
	[GetHashKey('WEAPON_TACTICALRIFLE')] = {recoil = 4.0, shake = 0.01},
}

CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
		for hash, data in pairs(weapons) do
			if weapon == hash then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', data.shake)
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()

		if IsPedShooting(ped) then
			local _, wep = GetCurrentPedWeapon(ped)
			local _, cAmmo = GetAmmoInClip(ped, wep)

			if weapons[wep] and weapons[wep].recoil and weapons[wep].recoil ~= 0 then
				
				local recoil = weapons[wep].recoil
				
				if IsPedInAnyVehicle(ped, true) then
					recoil = recoil * 0.75 -- adjust this value | Reduce recoil if in vehicle 
				end

				local tv = 0
				repeat
					Wait(0)
					local p = GetGameplayCamRelativePitch()

					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p + 0.1, 0.2)
					end

					tv = tv + 0.1
				until tv >= recoil
			end
		end
	end
end)