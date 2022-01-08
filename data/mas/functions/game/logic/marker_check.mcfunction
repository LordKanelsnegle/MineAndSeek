# MARKER CHECK
#  Purpose:
#    Executes the idle and border checks. Used to avoid ID matching twice.
#  End Effect:
#    Player idling and map boundaries will be checked.
#  Called by:
#    game/logic/tick_second
#  Additional notes:
#    @s represents the marker, @p represents the player.

#IDLE/BORDER MARKER CHECKS
execute if entity @s[tag=mas.idle_marker] run function mas:game/logic/idle_check
execute if entity @s[tag=mas.border_marker] run function mas:game/logic/border_check