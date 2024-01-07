# EFFECT: BLEED
#  Purpose:
#    Handles the bleeding effect.
#  End Effect:
#    Applies minor damage (1/5th of a heart) and spawns "blood".
#  Called by:
#    game/effects/check_effect
#  Additional notes:
#    Assumes execution as target, at target. 
#    Blood puddle is riding on an armor stand to make it obey gravity, but the armor stand is cleaned up once its on the ground.

#DEAL DAMAGE
damage @s 0.4 minecraft:player_attack

#BLOOD EFFECT
summon minecraft:area_effect_cloud ~ ~1 ~ {Particle:"item redstone",Radius:0.7f,Duration:10,Tags:["mas.entity","mas.pin"]}

#BLOOD PUDDLE
summon minecraft:armor_stand ~ ~ ~ {Silent:1b,Invulnerable:1b,Invisible:1b,Tags:["mas.entity"],Passengers:[{id:"minecraft:block_display",Tags:["mas.entity","mas.surface_finder"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1f,-1.975f,-1f],scale:[2f,1f,2f]},block_state:{Name:"minecraft:redstone_wire"}}]}