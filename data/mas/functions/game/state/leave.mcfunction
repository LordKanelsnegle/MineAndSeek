# LEAVE
#  Purpose:
#    Leaves a player from the game, due to player choice, player DC, or round end.
#  End Effect:
#    TP's the player back to the lobby, stops all sounds, leaves current team, removes all game tags, cleanses,
#    removes their markers, and sends a message.
#  Called by:
#    game/logic/dc_check, players/leave
#  Additional notes:
#    TP is done first to account for TP damage.
#    It's important that we kill the markers on leave so that there are less entities to check for id matching.
#    May be more efficient to combine the marker entity check and simply use mas.entity. TODO (medium): Return to this.

#TP BACK TO LOBBY
tp @s -399.5 35 803.5 0 0

#STOP SOUND
stopsound @s

#RESET SELF
team leave @s
tag @s remove mas.player
function mas:game/logic/cleanse
function mas:game/logic/reset_tags

#KILL MARKERS
execute at @s as @e[type=minecraft:marker,tag=mas.idle_marker] if score @s mas.ids = @p mas.ids run kill @s
execute at @s as @e[type=minecraft:marker,tag=mas.bounds_marker] if score @s mas.ids = @p mas.ids run kill @s

#RESET ID/IDLE
scoreboard players reset @s mas.ids
scoreboard players reset @s mas.counters

#SEND MESSAGE
tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" You have been removed from the game."}]