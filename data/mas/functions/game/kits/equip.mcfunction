# EQUIP
#  Purpose:
#    Handles the kit equipping for the player.
#  End Effect:
#    Runs all of the equips for each kit.
#  Called by:
#    advancements/inv_changed
#  Additional notes:
#    Advancement MUST be revoked at the very end or else the equip functions will trigger it (causing a feedback loop)

#HUNTERS
execute if score @s mas.kit_ids = #SAVAGE mas.kit_ids run function mas:game/kits/hunters/savage/equip

#SURVIVORS


#REVOKE ADVANCEMENT
advancement revoke @s only mas:inv_changed