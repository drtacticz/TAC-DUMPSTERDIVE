local QBCore = exports['qb-core']:GetCoreObject()

local searchCheck = {3423423424}


CreateThread(function()
    if Config.isTarget then
        exports['qb-target']:AddTargetModel(Config.areDumps, {
            options = {
                {
                    type = "client",
                    icon = Config.icons.baseIcon,
                    event = "tac-dumpdive:client:lookattarget",
                    label = "Look in dumpster",
                    targeticon = Config.icons.lookAt,
                }
            },
            distance = 1.4,
        })
    end
end)

RegisterNetEvent('tac-dumpdive:client:lookattarget', function()
    local player = PlayerPedId()
    local position = GetEntityCoords(player)
    local plyCanSearch = true

    for i = 1, #Config.areDumps do
        local carrot = GetClosestObjectOfType(position.x, position.y, position.z, 1.0, GetHashKey(Config.areDumps[i]), false, false, false)
        local carrotPos = GetEntityCoords(carrot)
        local carrotDist = GetDistanceBetweenCoords(position.x, position.y, position.z, carrotPos.x, carrotPos.y, carrotPos.z, true)

        if carrotDist < 1.8 and plyCanSearch then
            local carrotFound = false

            for j = 1, #searchCheck do
                if searchCheck[j] == carrot then
                    carrotFound = true
                    break
                end
            end

            if carrotFound then
                QBCore.Functions.Notify(Config.Err, 'error', 3000)
            else
                plyCanSearch = false
                QBCore.Functions.Progressbar('searching_dumpster', Config.Searching, (Config.timeLooking * 1000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_bum_bin@base",
                    anim = 'base'
                }, {}, {}, function()
                    TriggerServerEvent('tac-dumpdive:server:getThaLooty', carrot)
                    plyCanSearch = true
                    table.insert(searchCheck, carrot)
                    ClearPedTasks(player)
                end, function()
                    plyCanSearch = true
                    QBCore.Functions.Notify(Config.Stop, 'error', 3000)
                    ClearPedTasks(player)
                end)
            end
        end
    end
end)

RegisterNetEvent('tac-dumpdive:client:rDump', function(obj)
    for i = 1, #searchCheck do
        if searchCheck[i] == obj then
            table.remove(searchCheck, i)
        end
    end
end)
