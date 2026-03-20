local lastBone = nil
local lastHealth = nil

-- Disable critical hits (run once)
CreateThread(function()
    SetPedSuffersCriticalHits(PlayerPedId(), false)
end)

-- Set weapon damage modifiers (run once)
CreateThread(function()
    Wait(1000)
    for weapon, _ in pairs(Config.Weapons) do
        SetWeaponDamageModifier(weapon, 0.01)
    end
end)

-- Handle damage events (MAIN SYSTEM)
AddEventHandler('gameEventTriggered', function(name, args)
    if name ~= "CEventNetworkEntityDamage" then return end

    local victim = args[1]
    local attacker = args[2]
    local weapon = args[7]

    if victim ~= PlayerPedId() then return end

    local ped = PlayerPedId()

    -- 🔧 Cancel GTA's tiny damage
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

-- Apply health from server
RegisterNetEvent("simpleDamage:applyHealth", function(newHealth)
    SetEntityHealth(PlayerPedId(), newHealth)
end)

-- Apply armor from server
RegisterNetEvent("simpleDamage:setArmor", function(armor)
    SetPedArmour(PlayerPedId(), armor)
end)