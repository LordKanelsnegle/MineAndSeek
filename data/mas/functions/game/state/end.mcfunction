# ROUND END
#  Purpose:
#    Handles the cleanup process at the end of the round.
#  End Effect:
#    Updates the game state, resets the id counter, forces all players to leave, clears game schedules, and resets the 
#    scoreboard display.
#  Called by:
#    game/state/round_end
#  Additional notes:
#    Ideally we should restore whatever the old scoreboard display was rather than resetting it. TODO (low): Return to this.
#    Also, the schedule clearing for the maps should only be done if there are preset map sizes (finite number of functions).
#    TODO (medium): Return to this.
#    Lastly, player commands take priority over functions, so the premature end schedule clears are guaranteed to work.
#    The map functions are all run before this one, so they should have set their schedules before this function is called, 
#    hence map schedule clearing should be guaranteed too.

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #NO_GAME mas.enums

#RESET ID COUNT
scoreboard players set #curr_id mas.counters 0

#FORCE PLAYER LEAVE
execute as @a[tag=mas.player] run function mas:game/state/leave

#REMOVE GAME ENTITIES
kill @e[tag=mas.entity]

#CLEAR PREMATURE END SCHEDULES
schedule clear mas:game/logic/spawn_survivors
schedule clear mas:game/logic/spawn_hunters
schedule clear mas:game/state/end

#CLEAR MAP SCHEDULES
schedule clear mas:game/map/music/mansion
schedule clear mas:game/map/music/farm
schedule clear mas:game/map/effects/lightning

#CLEAR HEALTH DISPLAY
scoreboard objectives setdisplay list

#SHOW VOTE DISPLAY
scoreboard objectives setdisplay sidebar.team.white mas.votes