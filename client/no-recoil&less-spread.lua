-- the reasoning for no recoil here if custom recoil in recoil.lua

--CreateThread(function()
	--Wait(1000)
	--while true do
		--if IsPedArmed(PlayerPedId(), 6) then
			--SetWeaponRecoilShakeAmplitude(GetSelectedPedWeapon(PlayerPedId()), 0)
			--SetPedAccuracy(PlayerPedId(), 85)
		--end
		--Wait(1000)
	--end
--end)


CreateThread(function()
    local lastWeapon = nil

    while true do
        local playerPed = PlayerPedId()
        local weapon = GetSelectedPedWeapon(playerPed)

        if weapon ~= lastWeapon then
            lastWeapon = weapon

            if IsPedArmed(playerPed, 6) then
                SetWeaponRecoilShakeAmplitude(weapon, 0)
                SetPedAccuracy(playerPed, 85)
            end
        end

        Wait(200)
    end
end)