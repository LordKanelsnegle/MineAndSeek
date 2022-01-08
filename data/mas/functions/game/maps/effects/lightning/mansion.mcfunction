# LIGHTNING: MANSION
#  Purpose:
#    Scramble the lightning marker using the Mansion boundaries.
#  End Effect:
#    Spawns the marker randomly in a radius, then loops itself until the marker position is within
#    the map's boundaries.
#  Called by:
#    game/maps/effects/lightning, then itself
#  Additional notes:
#    Using the predicate directly in the selector for the schedule condition may be more efficient. 
#    TODO (medium): Explore this.

#RANDOMIZE MARKER
spreadplayers 23 91 0 36 false @e[type=minecraft:marker,tag=mas.lightning,limit=1]
execute as @e[type=minecraft:marker,tag=mas.lightning,limit=1] unless predicate mas:maps/in_mansion_range run schedule function mas:game/maps/effects/lightning/mansion 1t