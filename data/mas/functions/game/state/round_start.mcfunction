# ROUND START
#  Purpose:
#    Initiates the actual round phase of the game, in which Survivors hide and Hunters seek.
#  End Effect:
#    Updates the game state, initializes the XP timer, sets the regen for Hunters, and begins the timers for
#    the five minute mark and per-second round ticks.
#  Called by:
#    game/logic/spawn_hunters
#  Additional notes:
#    The tick_second function MUST be the first scheduled so that it takes priority.

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #IN_GAME mas.enums

#XP INIT
xp set @a[tag=mas.player] 10 levels

#HUNTER REGEN
effect give @a[team=mas.hunter] minecraft:regeneration 9999 127 true

#SCHEDULES
schedule function mas:game/logic/tick_second 1s
schedule function mas:game/logic/xp_timer 60s
schedule function mas:game/logic/five_min_msg 300s