# EFFECTS: SPAWN EFFECT
#  Purpose:
#    Handles the spawning of all effects.
#  End Effect:
#    Spawns a marker with the caster and castee UUIDs. The effect duration is added to the counter scoreboard.
#  Called by:
#    game/effects/apply_onhit (Hunter Caster, Survivor Castee)
#  Additional notes:
#    @s represents the Caster, @p represents the Castee.

#COPY CASTER AND CASTEE IDS
scoreboard players operation #caster_id mas.caster_ids = @s mas.ids
scoreboard players operation #castee_id mas.castee_ids = @p mas.ids

#DELETE OLD MARKER IF NON-STACKING ABILITY
$execute as @e[tag=$(tag)] if score @s mas.castee_ids = #castee_id mas.castee_ids run kill @s

#SPAWN NEW MARKER
$summon minecraft:marker ~ ~ ~ {Tags:["mas.entity","mas.empty_effect",$(tag)]}
$execute as @e[tag=mas.empty_effect,limit=1] run function mas:game/effects/init_marker {dur:$(dur),freq:$(freq)}