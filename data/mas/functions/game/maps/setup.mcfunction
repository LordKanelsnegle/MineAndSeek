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
#    the border checks. The choice of survivor spawn is not arbitrary, as suvivors who escape the map during
#    pregame will get TP'd back to the survivor spawn this way.

#MAP-SPECIFIC SETUP
execute if score #map mas.ids = #MANSION mas.enums run function mas:game/maps/mansion
execute if score #map mas.ids = #FARM mas.enums run function mas:game/maps/farm

#TP MARKERS INTO BOUNDS
tp @e[type=minecraft:marker,tag=mas.idle_marker] @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1]
tp @e[type=minecraft:marker,tag=mas.border_marker] @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1]