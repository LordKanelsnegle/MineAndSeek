# SETUP: FARM
#  Purpose:
#    Handles all of the setup needed for the Farm map at round start.
#  End Effect:
#    Map is loaded via structure blocks, team spawnpoints are set, and music/effects/borders are scheduled
#    to kick in as the round starts.
#  Called by:
#    game/state/start
#  Additional notes:
#    The map loading method is specific to our world. To decouple it, we would need to setblock a
#    structure block with nbt data rather than doing data merge. In fact, that may be more efficient
#    anyway. TODO (medium): Explore this.
#    Also, if we do decouple from the world, then the boundaries and spawnpoints would also need to be
#    decoupled.
#    Lastly, the schedules use 45s here to align with the start of the round, so this should be updated
#    if the time for Hunter spawn is updated too. Ideally we find a way to do music/effect stuff
#    all from the round start function using predicates. TODO (low): Return to this.

#LOAD MAP
data merge block -61 26 60 {mode:"LOAD"}
setblock -61 25 60 minecraft:redstone_block destroy
data merge block -61 26 92 {mode:"LOAD"}
setblock -61 25 92 minecraft:redstone_block destroy
data merge block -29 26 60 {mode:"LOAD"}
setblock -29 25 60 minecraft:redstone_block destroy
data merge block -29 26 92 {mode:"LOAD"}
setblock -29 25 92 minecraft:redstone_block destroy

#SET SPAWNPOINTS
summon minecraft:marker -44 37 68 {Tags:["mas.survivor_spawn","mas.entity"],Rotation:[0F,0F]}
summon minecraft:marker -55 36 68 {Tags:["mas.hunter_spawn","mas.entity"],Rotation:[180F,0F]}

#MAP SCHEDULES
schedule function mas:game/maps/music/farm 45s
schedule function mas:game/maps/effects/lightning 45s