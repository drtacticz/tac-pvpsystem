local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("simpleDamage:hit", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local ped = GetPlayerPed(src)
    if not ped then return end

    local weaponData = Config.Weapons[data.weapon] or Config.Default

    local isHeadshot = (data.bone == Config.HeadBone)
    local multiplier = isHeadshot and weaponData.headMultiplier or weaponData.bodyMultiplier

    local damage = weaponData.baseDamage * multiplier - 1

    local currentHealth = GetEntityHealth(ped)
    local currentArmor = GetPedArmour(ped)

    local remainingDamage = math.floor(damage)

    if currentArmor > 0 then
        local newArmor = math.max(0, currentArmor - remainingDamage)
        remainingDamage = math.max(0, remainingDamage - currentArmor)

        TriggerClientEvent("simpleDamage:setArmor", src, newArmor)
    end

    local newHealth = math.max(0, currentHealth - remainingDamage)

    TriggerClientEvent("simpleDamage:applyHealth", src, newHealth)

    Player.Functions.SetMetaData("health", newHealth)

    if data.attacker then
        TriggerClientEvent("simpleDamage:feedback", data.attacker, {
            damage = math.floor(damage),
            headshot = isHeadshot
        })
    end

    if newHealth <= 0 then
        TriggerEvent('hospital:server:SetDeathStatus', src, true)
    end
end)