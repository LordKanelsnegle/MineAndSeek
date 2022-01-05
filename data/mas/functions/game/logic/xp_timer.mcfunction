# XP TIMER
#  Purpose:
#    Keeps player XP levels equal to the minutes left in a round.
#  End Effect:
#    Removes one XP level and schedules itself to loop again in a minute if still in game.
#  Called by:
#    game/state/round_start, then itself
#  Additional notes:
#    The schedule condition isn't technically needed since XP is only set after round start,
#    but it's a tiny optimization and doesn't hurt to have.

#XP UPDATE
xp add @a[tag=mas.player] -1 levels

#LOOP EVERY MINUTE
schedule function mas:game/logic/xp_timer 60s