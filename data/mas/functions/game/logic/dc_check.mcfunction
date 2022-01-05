# DC CHECK
#  Purpose:
#    Handle the case where a player leaves after joining, to prevent item or effect exploitaiton.
#  End Effect:
#    Runs game/state/leave as all players tagged with mas.player who have rejoined.
#  Called by:
#    scripts/init, then itself
#  Additional notes:
#    Must be called during init since world/pack reloads clear schedules.

#FORCE PLAYER LEAVE
execute as @a[tag=mas.player] if score #game_state mas.counters = #NO_GAME mas.enums if score @s mas.joined matches 1.. run function mas:game/state/leave

#LOOP EVERY SECOND
schedule function mas:game/logic/dc_check 1s