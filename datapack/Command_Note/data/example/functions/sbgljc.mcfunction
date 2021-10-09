execute as @a store result score @s SelSlot run data get entity @s SelectedItemSlot
execute as @a if score @s SelSlot > @s OldSelSlot run scoreboard players set @s wheel -1
execute as @a if score @s SelSlot < @s OldSelSlot run scoreboard players set @s wheel 1
execute as @a if score @s SelSlot = @s OldSelSlot run scoreboard players set @s wheel 0
#玩家如果从0号栏滚动到8号栏会出现一些BUG，所以我们要根据这些特殊情况重新设置分数
execute as @a if score @s SelSlot matches 0..2 if score @s OldSelSlot matches 8 run scoreboard players set @s wheel -1
execute as @a if score @s SelSlot matches 6..8 if score @s OldSelSlot matches 0 run scoreboard players set @s wheel 1

#上滚分数1 下滚分数-1
#执行函数
#execute as @a[scores={wheel=1}] run title @s actionbar "你正在向上滚动滚轮"
#execute as @a[scores={wheel=-1}] run title @s actionbar "你正在向下滚动滚轮"

#这里获取栏位的时间会比SelSlot计分板晚
execute as @a store result score @s OldSelSlot run data get entity @s SelectedItemSlot