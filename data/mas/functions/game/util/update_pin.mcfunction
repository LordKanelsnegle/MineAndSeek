#TODO: update this description if it works, also see what else can be util-ified

#UPDATE POSITION
tp @s ~ ~-1 ~

#AIR TOGGLE TO FORCE IMMEDIATE POSITION UPDATE
execute store result entity @s Air byte 1 run time query gametime