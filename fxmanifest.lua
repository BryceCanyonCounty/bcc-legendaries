fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'
author 'Jake2k4 and BCC Team'

shared_scripts {
    'configs/*.lua',
    'locale.lua',
    'languages/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/functions.lua',
    'client/main.lua',
    'client/npc_spawn.lua',
    'client/animal_spawn.lua',
    'client/menu.lua',
    'client/searches.lua',
    'client/skinned.js',
    'client/skinned.lua'
}

dependency {
    'vorp_core',
    'vorp_inventory',
    'bcc-utils',
    'feather-menu'
}

version '2.0.1'
