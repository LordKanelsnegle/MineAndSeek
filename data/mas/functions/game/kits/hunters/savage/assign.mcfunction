# SAVAGE: ASSIGN
#  Purpose:
#    Assigns the Savage kit to a player.
#  End Effect:
#    Player has their kit id set to the Savage kit id and their cooldowns are updated.
#  Called by:
#    command blocks
#  Additional notes:
#    None

#SET SAVAGE KIT
scoreboard players operation @s mas.kit_ids = #SAVAGE mas.kit_ids

#SET INVENTORY
function mas:game/kits/hunters/savage/equip