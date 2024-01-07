# EFFECTS: CHECK EFFECT
#  Purpose:
#    Checks if an over-time effect should be retriggered yet or not.
#  End Effect:
#    Runs the effect script corresponding to this effect if the effect's timer is a multiple of the effect's frequency.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    @s represents the Caster, @p represents the Castee.

#CHECK IF EFFECT SHOULD TRIGGER
scoreboard players operation #temp mas.counters = @s mas.counters
scoreboard players operation #temp mas.counters %= @s mas.constants

#COPY CURRENT CASTEE ID
scoreboard players operation #castee_id mas.castee_ids = @s mas.castee_ids

#CHECK WHICH EFFECT SHOULD TRIGGER
execute if score #temp mas.counters matches 0 if entity @s[tag=mas.bleed] as @a[tag=mas.player,team=!mas.spectator] if score @s mas.ids = #castee_id mas.castee_ids at @s run function mas:game/effects/bleed