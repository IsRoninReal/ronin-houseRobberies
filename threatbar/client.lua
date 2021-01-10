function openGui(percent)
 local msg = "Sessiz"
 if percent > 80 then
  msg = "Tehlikeli"
  TriggerEvent('ym-dispatch:houserobbery')
 elseif percent > 60 then
  msg = "Güvenli Değil"
 elseif percent > 30 then
  msg = "Güvenli"
 end
 SendNUIMessage({runProgress = true, Length = percent, Task = msg})
end

function closeGui()
 SendNUIMessage({closeProgress = true})
end

local lastmessage = false

RegisterNetEvent("robbery:guiupdate")
AddEventHandler("robbery:guiupdate", function(percent)
 if not lastmessage then
  lastmessage = true
  openGui(percent)
  Citizen.Wait(2000)
  closeGui()
  Citizen.Wait(8500)
  lastmessage = false
 end
end)

RegisterNetEvent("robbery:guiclose")
AddEventHandler("robbery:guiclose", function()
 TriggerEvent("robbery:guiupdate",0)
 closeGui()
end)
