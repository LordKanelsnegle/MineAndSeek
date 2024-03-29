# ROUND START
#  Purpose:
#    Initiates the actual round phase of the game, in which Survivors hide and Hunters seek.
#  End Effect:
#    Updates the game state, sets the tablist health display, sets the regen for Hunters, and begins the
#    timers for the five minute mark and per-second round ticks.
#  Called by:
#    game/logic/spawn_hunters
#  Additional notes:
#    XP timer is set to 1 extra to account for the immediate removal of one level after pregame.

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #IN_GAME mas.constants

#SETDISPLAY FOR HEALTH
scoreboard objectives setdisplay list mas.health

#XP INIT
execute if predicate mas:map/is_small run xp set @a[tag=mas.player] 7 levels
execute if predicate mas:map/is_medium run xp set @a[tag=mas.player] 9 levels
execute if predicate mas:map/is_large run xp set @a[tag=mas.player] 11 levels
title @a[tag=mas.player,tag=!mas.spectator] actionbar "MINUTES TILL ROUND END:"

#HUNTER REGEN
effect give @a[team=mas.hunter] minecraft:regeneration infinite 127 true

#UPDATE HEALTH SCOREBOARD
effect give @a[team=mas.survivor] minecraft:wither 1 1 false
effect give @a[team=mas.survivor] minecraft:regeneration 1 100 false

#CLEAR RIGHT CLICKS
scoreboard players set @a[tag=mas.player] mas.right_clicked 0

#MAP MUSIC AND EFFECTS
function mas:game/maps/music
function mas:game/maps/effects

#SCHEDULES
execute if predicate mas:map/is_small run schedule function mas:game/logic/halfway_msg 180s
execute if predicate mas:map/is_medium run schedule function mas:game/logic/halfway_msg 240s
execute if predicate mas:map/is_large run schedule function mas:game/logic/halfway_msg 300s