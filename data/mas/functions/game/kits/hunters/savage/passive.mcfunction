# SAVAGE: PASSIVE
#  Purpose:
#    Handles the passive trigger for the Savage.
#  End Effect:
#    Plays heartbeat sounds at nearby Survivors and provides a speed boost to the Savage if he's near.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    None

#HEARTBEAT SOUND
# execute at @a[team=mas.survivor,distance=..3] run playsound entity.warden.heartbeat player @s ~ ~ ~ 0.6 0.8
# execute at @a[team=mas.survivor,distance=..4] run playsound entity.warden.heartbeat player @s ~ ~ ~ 0.4 0.8
# execute at @a[team=mas.survivor,distance=..5] run playsound entity.warden.heartbeat player @s ~ ~ ~ 0.2 0.8
# execute at @a[team=mas.survivor,distance=6..] run playsound entity.warden.heartbeat player @s ~ ~ ~ 0.1 0.8

#SPEED BOOST
# execute if entity @a[team=mas.survivor,distance=..5] run effect give @s speed 1 0 true

#SET PASSIVE DURATION
scoreboard players set @s mas.passive_dur 1
scoreboard players operation @s mas.passive_dur *= #TICKS_PER_SECOND mas.constants

#SET PASSIVE CD
scoreboard players set @s mas.passive_cd 1
scoreboard players operation @s mas.passive_cd *= #TICKS_PER_SECOND mas.constants