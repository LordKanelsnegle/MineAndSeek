# SETUP
#  Purpose:
#    Runs the setup function for the selected map and TP's all markers to its Survivor spawnpoint.
#  End Effect:
#    Checks which map is selected and executes the setup for it accordingly.
#  Called by:
#    game/state/start
#  Additional notes:
#    This could've been done directly in the start function, but to keep all map-related stuff local to the 
#    map directory, they've been placed into their own function.
#    After map setup, its important to tp the markers to the survivor spawn, so that they aren't killed by
#    the bounds checks. The choice of survivor spawn is not arbitrary, as suvivors who escape the map during
#    pregame will get TP'd back to the survivor spawn this way.
#    If we check bounds during pregame as well, then killing entities here will be unnecessary. TODO (low):
#    Return to this.

#MAP-SPECIFIC SETUP
execute if score #map mas.ids = #MANSION mas.enums run function mas:game/map/mansion
execute if score #map mas.ids = #FARM mas.enums run function mas:game/map/farm

#TP MARKERS INTO BOUNDS
tp @e[type=minecraft:marker,tag=mas.entity] @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1]

#REMOVE ENTITIES
kill @e[x=-1503,y=18,z=-82,dx=95,dy=95,dz=95,type=!minecraft:player,tag=!mas.entity]