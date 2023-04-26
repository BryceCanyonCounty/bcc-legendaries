fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'
author 'Jake2k4'

server_scripts {
    'server.lua',
}

shared_scripts {
    'config.lua',
    'locale.lua',
    'languages/*.lua',
}


client_scripts {
    '/client/functions.lua',
    '/client/client.lua',
    '/client/npcspawn.lua',
    '/client/shopped.lua',
    '/client/menusetup.lua',
    '/client/searches.lua',
    '/client/skinned.js',
    '/client/skinned.lua',
}

version '1.1.1'

dependency {
    'vorp_core',
    'vorp_inventory',
    'vorp_utils',
    'bcc-versioner',
    'menuapi'
}
