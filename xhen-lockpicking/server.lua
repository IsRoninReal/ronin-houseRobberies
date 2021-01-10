ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
 ESX = obj
end)

RegisterServerEvent('removeadvlockpick')
AddEventHandler('removeadvlockpick', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 if math.random(1, 75) == 1 then
  TriggerClientEvent('notification', source, 'The lockpick bent out of shape.', 2)
 end
end)
