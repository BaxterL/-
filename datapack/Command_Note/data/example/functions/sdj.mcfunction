execute as @a at @s store result score @s bow run data get entity @s SelectedItem.tag.bow
#普通的弓分数是0,闪电弓则是1,如果你需要做其他弓的,更改tag里bow的值就可以了

execute as @a[scores={bow=1}] at @s as @e[type=minecraft:arrow,limit=1,tag=!shot_arrow,nbt=!{ShotFromCrossbow:0b,inGround:1b,pickup:0b}] run data merge entity @s {life:1200,Tags:["shot_arrow"],damage:0.5d,CustomPotionEffects:[{Id:27,Amplifier:1,Duration:10000,ShowParticles:0b}]}
#剑的伤害可以根据情况来更改,命中之后会获得霉运1的效果
#Damage:箭将造成的伤害，以半颗心计量。不一定为整数。普通的箭为2.0，发射箭的弓的力量附魔每增加一级，该值增加0.5。只要带有力量附魔，就额外增加0.5（因此，力量I额外给予1.0，而力量II额外给予1.5）

execute as @e[nbt={ActiveEffects:[{Id:27b,Amplifier:1b}]}] run tag @s add shoot_target_lightning
#给命中的生物添加tag

execute as @e[tag=shoot_target_lightning] run effect clear @s minecraft:unluck
execute as @e[tag=shoot_target_lightning] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[tag=shoot_target_lightning] run tag @s remove shoot_target_lightning
#循环结束