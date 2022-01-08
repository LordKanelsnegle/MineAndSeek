# SETUP: MANSION
#  Purpose:
#    Handles all of the setup needed for the Mansion map at round start.
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
data merge block -13 31 57 {mode:"LOAD"}
setblock -13 30 57 minecraft:redstone_block destroy
data merge block -13 31 89 {mode:"LOAD"}
setblock -13 30 87 minecraft:redstone_block destroy
data merge block -13 31 121 {mode:"LOAD"}
setblock -13 30 121 minecraft:redstone_block destroy
data merge block 19 31 57 {mode:"LOAD"}
setblock 19 30 57 minecraft:redstone_block destroy
data merge block 19 31 89 {mode:"LOAD"}
setblock 19 30 89 minecraft:redstone_block destroy
data merge block 19 31 121 {mode:"LOAD"}
setblock 19 30 121 minecraft:redstone_block destroy
data merge block 51 31 57 {mode:"LOAD"}
setblock 51 30 57 minecraft:redstone_block destroy
data merge block 51 31 89 {mode:"LOAD"}
setblock 51 30 89 minecraft:redstone_block destroy
data merge block 51 31 121 {mode:"LOAD"}
setblock 51 30 121 minecraft:redstone_block destroy

#SET SPAWNPOINTS
summon minecraft:marker 21 35 59 {Tags:["mas.survivor_spawn","mas.entity"],Rotation:[0F,0F]}
summon minecraft:marker 21 35 89 {Tags:["mas.hunter_spawn","mas.entity"],Rotation:[180F,0F]}

#MAP SCHEDULES
schedule function mas:game/maps/music/mansion 45s
schedule function mas:game/maps/effects/lightning 45s