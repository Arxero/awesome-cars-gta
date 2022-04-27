-- for this event to exist you need to edit this line (https://github.com/TomGrobbe/vMenu/blob/0b1fae1f6b87d1fafbd0661ad85ceeacd14582d7/vMenu/CommonFunctions.cs#L1335)
-- in vMenu and add TriggerEvent("vMenu:SpawnVehicle", vehicleHash);  then build the c# project and replace the vMenuClient.net.dll in your vMenu server resource
-- https://wiki.gtanet.work/index.php?title=Vehicle_Models
AddEventHandler('vMenu:SpawnVehicle', function(vehicleHash)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

    -- all convertibles should spawn with lowered roof
    if IsVehicleAConvertible(vehicle) then
        LowerConvertibleRoof(vehicle, true)
    end

    -- only certain vehicles should spawn with lowered roof
    -- local convertibles = {'Windsor2'}
    -- local vehicleName = GetDisplayNameFromVehicleModel(vehicleHash)

    -- for i = 1, #convertibles, 1 do
    --     local currentCarName = convertibles[i]
    --     print(currentCarName)

    --     if string.upper(currentCarName) == vehicleName then
    --         local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    --         LowerConvertibleRoof(vehicle, true)
    --         break
    --     end
    -- end
end)

