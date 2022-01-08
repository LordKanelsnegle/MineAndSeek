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

#REMOVE SCOREBOARDS
scoreboard objectives remove mas.bools
scoreboard objectives remove mas.joined
scoreboard objectives remove mas.death
scoreboard objectives remove mas.health
scoreboard objectives remove mas.ids
scoreboard objectives remove mas.counters
scoreboard objectives remove mas.enums

#CLEAR SCHEDULES
schedule clear mas:game/logic/dc_check

#UNINSTALL MESSAGE
tellraw @a ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" Cleared all Mine and Seek data.","color":"yellow"}]