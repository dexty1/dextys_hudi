local QBCore = exports['qb-core']:GetCoreObject()

-- Lähetetään pelaajan tiedot asiakkaalle
RegisterServerEvent('qb-hud:getPlayerData')
AddEventHandler('qb-hud:getPlayerData', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local cash = Player.Functions.GetMoney('cash')  -- Haetaan käteinen
        local bank = Player.Functions.GetMoney('bank')  -- Haetaan pankkitili
        local job = Player.PlayerData.job.name  -- Haetaan pelaajan työ
        local gang = Player.PlayerData.gang.name or "None"  -- Haetaan pelaajan jengi
        local job2 = Player.PlayerData.job2 and Player.PlayerData.job2.name or "None"  -- Haetaan pelaajan toinen työ, jos on

        -- Lähetetään tiedot takaisin asiakkaalle
        TriggerClientEvent('qb-hud:updateClientData', src, {
            cash = cash,
            bank = bank,
            job = job,
            gang = gang,
            job2 = job2
        })
    end
end)
