local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('tac-dumpdive:server:getThaLooty', function(carrot)
  local src = source
  local ply = QBCore.Functions.GetPlayer(src)

  local function getRandomItemFromTable(itemTable)
    local randIndex = math.random(1, #itemTable)
    return itemTable[randIndex]
  end

  local getItem = getRandomItemFromTable(Config.itemTable)
  ply.Functions.AddItem(getItem.item, getItem.amount)
  TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[getItem.item], 'add')

  if Config.addonItemsActive then
    local addonGetItem = getRandomItemFromTable(Config.addonItemsTable)
    ply.Functions.AddItem(addonGetItem.item, addonGetItem.amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[addonGetItem.item], 'add')
  end

  carrotTimer(src, carrot)
end)

function carrotTimer(id, obj)
  local peelingCarrot = 10 * 60000

  Citizen.CreateThread(function()
    while peelingCarrot > 0 do
      Wait(1000)
      peelingCarrot = peelingCarrot - 1000
      if peelingCarrot == 0 then
        TriggerClientEvent('tac-dumpdive:client:rDump', id, obj)
      end
    end
  end)
end
