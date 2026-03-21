local recoilStack = 0.0

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        local wData = Config.Weapons[weapon]

        if wData and IsPedShooting(ped) then
            -- Camera shake
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', wData.shake)

            local recoilAmount = wData.recoil
            if IsPedInAnyVehicle(ped, true) then
                recoilAmount = recoilAmount * (Config.Weapons.Config.VehicleMultiplier or 0.75)
            end

            local camPitch = GetGameplayCamRelativePitch()
            local multiplier = Config.Weapons.Config.RecoilMultiplier or 0.2
            SetGameplayCamRelativePitch(camPitch + recoilAmount * multiplier, 0.2)
        end
    end
end)

-- the reasoning for no recoil here below is because of the custom recoil above

CreateThread(function()
    local lastWeapon = nil

    while true do
        local playerPed = PlayerPedId()
        local weapon = GetSelectedPedWeapon(playerPed)

        if weapon ~= lastWeapon then
            lastWeapon = weapon

            if IsPedArmed(playerPed, 6) then
                SetWeaponRecoilShakeAmplitude(weapon, 0)
                SetPedAccuracy(playerPed, 90)
            end
        end

        Wait(200)
    end
end)