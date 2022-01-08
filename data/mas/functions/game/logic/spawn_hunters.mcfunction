# SPAWN HUNTERS
#  Purpose:
#    Spawns the Hunters and initiates the round.
#  End Effect:
#    Hunters will be TP'd, a message will be shown to all players, and the round start will trigger.
#  Called by:
#    game/logic/spawn_survivors
#  Additional notes:
#    None

#TP TO HUNTER SPAWN
tp @a[team=mas.hunter] @e[type=minecraft:marker,tag=mas.hunter_spawn,limit=1]

#DISPLAY TEXT
title @a title ["",{"text":"HUNTERS RELEASED","bold":true,"italic":false,"color":"dark_red"}]
title @a[team=mas.survivor] subtitle ["",{"text":"We smell your fear...","bold":true,"italic":false,"color":"red"}]
title @a[team=mas.hunter] subtitle ["",{"text":"Bleed them dry!","bold":true,"italic":false,"color":"red"}]

#TRIGGER ROUND START
function mas:game/state/round_start