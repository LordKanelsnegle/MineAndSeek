# EFFECTS: LIGHTNING
#  Purpose:
#    Summons lightning periodically, at random positions around the map, throughout the round.
#  End Effect:
#    Spawns a lightning marker if it doesn't exist already, summons lightning at its location, then
#    scrambles the marker location and loops every 30 seconds.
#  Called by:
#    game/maps/farm or game/maps/mansion, then itself
#  Additional notes:
#    We could summon the marker at round start to avoid calling the spawn check repeatedly, but it's 
#    probably better for effects to be self-contained. TODO (low): Decide if this is actually true.
#    Also, if we use preset map sizes, we can spreadplayers using the assumption of the largest map's
#    boundaries then simply use an alternatives predicate to check if it's in range, to avoid checking
#    map enum here and needing two separate functions. We could also just use conditional execution on
#    the map id for the spreadplayers part. TODO (medium): Explore this.

#SPAWN MARKER IF NOT SPAWNED
#could summon in map setup to avoid calling this repeatedly, but i want effects to be self-contained
execute unless entity @e[type=minecraft:armor_stand,tag=mas.lightning,limit=1] at @e[type=minecraft:armor_stand,tag=mas.hunter_spawn,limit=1] run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["mas.lightning","mas.entity"]}

#SUMMON LIGHTNING
execute at @e[type=minecraft:armor_stand,tag=mas.lightning,limit=1] run summon lightning_bolt ~ ~ ~ {Tags:["mas.entity"]}

#RANDOMIZE LOCATION
execute if score #map mas.ids = #MANSION mas.enums run function mas:game/maps/effects/lightning/mansion
execute if score #map mas.ids = #FARM mas.enums run function mas:game/maps/effects/lightning/farm

#LOOP EVERY 30 SECONDS
schedule function mas:game/maps/effects/lightning 30s