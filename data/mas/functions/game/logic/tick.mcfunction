# TICK
#  Purpose:
#    Executes round-specific functionality that MUST be ran per tick.
#  End Effect:
#    Enforces game bounds, markers, and gamemodes. Additionally checks for deaths and win conditions.
#  Called by:
#    scripts/main
#  Additional notes:
#    Need to check death tickwise for death effects and spectator tp to work properly.
#    We check for !mas.hunter instead of mas.survivor so that people who join mid-game are 
#    turned into spectators. We also force gamemodes tickwise.
#    Ability effects MUST be after kit effects, to avoid accidentally clearing ability weakness.
#    TODO: The @a selectors can probably be grouped to avoid iterating through all players for every command.

#MARKER CHECK
execute as @e[type=minecraft:marker,tag=mas.entity,scores={mas.ids=0..}] run function mas:game/logic/marker_check

#BOUND EFFECTS
function mas:game/logic/bound_effects

#IDLING EFFECTS
execute as @a[team=mas.survivor,tag=!mas.spectator,scores={mas.counters=400..}] run function mas:game/logic/idle_effects

#DEATH CHECK
execute as @a[team=!mas.hunter,scores={mas.death=1..}] at @s run function mas:game/logic/death

#KIT CHECKS
execute as @a[tag=mas.player,tag=!mas.spectator] run function mas:game/kits/use_passive
execute as @a[tag=mas.player,tag=!mas.spectator,scores={mas.right_clicked=1},nbt={SelectedItemSlot:1}] run function mas:game/kits/use_active
execute as @a[tag=mas.player,tag=!mas.spectator,scores={mas.right_clicked=1},nbt={SelectedItemSlot:2}] run function mas:game/kits/use_ultimate
scoreboard players set @a[tag=mas.player] mas.right_clicked 0

#KIT EFFECTS
effect give @a[tag=mas.player,tag=!mas.spectator,nbt=!{SelectedItemSlot:0}] weakness 1 0 true
effect clear @a[tag=mas.player,tag=!mas.spectator,nbt={SelectedItemSlot:0}] weakness

#ABILITY EFFECTS
kill @e[type=minecraft:marker,tag=mas.effect,scores={mas.counters=..0}]
scoreboard players remove @e[type=minecraft:marker,tag=mas.effect] mas.counters 1
execute as @e[type=minecraft:marker,tag=mas.effect] run function mas:game/effects/check_effect

#ABILITY EFFECT CLEANUP
execute as @e[type=minecraft:area_effect_cloud,tag=mas.pin] at @s at @p run function mas:game/util/update_pins
kill @e[type=minecraft:armor_stand,tag=mas.surface_finder,nbt={OnGround:1b}]

#UPDATE ABILITY COOLDOWNS
scoreboard players remove @a[tag=mas.player,scores={mas.active_cd=1..}] mas.active_cd 1
scoreboard players remove @a[tag=mas.player,scores={mas.passive_cd=1..}] mas.passive_cd 1

#UPDATE ABILITY DURATIONS
scoreboard players remove @a[tag=mas.player,scores={mas.active_dur=1..}] mas.active_dur 1
scoreboard players remove @a[tag=mas.player,scores={mas.passive_dur=1..}] mas.passive_dur 1
scoreboard players remove @a[tag=mas.player,scores={mas.ult_dur=1..}] mas.ult_dur 1
scoreboard players remove @a[tag=mas.player,scores={mas.immune_dur=1..}] mas.immune_dur 1

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