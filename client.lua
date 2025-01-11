local QBCore = exports['qb-core']:GetCoreObject()

-- Funktio, joka päivittää HUDin tietoja
function updateHUD()
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed) - 100

    -- Haetaan pelaajan tiedot QBcoresta
    local playerData = QBCore.Functions.GetPlayerData()
    local cash = playerData.money['cash'] or 0
    local bank = playerData.money['bank'] or 0
    local job = playerData.job.name or "Unemployed"
    local gang = playerData.gang.name or "None"  -- Haetaan pelaajan jengi
    local job2 = playerData.job2 and playerData.job2.name or "None"  -- Haetaan pelaajan toinen työ, jos on

    -- Lähetetään tiedot HTML:lle päivitettäväksi
    SendNUIMessage({
        type = 'updateStatus',
        status = {
            health = health,
            cash = cash,
            bank = bank,
            job = job,
            gang = gang,
            job2 = job2
        }
    })
end

-- Päivitä HUD jatkuvasti
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)  -- Päivittää kerran sekunnissa
        updateHUD()
    end
end)

-- Hudin näyttäminen automaattisesti, kun pelaaja on spawnannut
AddEventHandler('playerSpawned', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'showHUD' })
end)
