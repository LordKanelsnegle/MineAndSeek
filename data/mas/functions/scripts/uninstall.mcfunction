# UNINSTALL
#  Purpose:
#    Essentially undoes what the install function does, aiming to reset the datapack's impact on the world.
#  End Effect:
#    Ends any existing rounds to trigger cleanup, deletes teams and scoreboards, clears the dc_check schedule, 
#    then sends a success message.
#  Called by:
#    player
#  Additional notes:
#    None

#EXECUTE CLEANUP
function #mas:forced_end

#REMOVE TEAMS
team remove mas.survivor
team remove mas.hunter
team remove mas.spectator
team remove mas.lobby

#REMOVE SCOREBOARDS
scoreboard objectives remove mas.bools
scoreboard objectives remove mas.joined
scoreboard objectives remove mas.death
scoreboard objectives remove mas.health
scoreboard objectives remove mas.ids
scoreboard objectives remove mas.counters
scoreboard objectives remove mas.votes
scoreboard objectives remove mas.constants
scoreboard objectives remove mas.right_clicked
scoreboard objectives remove mas.passive_cd
scoreboard objectives remove mas.passive_dur
scoreboard objectives remove mas.active_cd
scoreboard objectives remove mas.active_dur
scoreboard objectives remove mas.ulted
scoreboard objectives remove mas.ult_dur
scoreboard objectives remove mas.immune_dur
scoreboard objectives remove mas.kit_ids
scoreboard objectives remove mas.caster_ids
scoreboard objectives remove mas.castee_ids

#CLEAR SCHEDULES
schedule clear mas:game/logic/dc_check

#UNINSTALL MESSAGE
tellraw @a ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" Cleared all Mine and Seek data.","color":"yellow"}]