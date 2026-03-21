Citizen.CreateThread(function()
    local aiming = false

    while true do
        Citizen.Wait(100)

        local playerPed = PlayerPedId()
        if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
            local isAiming = IsPlayerFreeAiming(PlayerId())
            
            if isAiming and not aiming then
                aiming = true
                TriggerServerEvent('stealthKill:playerAiming', PlayerId())
            elseif not isAiming and aiming then
                aiming = false
            end
        end
    end
end)