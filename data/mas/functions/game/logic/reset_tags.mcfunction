# RESET TAGS
#  Purpose:
#    Removes all tags (except mas.player) from a player, since there is no command to remove all tags.
#  End Effect:
#    Player will have all tags removed from themselves except mas.player.
#  Called by:
#    game/state/leave
#  Additional notes:
#    This will eventually also be used by the kit functions, which is why it's in its own function.
#    TODO (low): Update this comment when applicable.

#SURVIVOR TAGS
tag @s remove mas.archer
tag @s remove mas.luckster
tag @s remove mas.medic
tag @s remove mas.ninja
tag @s remove mas.sabotager
tag @s remove mas.spy
tag @s remove mas.tamer
tag @s remove mas.spectator

#HUNTER TAGS
tag @s remove mas.samurai
tag @s remove mas.savage
tag @s remove mas.sniper