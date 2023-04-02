fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

server_scripts {
    'server.lua',
}

shared_scripts {
    'config.lua',
    'locale.lua',
    'languages/*.lua',
}


client_scripts {
    '/client/client.lua',
    '/client/npcspawn.lua',
    '/client/warmenu.lua',
    '/client/shopped.lua',
    '/client/menusetup.lua',
    '/client/searches.lua',
    '/client/skinned.js',
    '/client/skinned.lua',
}

version '1.1.0'

dependency 'vorp_core'
