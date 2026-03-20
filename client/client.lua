local lastBone = nil
local lastHealth = nil

CreateThread(function()
    SetPedSuffersCriticalHits(PlayerPedId(), false)
end)

CreateThread(function()
    Wait(1000)
    for weapon, _ in pairs(Config.Weapons) do
        SetWeaponDamageModifier(weapon, 0.01)
    end
end)

AddEventHandler('gameEventTriggered', function(name, args)
    if name ~= "CEventNetworkEntityDamage" then return end

    local victim = args[1]
    local attacker = args[2]
    local weapon = args[7]

    if victim ~= PlayerPedId() then return end

    local ped = PlayerPedId()

    SetEntityHealth(ped, GetEntityHealth(ped) + 1)

    local attackerId = NetworkGetPlayerIndexFromPed(attacker)
    if attackerId == -1 then return end

    local success, bone = GetPedLastDamageBone(PlayerPedId())
    if not success then bone = 0 end

    TriggerServerEvent("simpleDamage:hit", {
        attacker = GetPlayerServerId(attackerId),
        weapon = weapon,
        bone = bone
    })
end)

RegisterNetEvent("simpleDamage:applyHealth", function(newHealth)
    SetEntityHealth(PlayerPedId(), newHealth)
end)

RegisterNetEvent("simpleDamage:setArmor", function(armor)
    SetPedArmour(PlayerPedId(), armor)
end)