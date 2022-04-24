AddEventHandler('baseevents:onPlayerDied', function(killerType, deathCoords)
    local x, y, z = table.unpack(deathCoords)
    local radius = 200
    local newCoords = {
        x = math.random(math.floor(x) - radius, math.floor(x) + radius),
        y = math.random(math.floor(y) - radius, math.floor(y) + radius),
        z = z -- This one doesn't matter because your going to recalculate it below
    }

    local ped = PlayerPedId()
    local foundGround = false

    for i = 0, 1000, 25 do
        local timer = GetGameTimer()

        while not HasCollisionLoadedAroundEntity(ped) do
            -- Break out of the loop if it takes too long
            if GetGameTimer() - timer > 1000 then
                break
            end
            Citizen.Wait(0)
        end

        if GetGroundZFor_3dCoord(ToFloat(newCoords.x), ToFloat(newCoords.y), ToFloat(i), newCoords.z, false) then
            newCoords.z = ToFloat(i)
            foundGround = false
            break
        end
    end
    -- local foundGround, groundZ = getGroundZ(newCoords)
    if not foundGround then
        -- If the loop ends but the ground z coord has not been found yet, then get the nearest vehicle node as a fail-safe coord.
        -- newCoords.z = -300.0
        print('came here')

        local heading, vector = GetNthClosestVehicleNode(ToFloat(newCoords.x), ToFloat(newCoords.y), ToFloat(newCoords.z), radius, 0, 0, 0)
        local sX, sY, sZ = table.unpack(vector)
        _, groundZ = getGroundZ({x = sX, y = sY, z = sZ})
        -- newCoords.z = sZ
    end


    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = newCoords.x,
            y = newCoords.y,
            z = groundZ
        })
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

function getGroundZ(coords)
    local ped = PlayerPedId()
    local foundGround = false
    local groundZ = -300.0

    for i = 0, 1000, 25 do
        local timer = GetGameTimer()

        while not HasCollisionLoadedAroundEntity(ped) do
            -- Break out of the loop if it takes too long
            if GetGameTimer() - timer > 1000 then
                break
            end
            Citizen.Wait(0)
        end

        if GetGroundZFor_3dCoord(ToFloat(coords.x), ToFloat(coords.y), ToFloat(i), coords.z, false) then
            groundZ = ToFloat(i)
            foundGround = true
            print('came here 2')

            break
        end
    end

    return foundGround, groundZ
end

