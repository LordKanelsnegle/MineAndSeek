# UTIL: UPDATE PIN
#  Purpose:
#    Updates entities that should be "pinned" to a player.
#  End Effect:
#    TPs the entity to the player's torso (roughly) and updates NBT to trigger a re-render.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    @s represents the pinned entity. Function is executed at player's location.

#UPDATE POSITION
tp @s ~ ~1 ~

#AIR TOGGLE TO FORCE IMMEDIATE POSITION UPDATE
execute store result entity @s Air byte 1 run time query gametime

#TODO (high): see what else can be util-ified