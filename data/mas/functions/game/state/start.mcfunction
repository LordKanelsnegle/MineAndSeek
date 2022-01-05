# START
#  Purpose:
#    Initiates the locker phase of the game, in which players choose their classes.
#  End Effect:
#    Updates the game state, sets the tablist health display, assigns the teams, triggers the
#    setup function corresponding to the chosen map, TP's the players to the lockers, shows them
#    messages, and schedules the function for spawning the Survivors into the map.
#  Called by:
#    players/start
#  Additional notes:
#    The TP's and messages could be split into two team_init functions to avoid using the same selector
#    several times, which may be more efficient. Same goes for the selector checks in player setup.
#    TODO (medium): Return to this.
#    After map setup, its important to tp the markers to the survivor spawn, so that they aren't killed by
#    the border checks. The choice of survivor spawn is not arbitrary, as suvivors who escape the map during
#    pregame will get TP'd back to the survivor spawn this way.

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #PRE_GAME mas.enums

#SETDISPLAY FOR HEALTH
scoreboard objectives setdisplay list mas.health

#PLAYER SETUP
execute if score #players mas.counters <= #ONE_HUNTER_LIMIT mas.enums run team join mas.hunter @a[tag=mas.player,sort=random,limit=1]
execute if score #players mas.counters > #ONE_HUNTER_LIMIT mas.enums run team join mas.hunter @a[tag=mas.player,sort=random,limit=2]
team join mas.survivor @a[tag=mas.player,team=!mas.hunter]
execute as @a[tag=mas.player] run function mas:game/logic/cleanse
scoreboard players reset @a[tag=mas.player] mas.death

#MAP SETUP
execute if score #map mas.ids = #MANSION mas.enums run function mas:game/maps/mansion
execute if score #map mas.ids = #FARM mas.enums run function mas:game/maps/farm
tp @e[type=minecraft:armor_stand,tag=mas.idle_marker] @e[type=minecraft:armor_stand,tag=mas.survivor_spawn,limit=1]
tp @e[type=minecraft:armor_stand,tag=mas.border_marker] @e[type=minecraft:armor_stand,tag=mas.survivor_spawn,limit=1]

#INIT LOCKER PHASE
tp @a[team=mas.survivor] 1 43 34 -90 0
title @a[team=mas.survivor] title ["",{"text":"Survivor","bold":true,"italic":false,"color":"dark_blue"}]
title @a[team=mas.survivor] subtitle ["",{"text":"You have 30s to pick a class","bold":true,"italic":false,"color":"blue"}]
tp @a[team=mas.hunter] 1 53 34 -90 0
title @a[team=mas.hunter] title ["",{"text":"Hunter","bold":true,"italic":false,"color":"dark_red"}]
title @a[team=mas.hunter] subtitle ["",{"text":"You have 45s to pick a class","bold":true,"italic":false,"color":"red"}]

#SCHEDULE SURVIVOR SPAWN
schedule function mas:game/logic/spawn_survivors 30s