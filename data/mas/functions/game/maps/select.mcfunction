# MAP SELECT
#  Purpose:
#    Selects the map based on the vote results.
#  End Effect:
#    Map ID is set according to last-highest score (randomly sorted).
#  Called by:
#    game/state/start
#  Additional notes:
#    None

#SET MAP ID BASED ON TAG
execute if entity @s[tag=mas.vote_swan] run scoreboard players operation #map mas.ids = #SWAN mas.constants
execute if entity @s[tag=mas.vote_lodge] run scoreboard players operation #map mas.ids = #LODGE mas.constants
execute if entity @s[tag=mas.vote_mansion] run scoreboard players operation #map mas.ids = #MANSION mas.constants
execute if entity @s[tag=mas.vote_farm] run scoreboard players operation #map mas.ids = #FARM mas.constants