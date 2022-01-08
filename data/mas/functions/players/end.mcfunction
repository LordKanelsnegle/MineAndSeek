# END
#  Purpose:
#    Allows the player to attempt to end the game prematurely.
#  End Effect:
#    Ends the game if it's in progress, sends an error message if it isn't.
#  Called by:
#    player
#  Additional notes:
#    None

#ATTEMPT TO END
execute if score #game_state mas.counters = #NO_GAME mas.enums run tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" There is no game in progress.","color":"red"}]
execute unless score #game_state mas.counters = #NO_GAME mas.enums run function #mas:forced_end