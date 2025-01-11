fx_version 'cerulean' 
game 'gta5'


local expectedFolderName = 'dextys_hudi'
local currentFolderName = GetCurrentResourceName()

if currentFolderName ~= expectedFolderName then
    print('ERROR: Resource folder name is not correct! Expected folder name: ' .. expectedFolderName)
    return -- Estetään resurssin lataus, jos kansion nimi ei ole oikea
end

name 'Dextys HUD'
description 'A custom HUD for QBcore Framework'
author 'YourName'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'html/hud.html'

files {
    'html/hud.html',
    'htm
