# INFO
#  Purpose:
#    Prints information about the datapack to the chat.
#  End Effect:
#    Toggles the sendCommandFeedback gamerule, sends the information, then resets the gamerule through
#    a function call.
#  Called by:
#    scripts/install, player
#  Additional notes:
#    This function has different target selectors depending on where it's being called from. We could optimize
#    this by merging the checks for an init of 0. TODO (low): Return to this.

#TOGGLE GAMERULE
execute store result score #gr_scf mas.bools run gamerule sendCommandFeedback
gamerule sendCommandFeedback false

#SEND MESSAGE
execute as @a if score #init mas.bools matches 0 run tellraw @s ["",{"text":"----------------","color":"gray"},{"text":" Mine and Seek","bold":true,"color":"blue"},{"text":" ----------------","color":"gray"},{"text":"\n\n                      Datapack Version: "},{"text":"1.0","color":"gold"},{"text":"\n                     Minecraft Version: "},{"text":"1.20","color":"green"},{"text":"\n                    Team Lead: "},{"text":"EternalLawn","color":"yellow"},{"text":"\n                  Developer: "},{"text":"LordKanelsnegle","color":"dark_aqua"},{"text":"\n                Map Design: "},{"text":"Vazurer","color":"dark_purple"},{"text":", "},{"text":"H0rizon5","color":"dark_purple"},{"text":"\n\n   "},{"text":"Many thanks to all of our testers and friends too!","color":"light_purple"},{"text":"\n"},{"text":"-----------------------------------------------","color":"gray"}]
execute if score #init mas.bools matches 1 run tellraw @s ["",{"text":"----------------","color":"gray"},{"text":" Mine and Seek","bold":true,"color":"blue"},{"text":" ----------------","color":"gray"},{"text":"\n\n                      Datapack Version: "},{"text":"1.0","color":"gold"},{"text":"\n                     Minecraft Version: "},{"text":"1.20","color":"green"},{"text":"\n                    Team Lead: "},{"text":"EternalLawn","color":"yellow"},{"text":"\n                  Developer: "},{"text":"LordKanelsnegle","color":"dark_aqua"},{"text":"\n                Map Design: "},{"text":"Vazurer","color":"dark_purple"},{"text":", "},{"text":"H0rizon5","color":"dark_purple"},{"text":"\n\n   "},{"text":"Many thanks to all of our testers and friends too!","color":"light_purple"},{"text":"\n"},{"text":"-----------------------------------------------","color":"gray"}]
execute if score #init mas.bools matches 0 run scoreboard players set #init mas.bools 1

#RESET GAMERULE
schedule function mas:scripts/gr_scf 1t