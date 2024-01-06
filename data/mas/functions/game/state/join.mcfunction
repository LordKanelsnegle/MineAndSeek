# JOIN
#  Purpose:
#    Joins a player to the game, either as a player or a spectator (depending on the game state).
#  End Effect:
#    Tags the player, sets their id, spawns their markers and sets their ids to match, then sends a 
#    success message.
#  Called by:
#    players/join
#  Additional notes:
#    Could potentially allow players to join alive during the locker phase.
#    The entity check for setting the ids of the markers is also used twice, so it could be turned into
#    its own function to optimize it. TODO (low): Return to this.
#    Also, the reason we have the execute conditions for the bounds marker is because we don't want the
#    bounds marker to be deleted by the bound effects, but we don't really care about the idle marker (since
#    joining mid-game will set you to spectator anyway). Lastly, we need to reset immunity here because we
#    need to be able to check it within a selector for all players (so it needs a default value).

#ADD PLAYER TAG
tag @s add mas.player

#RESET DC CHECK AND IMMUNITY
scoreboard players reset @s mas.joined
scoreboard players set @s mas.immune_dur 0

#SET ID
scoreboard players operation @s mas.ids = #curr_id mas.counters
scoreboard players add #curr_id mas.counters 1

#SPAWN PLAYER MARKERS
summon minecraft:marker ~ ~ ~ {Tags:["mas.idle_marker","mas.unclaimed","mas.entity"]}
execute if score #game_state mas.counters = #NO_GAME mas.constants run summon minecraft:marker ~ ~ ~ {Tags:["mas.bounds_marker","mas.unclaimed","mas.entity"]}
execute unless score #game_state mas.counters = #NO_GAME mas.constants at @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1] run summon minecraft:marker ~ ~30 ~ {Tags:["mas.bounds_marker","mas.unclaimed","mas.entity"]}
scoreboard players operation @e[type=minecraft:marker,tag=mas.entity,tag=mas.unclaimed,limit=2] mas.ids = @s mas.ids
tag @e[type=minecraft:marker,tag=mas.entity,tag=mas.unclaimed,limit=2] remove mas.unclaimed

#JOINED DURING LOCKER, PREGAME, OR POSTGAME
execute unless score #game_state mas.counters = #NO_GAME mas.constants run function mas:game/logic/spectate

#MESSAGE
tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" You have joined the game.","color":"green"}]