# SAVAGE: ACTIVE
#  Purpose:
#    Handles the active trigger for the Savage.
#  End Effect:
#    x
#  Called by:
#    game/logic/tick
#  Additional notes:
#    Instant, one-time effects should happen here. 

#SET ACTIVE DURATION
scoreboard players set @s mas.active_dur 8
scoreboard players operation @s mas.active_dur *= #TICKS_PER_SECOND mas.constants

#SET ACTIVE CD
scoreboard players set @s mas.active_cd 40
scoreboard players operation @s mas.active_cd *= #TICKS_PER_SECOND mas.constants