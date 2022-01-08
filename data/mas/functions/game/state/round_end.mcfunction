# ROUND END
#  Purpose:
#    Handles code that should run at round end irrespective of which team won.
#  End Effect:
#    Updates the game state, tags everyone as spectator, and triggers the game end to run in 7 seconds.
#  Called by:
#    #mas:normal_end
#  Additional notes:
#    This function is called (indirectly) by tick_second, the highest priority scheduled function, so the round 
#    schedule clears should be guaranteed to work (in the case of a natural round end).

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #POST_GAME mas.enums

#SET ALL TO SPECTATOR
tag @a[tag=mas.player] add mas.spectator

#TRIGGER GAME END
schedule function mas:game/state/end 7s