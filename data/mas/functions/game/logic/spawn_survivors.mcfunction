# SPAWN SURVIVORS
#  Purpose:
#    Spawns the Survivors and schedules the Hunter spawning.
#  End Effect:
#    Survivors will be TP'd, a message will be shown to all players, and the Hunter spawn will be scheduled.
#  Called by:
#    game/state/start
#  Additional notes:
#    None

#TP TO SURVIVOR SPAWN
tp @a[team=mas.survivor] @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1]

#DISPLAY TEXT
title @a title ["",{"text":"SURVIVORS ESCAPED","bold":true,"italic":false,"color":"dark_blue"}]
title @a[team=mas.survivor] subtitle ["",{"text":"Run for your lives!","bold":true,"italic":false,"color":"blue"}]
title @a[team=mas.hunter] subtitle ["",{"text":"Prepare for the hunt!","bold":true,"italic":false,"color":"blue"}]

#SCHEDULE HUNTER SPAWN
schedule function mas:game/logic/spawn_hunters 15s