# TICK SECOND
#  Purpose:
#    Executes round-specific functionality that can be run per second instead of per tick.
#  End Effect:
#    Checks for deaths, idling, team player counts (for win conditions), and forces gamemodes.
#  Called by:
#    game/state/round_start
#  Additional notes:
#    Idle check code could be made into a function to avoid two checks. TODO (low): Return to this.
#    We force spectator mode for a tag, not a team, because some spells use it.
#    Loop code MUST check game state because otherwise the scheduling occurs AFTER the schedule is
#    cleared in round end, even after moving it to the top (maybe the round end code takes more than
#    1 sec?).

#DEATH CHECK
execute as @a[scores={mas.death=1..}] run function mas:game/logic/death

#IDLE CHECK
execute at @a[team=mas.survivor,tag=!mas.spectator] as @e[type=minecraft:armor_stand,tag=mas.idle_marker,scores={mas.ids=0..}] if score @p mas.ids = @s mas.ids run function mas:game/logic/idle_check
title @a[team=mas.survivor,scores={mas.counters=25}] title ["",{"text":"Warning","bold":false,"italic":false,"color":"white"}]
title @a[team=mas.survivor,scores={mas.counters=25}] subtitle ["",{"text":"You will be revealed soon unless you move!","bold":false,"italic":false,"color":"white"}]
effect give @a[team=mas.survivor,scores={mas.counters=30..}] minecraft:glowing 1 0 true
title @a[team=mas.survivor,scores={mas.counters=30..}] actionbar ["",{"text":"YOU ARE VISIBLE - Move to stay hidden!","bold":false,"italic":false,"color":"white"}]

#SURVIVOR COUNT
scoreboard players set #survivors mas.counters 0
execute as @a[team=mas.survivor] run scoreboard players add #survivors mas.counters 1
execute if score #survivors mas.counters matches 0 run function mas:game/logic/win_hunters

#HUNTER COUNT
scoreboard players set #hunters mas.counters 0
execute as @a[team=mas.hunter] run scoreboard players add #hunters mas.counters 1
execute if score #hunters mas.counters matches 0 run function mas:game/logic/win_survivors

#FORCE GAMEMODES
gamemode spectator @a[tag=mas.player,tag=mas.spectator]
gamemode adventure @a[tag=mas.player,tag=!mas.spectator]

#LOOP EVERY SECOND
execute if score #game_state mas.counters = #IN_GAME mas.enums run schedule function mas:game/logic/tick_second 1s