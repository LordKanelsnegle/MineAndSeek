schedule function mas:tests/tick 1t
execute at @e[type=minecraft:marker,tag=mas.idle_marker] run particle minecraft:angry_villager ~ ~ ~ 0 0 0 10 10
execute at @e[type=minecraft:marker,tag=mas.border_marker] run particle minecraft:ambient_entity_effect ~ ~ ~ 0 0 0 10 10