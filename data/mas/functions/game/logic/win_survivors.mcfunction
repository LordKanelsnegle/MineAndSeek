# WIN: SURVIVORS
#  Purpose:
#    Handles the case in which Survivors have won the round, ie Hunter count reaches 0 or the timer does.
#  End Effect:
#    Triggers round end, displays text, plays win/loss sound effects, and summons fireworks.
#  Called by:
#    game/logic/tick_second, game/logic/one_min_msg
#  Additional notes:
#    None

#TRIGGER ROUND END
function #mas:normal_end

#DISPLAY TEXT
title @a[tag=mas.player] title ["",{"text":"Survivors Win","bold":true,"italic":true,"color":"dark_blue"}]
title @a[team=mas.survivor] subtitle ["",{"text":"GGWP!","bold":true,"italic":false,"color":"blue"}]
title @a[team=mas.hunter] subtitle ["",{"text":"Better luck next time!","bold":true,"italic":false,"color":"blue"}]

#WIN/LOSS SOUND EFFECTS
execute at @a[team=mas.survivor] run playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 2
execute at @a[team=mas.hunter] run playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 0.8

#SHOW FIREWORKS
execute at @a[tag=mas.player] run summon minecraft:firework_rocket ^ ^1 ^1 {Life:0,LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Explosions:[{Type:4,Flicker:1b,Trail:1b,Colors:[I;5592575],FadeColors:[I;5592575]}]}}}}