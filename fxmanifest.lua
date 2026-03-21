fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
author 'T A C'
description 'Better PVP Syestem'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'damageconfig.lua',
    'recoilconfig.lua',
}
