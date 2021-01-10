local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    
	ESX.PlayerData = ESX.GetPlayerData()
end)


AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not ESX.IsPlayerLoaded() do
			Citizen.Wait(0)
        end
    end)
end)