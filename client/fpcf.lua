local VehicleFP = true
local BikeFP = false

if VehicleFP then
    CreateThread(function()
        while true do
            sleep = 1000
            if IsPedInAnyVehicle(PlayerPedId()) then
                sleep = 1
                if IsControlJustPressed(0, 25) then
                    SetFollowVehicleCamViewMode(3)
                elseif IsControlJustReleased(0, 25) then
                    SetFollowVehicleCamViewMode(0)
                end
            end
            Wait(sleep)
        end
    end)
end

if BikeFP then
    CreateThread(function()
        while true do
            sleep = 1000
            local _, weapon = GetCurrentPedWeapon(PlayerPedId())
            local unarmed = `WEAPON_UNARMED`
            if IsPedOnAnyBike(PlayerPedId()) and weapon ~= unarmed then
                sleep = 1
                if IsPlayerFreeAiming(PlayerId()) then
                    --HideHudComponentThisFrame(14)
                    DisableControlAction(1, 71, true) --Key: W (veh_accelerate)
                end
            else
                sleep = 1000
            end
            Wait(sleep)
        end
    end)
end