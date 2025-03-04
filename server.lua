local VorpCore = {}

TriggerEvent("getCore", function(core)
    VorpCore = core
end)

local function checkAndResetVW(source)
    local playerBucket = GetPlayerRoutingBucket(source) 
    local playerName = GetPlayerName(source)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if playerBucket and playerBucket ~= 0 then
        SetPlayerRoutingBucket(source, 0)
        print("[DEBUG] ["..currentTime.."] Player: "..playerName.." (ID: "..source..") was in VW "..playerBucket.." and it was reset to 0.")
        TriggerClientEvent('vorp:clientDebug', source, "[DEBUG] You have been automatically reset to Virtual World 0.")
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(30000) 

        local players = GetPlayers() 
        for _, playerId in ipairs(players) do
            local playerBucket = GetPlayerRoutingBucket(playerId)

            if playerBucket and playerBucket ~= 0 then 
                SetPlayerRoutingBucket(playerId, 0) 
                local playerName = GetPlayerName(playerId)
                local currentTime = os.date("%Y-%m-%d %H:%M:%S")
                print("[DEBUG] ["..currentTime.."] Player: "..playerName.." (ID: "..playerId..") was in VW "..playerBucket.." and it was reset to 0.")
                TriggerClientEvent('vorp:clientDebug', playerId, "[DEBUG] You have been automatically reset to Virtual World 0.")
            end
        end
    end
end)


AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local _source = source
    Wait(5000) 
    checkAndResetVW(_source)
end)

RegisterCommand('vw', function(source, args, rawCommand)
    local _source = source
    local playerBucket = GetPlayerRoutingBucket(_source)
    local playerName = GetPlayerName(_source)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    TriggerClientEvent('vorp:clientDebug', _source, "[DEBUG] ["..currentTime.."] You are in the Virtual World: "..playerBucket)
    TriggerClientEvent('chatMessage', _source, "[Virtual World]", {255, 255, 0}, "You are in the Virtual World: " .. playerBucket)
    print("[DEBUG] ["..currentTime.."] Player: "..playerName.." (ID: ".._source..") is in the Virtual World: "..playerBucket)
end, false)
