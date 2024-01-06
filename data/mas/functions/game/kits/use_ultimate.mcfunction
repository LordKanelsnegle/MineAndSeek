# ULTIMATE EFFECTS
#  Purpose:
#    Handles the ultimate effects.
#  End Effect:
#    Runs all of the ultimates for each kit.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    Errors need to come first, since mas.ulted will be updated before the error check.

#ERRORS
title @s[scores={mas.ulted=1}] actionbar ["",{"text":"ULTIMATE HAS ALREADY BEEN USED"}]

#HUNTERS
execute if score @s[scores={mas.ulted=0}] mas.kit_ids = #SAVAGE mas.kit_ids run function mas:game/kits/hunters/savage/ultimate

#SURVIVORS
