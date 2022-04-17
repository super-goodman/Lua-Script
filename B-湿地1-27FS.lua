
maxWaterLevel = 8 --最大水制造等级
maxBreadLevel = 7 --最大面包制作等级
maxLevelWaterName = "魔法山泉水"  --使用水名字
maxLevelBreadName = "魔法肉桂面包" --使用面包名字
maxLevelWaterCreatorID = 30703   --使用水物品ID
maxLevelBreadCreatorID = 22895   --使用面包物品ID
maxLevelWaterBUFFID = 34291      --使用水BUFFID
maxLevelBreadBUFFID = 29073      --使用面包BUFFID
maxShieldBuffID = 27125  --最大法师护甲ID
--吃喝
function drink()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始吃喝")
    --水
    if isItemExist(maxLevelWaterCreatorID) == 0 then
        castSpellA("造水术".."(等级 "..maxWaterLevel..")")
        sleep(3500)
    end
    --面包
    if isItemExist(maxLevelBreadCreatorID) == 0 then
        castSpellA("造食术".."(等级 "..maxBreadLevel..")")
        sleep(3500)
    end
    --开始吃喝

    if getRoleCurrentHP() < 95 then
        useItem(maxLevelBreadName)
    end
    if getRoleCurrentMP() < 95 then
        useItem(maxLevelWaterName)
    end
    local time = getThreadTime()
    --循环检测血量
   -- prints(string.format("%d,%x,%d,%d"),getGlobalFlag(),getRoleflag1(),(getRoleCurrentHP() < 95 or getRoleCurrentMP() < 95),(getThreadTime() - time))
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getRoleCurrentHP() < 95 or getRoleCurrentMP() < 95) and (getThreadTime() - time) < 50 do
        if IsBuffExist(maxLevelWaterBUFFID) == 0 and getRoleCurrentMP() < 95 then
            useItem(maxLevelWaterName)
        end
        if IsBuffExist(maxLevelBreadBUFFID) == 0 and getRoleCurrentHP() < 95 then
            useItem(maxLevelBreadName)
        end
    end
end

function findEnemy()
    if getGlobalFlag() ~= 1 then
        return
    end
    ID1,ID2,x,y = getClosetTargetIDFilterNameNoDead("狼",3)
    rotateA(x,y)
    chooseTarget(ID1,ID2)

    castSpellA("冰枪术")
    sleep(1500)
    castSpellA("冰枪术")
end


--等待脱战
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        --ID1,ID2,x,y = getClosetTargetToAPositionFilterNameNoDead("蟹|瞎",-10945.8,2115.75,3)
        ID1,ID2,x,y = getClosetTargetIDFilterInBattle("狼",3)
        rotateA(x,y)
        chooseTarget(ID1,ID2)
        castSpellA("冰枪术")
        sleep(1000)
    end
    prints("脱战成功,等待怪物消失")


end

function main()
    prints("开始湿地挂机，千万记得提前做好5组吃喝！！！坐标:-4141.5,-2946.58,11.5809(游戏内61,72)")
    prints("任意地点都可以开启，只要是无限刷怪的点都可以")
 
    --moveA(-4141.5,-2946.58,11.5809)
    for i = 1, 100, 1 do
        if getGlobalFlag() ~= 1 then
            return
        end
        findEnemy()
        sleep(700)
        if getRoleCurrentMP() < 40 then
            waitForGetRidOfBattle()
            drink()
        end
        if IsBuffExist(maxShieldBuffID) == 0 and  getSpellCoolDown(maxShieldBuffID) == 1  then
            castSpellA("法师护甲")
            return
        end
    end
end


main()