fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'sg-guncrafting'
author 'Tao / Southgate'
description 'Modular guncrafting script for QBox and QBCore / ESX via Bridge'
version '1.0.0'


shared_scripts {
    '@ox_lib/init.lua',
    'bridge/loader.lua',
    'shared/*.lua'
}

client_scripts {
    'bridge/client/*.lua',
    'client/*.lua'
}

server_scripts {
    'bridge/server/*.lua',
    'server/*.lua'
}

files {
    
}

dependencies {
    'ox_lib'
}
