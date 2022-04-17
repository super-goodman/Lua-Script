
function findEnemy()
    if getGlobalFlag() ~= 1 then
        return
    end
    ID1,ID2,x,y = getClosetTargetIDFilterNameNoDead("狼",3)
    rotateA(x,y)
    chooseTarget(ID1,ID2)
    castSpellA("攻击")
    castSpellA("自动射击")
    castSpellA("多重射击")
    useLua("/petattack")
end

--等待脱战
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        sleep(1000)
    end
    prints("脱战成功,等待怪物消失")


end


function main()
    prints("开始湿地挂机 带满一背包箭！！！！和几把弓:强化弓和 重型弯弓，身上先随便穿一把除了这两外的弓！就可以挂机一晚上！可以从地狱火断背岗哨弓箭商人处获得！！！带上起码3组魔法羊角面包 或者 魔法肉桂面包 或者 烤鹌鹑 -4227.35,-2708.51,41.6954 任意地点都可以开启")
    local headDuration = getEquipementDurationBySlotNum(18)
    if headDuration < 10 then
        useLua("/equip 强化弓")
        headDuration = getEquipementDurationBySlotNum(18)
        if headDuration < 10 then
            useLua("/equip 重型弯弓")
        end
    end
    local happniess = getLuaReturn("GetPetHappiness()")
    prints(happniess)
    if happniess == "2"  or happniess == "1"  then
        prints("让宠物开心中")
        waitForGetRidOfBattle()
        sleep(3000)
        waitForGetRidOfBattle()
        useLua("/cast 喂养宠物")
        useLua("/use 魔法肉桂面包")
        useLua("/use 魔法羊角面包")
        useLua("/use 烤鹌鹑")
      
        sleep(10000)
    end
   
    for i = 1, 700, 1 do
        --prints(getLuaReturn("GetPetHappiness()"))
        if getGlobalFlag() ~= 1 then
            return
        end
        findEnemy()
        sleep(500)
    end



end


main()