# MUSIC: FARM
#  Purpose:
#    Plays and loops the music for the Farm map.
#  End Effect:
#    Plays music if we are still in a round, then waits for the right time to loop it.
#  Called by:
#    game/maps/farm
#  Additional notes:
#    None

#PLAY MUSIC
playsound minecraft:music_disc.13 music @a ~ 1000 ~ 100 0.8 1

#LOOP EVERY 135 SECONDS
schedule function mas:game/maps/music/farm 135s