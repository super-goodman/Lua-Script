
maxShieldID = 11426  --当前最大寒冰护体法术ID


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
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getRoleCurrentHP() < 95 or getRoleCurrentMP() < 95) and (getThreadTime() - time) < 50 do
        if IsBuffExist(maxLevelWaterBUFFID) == 0 and getRoleCurrentMP() < 95 then
            useItem(maxLevelWaterName)
        end
        if IsBuffExist(maxLevelBreadBUFFID) == 0 and getRoleCurrentHP() < 95 then
            useItem(maxLevelBreadName)
        end
    end
end






function main()
    moveA(-5235.07,-1482.82,498.906)
    prints("只有一个地点才可以刷！！！-5235.07,-1482.82,498.906")
    for i = 1, 100, 1 do
        castSpellA("魔爆术(等级 1)")
        sleep(1500)
        if IsBuffExist(maxShieldID) == 0 and  getSpellCoolDown(maxShieldID) == 1  then
            castSpellA("寒冰护体(等级 1)")
        end
        if getRoleCurrentMP() < 35 then
            castSpellA("唤醒")
            sleep(8000)
        end
    end
end

main()