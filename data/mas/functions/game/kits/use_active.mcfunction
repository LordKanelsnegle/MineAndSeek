# ACTIVE EFFECTS
#  Purpose:
#    Handles the active effects.
#  End Effect:
#    Runs all of the actives for each kit.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    Errors need to come first, since mas.active_cd will be updated before the error check.

#ERRORS
scoreboard players operation #cd_sec mas.active_cd = @s mas.active_cd
scoreboard players operation #cd_sec mas.active_cd /= #TICKS_PER_SECOND mas.constants
scoreboard players add #cd_sec mas.active_cd 1
title @s[scores={mas.active_cd=1..}] actionbar ["",{"text":"ACTIVE ON COOLDOWN: "},{"score":{"name":"#cd_sec","objective":"mas.active_cd"},"bold":true},{"text":" SECONDS"}]

#HUNTERS
execute if score @s[scores={mas.active_cd=0}] mas.kit_ids = #SAVAGE mas.kit_ids run function mas:game/kits/hunters/savage/active

#SURVIVORS
