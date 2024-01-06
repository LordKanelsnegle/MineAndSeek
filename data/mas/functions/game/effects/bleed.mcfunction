# EFFECT: BLEED
#  Purpose:
#    Handles the bleeding effect.
#  End Effect:
#    Applies minor damage (1/5th of a heart) and spawns "blood".
#  Called by:
#    game/effects/check_effect
#  Additional notes:
#    Assumes execution as target, at target. 

damage @s 0.2 minecraft:player_attack
setblock ~ ~ ~ minecraft:redstone_wire replace