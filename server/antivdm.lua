RegisterNetEvent('stealthKill:playerAiming')
AddEventHandler('stealthKill:playerAiming', function(playerId)
    local ped = GetPlayerPed(playerId)
    if DoesEntityExist(ped) and not IsEntityDead(ped) then
        _REMOVE_STEALTH_KILL(-1553120962, 0.0)
    end
end)