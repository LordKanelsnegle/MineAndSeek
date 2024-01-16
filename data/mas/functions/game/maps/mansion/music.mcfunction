# MANSION: MUSIC
#  Purpose:
#    Plays and loops the music for the Mansion map.
#  End Effect:
#    Plays music then waits for the right time to loop it.
#  Called by:
#    game/maps/music
#  Additional notes:
#    None

#PLAY MUSIC
stopsound @a[tag=mas.player]
playsound minecraft:music_disc.pigstep music @a[tag=mas.player] -1455.0 1000 -34.0 100 0.6 1

#LOOP EVERY 230 SECONDS
schedule function mas:game/maps/music 230s