# FARM: MUSIC
#  Purpose:
#    Plays and loops the music for the Farm map.
#  End Effect:
#    Plays music then waits for the right time to loop it.
#  Called by:
#    game/maps/music
#  Additional notes:
#    None

#PLAY MUSIC
stopsound @a[tag=mas.player]
playsound minecraft:music_disc.13 music @a[tag=mas.player] -1455.0 1000 -34.0 100 0.8 1

#LOOP EVERY 135 SECONDS
schedule function mas:game/maps/music 135s