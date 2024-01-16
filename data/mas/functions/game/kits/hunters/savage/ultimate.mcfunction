# SAVAGE: ULTIMATE
#  Purpose:
#    Handles the ultimate trigger for the Savage.
#  End Effect:
#    Sets ult duration and marks the player as having ulted.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    None

#SET ULT DURATION
scoreboard players set @s mas.ult_dur 8
scoreboard players operation @s mas.ult_dur *= #TICKS_PER_SECOND mas.constants

#IMMEDIATE ABILITY EFFECTS
execute as @a[team=mas.survivor] at @s run function mas:game/effects/paranoia
schedule function mas:game/util/clear_paranoia 8s replace

#SET ULTED TO TRUE
scoreboard players set @s mas.ulted 1