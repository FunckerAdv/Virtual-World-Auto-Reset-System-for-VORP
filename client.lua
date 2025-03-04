RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    Wait(3000) 
    TriggerServerEvent('vorp:checkAndFixVW')
end)

-- Verificarea pe client a fost Eliminata!
--[[
Citizen.CreateThread(function()
    Wait(math.random(5000, 15000)) 
    while true do
        Wait(math.random(20000, 40000)) 
        TriggerServerEvent('vorp:checkAndFixVW') 
    end
end)
]]


RegisterNetEvent('vorp:clientDebug')
AddEventHandler('vorp:clientDebug', function(msg)
    print(msg)
end)
