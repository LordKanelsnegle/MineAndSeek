# PASSIVE EFFECTS
#  Purpose:
#    Handles the passive effects.
#  End Effect:
#    Runs all of the passives for each kit.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    None

#HUNTERS
execute if score @s[scores={mas.passive_cd=0}] mas.kit_ids = #SAVAGE mas.kit_ids run function mas:game/kits/hunters/savage/passive

#SURVIVORS
