# DEATH
#  Purpose:
#    Handles the case where a Survivor has been killed.
#  End Effect:
#    Turns the Survivor into a spectator, removing them from the Survivor team and reseting their death/health scores.
#  Called by:
#    game/logic/tick_second
#  Additional notes: 
#    None

#BLOODFX WHEN A SURVIVOR IS KILLED
particle block red_mushroom_block ~ ~1 ~ 0 0 0 1 200 normal

#SOUND WHEN A SURVIVOR IS KILLED
playsound entity.ravager.celebrate player @a[tag=mas.player] ~ ~1 ~ 1 1.2 1
playsound block.bell.resonate master @p[team=mas.hunters,predicate=mas:is_killer] ~ ~ ~ 0.2 0.5

#ADD SPECTATOR TAG
tag @s add mas.spectator

#TP ABOVE SURVIVOR SPAWN
execute at @e[type=minecraft:armor_stand,tag=mas.survivor_spawn,limit=1] run tp @s ~ ~30 ~ ~ 45

#SHOW SPECTATOR MESSAGE
title @s title ["",{"text":"SPECTATING","bold":true,"italic":true,"color":"white"}]

#DISMISS IDLING
#technically we dont need to delete idle marker for dead players cuz they get ignored (due to spectator tag), but its less entities to match ids against
execute at @s as @e[type=minecraft:armor_stand,tag=mas.idle_marker] if score @s mas.ids = @p mas.ids run kill @s
scoreboard players reset @s mas.counters

#RESET DEATHS/HEALTH
scoreboard players reset @s mas.death
scoreboard players reset @s mas.health

#LEAVE TEAM
#need to team leave in death function, cant just exclude spectators from counting functions cuz not all spectators are dead
team leave @s