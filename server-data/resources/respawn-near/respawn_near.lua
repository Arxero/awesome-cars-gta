-- https://docs.fivem.net/docs/resources/baseevents/events/onPlayerDied/
AddEventHandler('baseevents:onPlayerDied', function(killerType, deathCoords)
    RespawnNear(deathCoords)
end)

-- https://docs.fivem.net/docs/resources/baseevents/events/onPlayerKilled/
AddEventHandler('baseevents:onPlayerKilled', function(killerId, deathData)
    RespawnNear(deathData.killerpos)
end)

function RespawnNear(deathCoords)
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
            foundGround = true
            break
        end
    end
    if not foundGround then
        newCoords.z = -300.0
    end

    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = newCoords.x,
            y = newCoords.y,
            z = newCoords.z
        })
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end
