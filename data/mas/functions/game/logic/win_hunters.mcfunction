# WIN: HUNTERS
#  Purpose:
#    Handles the case in which Hunters have won the round, ie Survivor count reaches 0 before the timer does.
#  End Effect:
#    Triggers round end, displays text, plays win/loss sound effects, and summons fireworks.
#  Called by:
#    game/logic/tick_second
#  Additional notes:
#    We use the !mas.hunter check instead of mas.survivor because Survivors leave their team upon death, so there
#    are no players with team mas.survivor if Hunters win.

#TRIGGER ROUND END
function #mas:normal_end

#DISPLAY TEXT
title @a[tag=mas.player] title ["",{"text":"Hunters Win","bold":true,"italic":true,"color":"dark_red"}]
title @a[team=!mas.hunter] subtitle ["",{"text":"Better luck next time!","bold":true,"italic":false,"color":"red"}]
title @a[team=mas.hunter] subtitle ["",{"text":"GGWP!","bold":true,"italic":false,"color":"red"}]

#WIN/LOSS SOUND EFFECTS
execute at @a[team=mas.hunter] run playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 2
execute at @a[team=mas.survivor] run playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 0.8

#SHOW FIREWORKS
execute at @a[tag=mas.player] run summon minecraft:firework_rocket ^ ^1 ^1 {Life:0,LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Explosions:[{Type:4,Flicker:1b,Trail:1b,Colors:[I;11141120],FadeColors:[I;11141120]}]}}}}