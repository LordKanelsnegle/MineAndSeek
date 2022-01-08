# INSTALL
#  Purpose:
#    Handles all of the one-time setup needed for the datapack to function, such as scoreboards and teams.
#  End Effect:
#    Disables natural regen, enables immediate respawn, initializes the teams and scoreboards, then sends a
#    success message and a delayed info message.
#  Called by:
#    scripts/init
#  Additional notes:
#    There may be a workaround for the naturalRegeneration gamerule, and the immediateRespawn may not be necessary
#    for functionality. It would be nice if we could decouple these. TODO (low): Explore this.


#GAMERULES
gamerule naturalRegeneration false
gamerule doImmediateRespawn true

#TEAM CREATION
team add mas.survivor
team modify mas.survivor color blue
team modify mas.survivor friendlyFire false
team modify mas.survivor nametagVisibility hideForOtherTeams
team modify mas.survivor seeFriendlyInvisibles true
team add mas.hunter
team modify mas.hunter color dark_red
team modify mas.hunter friendlyFire false
team modify mas.hunter nametagVisibility hideForOtherTeams
team modify mas.hunter seeFriendlyInvisibles true

#SCOREBOARD SETUP
#mas.joined - used to check for player join (stat is updated on join, not leave)
scoreboard objectives add mas.joined minecraft.custom:minecraft.leave_game
#mas.death - used to detect survivor death
scoreboard objectives add mas.death deathCount
#mas.health - used to display living survivors' health in tablist
scoreboard objectives add mas.health health
#mas.ids - used to track player/tether pairs and the selected map
scoreboard objectives add mas.ids dummy
#mas.counters - used for tracking game state, player count, survivor count, and idles
scoreboard objectives add mas.counters dummy
#mas.bools - used for tracking datapack init and gamerules (created in init function)
scoreboard players set #init mas.bools 0
#mas.enums - used for storing constant integers
scoreboard objectives add mas.enums dummy
#  settings
scoreboard players set #ONE_HUNTER_LIMIT mas.enums 5
#  states
scoreboard players set #NO_GAME mas.enums 0
scoreboard players set #PRE_GAME mas.enums 1
scoreboard players set #IN_GAME mas.enums 2
scoreboard players set #POST_GAME mas.enums 3
#  maps
scoreboard players set #MANSION mas.enums 0
scoreboard players set #FARM mas.enums 1
scoreboard players set #LODGE mas.enums 2

#SET DEFAULT MAP AND UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #NO_GAME mas.enums
scoreboard players set #map mas.ids 0

#INSTALL MESSAGE
tellraw @a ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" Installation Successful!","color":"green"}]

#DELAYED INFO MESSAGE
schedule function mas:players/info 3s