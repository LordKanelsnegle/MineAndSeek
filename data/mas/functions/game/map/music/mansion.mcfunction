# MUSIC: MANSION
#  Purpose:
#    Plays and loops the music for the Mansion map.
#  End Effect:
#    Plays music if we are still in a round, then waits for the right time to loop it.
#  Called by:
#    game//mansion
#  Additional notes:
#    None

#PLAY MUSIC
stopsound @a[tag=mas.player]
playsound minecraft:music_disc.pigstep master @a[tag=mas.player] ~ 1000 ~ 100 0.6 1

#LOOP EVERY 230 SECONDS
schedule function mas:game/map/music/masion 230s