# EFFECT: APPLY ONHIT
#  Purpose:
#    Handles the application of the onhit effects.
#  End Effect:
#    Spawns the necessary effects depending on Hunter class.
#  Called by:
#    advancements/hunter_hurt_survivor
#  Additional notes:
#    This will execute as the hUnter, so we need to check Hunter type (and whether or not their ability is active).
#    Checking @p with HurtTime also isn't guaranteed to be accurate, but reliable enough for now.
#    Lastly, we need to check immunity here since it's proactive (ie prevents application of effect instead of cleansing it).

#CHECK SAVAGE ONHIT EFFECT ,nbt={HurtTime:10s}
execute if score @s[scores={mas.active_dur=1..}] mas.kit_ids = #SAVAGE mas.kit_ids at @p[team=mas.survivor,scores={mas.immune_dur=0}] run function mas:game/effects/spawn_effect {tag:"mas.bleed",dur:100,freq:20}

#REVOKE ADVANCEMENT
advancement revoke @s only mas:hunter_hurt_survivor