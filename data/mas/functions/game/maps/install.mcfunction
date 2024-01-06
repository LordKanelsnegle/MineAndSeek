# INSTALL
#  Purpose:
#    Isolates map id setup from the install function to keep map related things in one folder.
#  End Effect:
#    Sets the ids for all of the maps during installation.
#  Called by:
#    scripts/install
#  Additional notes:
#    Small maps should have id 0-9, medium is 10-19, large is 20-29.

#SET MAP IDS
scoreboard players set #SWAN mas.constants 10
scoreboard players set #LODGE mas.constants 11
scoreboard players set #MANSION mas.constants 20
scoreboard players set #FARM mas.constants 21

#SET DEFAULT MAP
scoreboard players operation #map mas.ids = #MANSION mas.constants