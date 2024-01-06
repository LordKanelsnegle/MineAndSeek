# EFFECT: INIT MARKER
#  Purpose:
#    Handles the initialization of an effect marker.
#  End Effect:
#    Adds the caster and castee to the marker then removes the tag marking the effect as empty.
#  Called by:
#    game/effects/spawn_effect
#  Additional notes:
#    @s represents the Marker, @p represents the Survivor. Assumes caster_id has been set by the calling function.

#STORE CASTER/CASTEE IDS
scoreboard players operation @s mas.caster_ids = #caster_id mas.caster_ids
scoreboard players operation @s mas.castee_ids = #castee_id mas.castee_ids

#SET TIMER AND FREQUENCY
$scoreboard players set @s mas.counters $(dur)
$scoreboard players set @s mas.constants $(freq)

#UPDATE EFFECT TAG
tag @s remove mas.empty_effect
tag @s add mas.effect