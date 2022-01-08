# CLEANUP
#  Purpose:
#    Reduce redundant code between round_end and end by executing code common to both here instead and using tags.
#  End Effect:
#    Kills all game entities and clears all round-specific schedules.
#  Called by:
#    #mas:forced_end, #mas:normal_end
#  Additional notes:
#    None

#REMOVE GAME ENTITIES
kill @e[tag=mas.entity]

#CLEAR ROUND SCHEDULES
schedule clear mas:game/logic/xp_timer
schedule clear mas:game/logic/five_min_msg
schedule clear mas:game/logic/one_min_msg
schedule clear mas:game/logic/win_survivors