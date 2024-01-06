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
#    SMALL maps must have ids from 0-9, MEDIUM maps must have ids from 10-19, LARGE maps must have ids from 20-29.


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
team add mas.spectator
team modify mas.spectator color dark_gray
team add mas.lobby
team modify mas.lobby color white

#SCOREBOARD SETUP
#mas.joined - used to check for player join (stat is updated on join, not leave)
scoreboard objectives add mas.joined minecraft.custom:minecraft.leave_game
#mas.death - used to detect survivor death
scoreboard objectives add mas.death deathCount
#mas.health - used to display living survivors' health in tablist
scoreboard objectives add mas.health health
#mas.ids - used to track player/tether pairs and the selected map
scoreboard objectives add mas.ids dummy
#mas.counters - used for voting, tracking game state, player count, survivor count, and idles
scoreboard objectives add mas.counters dummy
#mas.votes - used for voting (player facing)
scoreboard objectives add mas.votes dummy {"text":"Map Votes","color":"red"}
#mas.bools - used for tracking datapack init and gamerules (created in init function)
scoreboard players set #init mas.bools 0
#mas.constants - used for storing constant integers
scoreboard objectives add mas.constants dummy
#mas.right_clicked - used to check for player right click (using caos)
scoreboard objectives add mas.right_clicked minecraft.used:minecraft.carrot_on_a_stick
#mas.passive_cd - used for tracking remaining passive cooldown
scoreboard objectives add mas.passive_cd dummy
#mas.passive_dur - used for tracking remaining passive duration
scoreboard objectives add mas.passive_dur dummy
#mas.active_cd - used for tracking remaining active cooldown
scoreboard objectives add mas.active_cd dummy
#mas.active_dur - used for tracking remaining active duration
scoreboard objectives add mas.active_dur dummy
#mas.ulted - used for tracking who has used their ultimate
scoreboard objectives add mas.ulted dummy
#mas.ult_dur - used for tracking remaining ult duration
scoreboard objectives add mas.ult_dur dummy
#mas.immune_dur - used for tracking remaining debuff immunity duration
scoreboard objectives add mas.immune_dur dummy
#mas.kit_ids - used for tracking kits
scoreboard objectives add mas.kit_ids dummy
#mas.caster_ids - used for tracking spell caster
scoreboard objectives add mas.caster_ids dummy
#mas.castee_ids - used for tracking spell castee
scoreboard objectives add mas.castee_ids dummy
#  settings
scoreboard players set #MIN_PLAYERS mas.constants 2
scoreboard players set #MAX_PLAYERS mas.constants 20
scoreboard players set #SURVIVORS_PER_HUNTER mas.constants 3
#  states
scoreboard players set #NO_GAME mas.constants 0
scoreboard players set #LOCKER mas.constants 1
scoreboard players set #PRE_GAME mas.constants 2
scoreboard players set #IN_GAME mas.constants 3
scoreboard players set #POST_GAME mas.constants 4
#  maps
function mas:game/maps/install
# math constants
scoreboard players set #TICKS_PER_SECOND mas.constants 20
#  kits
function mas:game/kits/install
function mas:game/abilities/install

#SET GAME STATE
scoreboard players operation #game_state mas.counters = #NO_GAME mas.constants

#SHOW VOTE DISPLAY
scoreboard objectives setdisplay sidebar.team.white mas.votes

#INSTALL MESSAGE
tellraw @a ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" Installation Successful!","color":"green"}]

#DELAYED INFO MESSAGE
schedule function mas:players/info 3s