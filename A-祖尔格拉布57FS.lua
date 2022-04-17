maxStormLevel = 5  --当前最大暴风雪等级
maxStormID = 0xCA  --当前最大暴风雪的技能ID 16进制的后2位
maxShieldID = 13032  --当前最大寒冰护体法术ID
maxWaterLevel = 6 --最大水制造等级
maxBreadLevel = 6 --最大面包制作等级
maxLevelWaterName = "魔法苏打水"  --使用水名字
maxLevelBreadName = "魔法甜面包" --使用面包名字
maxLevelWaterCreatorID = 8078   --使用水物品ID
maxLevelBreadCreatorID = 8076   --使用面包物品ID
maxLevelWaterBUFFID = 1137      --使用水BUFFID
maxLevelBreadBUFFID = 1131      --使用面包BUFFID
waitTime = 14 --爆本时间设置


--不卖掉的物品ID
doNotSellItems = {[1705]=true,[4500]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--不能邮寄得物品ID
doNotMailItems = {[17031]=true,[17032]=true,[13446]=true}
--需要销毁的垃圾数量
mustDestroyItemNum = 1
--需要销毁的物品的ID
mustDestroyItem = {[1] = 22044}

--炉石到副本内
function stoneToDugeon()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-12428.6,218.179)--如果在炉石
    if mapDistance <= 100 and mapDistance > 0 then 
        prints("开始从炉石到副本内")
        --绑定炉石
        ID1,ID2 = getClosetTargetIDFilterName("旅店老板",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --等待打开修理界面
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/click StaticPopup1Button1")
        sleep(1000)
        moveA(-12428.6,218.179,2.36575)
        moveA(-12425.6,226.895,1.25534)
        moveA(-12370.4,207.93,3.36099)
        moveA(-12358.7,158.073,4.03919)
        --开始修理
        sellJunks()
        moveA(-12365.4,159.226,3.06746)
        --开始上坐骑
        mountUp()
        moveA(-12391.5,146.954,2.72069)
        --开始邮寄
        mail()
        --开启爬墙
        enableClimb()
        moveA(-12390,121.953,3.57576)
        moveA(-12375,64.3304,6.10298)
        moveA(-12359.4,1.52937,10.0466)
        moveA(-12348.8,-37.4149,20.6962)
        moveA(-12343,-59.986,18.2207)
        moveA(-12339,-96.8092,17.9493)
        moveA(-12327.3,-126.819,17.4878)
        moveA(-12322.3,-144.943,18.0244)
        moveA(-12324.5,-182.768,19.9949)
        moveA(-12319.1,-244.308,15.5882)
        moveA(-12314.6,-275.026,12.1335)
        moveA(-12306.1,-327.332,10.7378)
        --再次上坐骑
        --mountUp()
        moveA(-12294.2,-354.7,15.9582)
        --开启爬墙
        enableClimb()
        moveA(-12273.9,-414.408,18.1859)
        moveA(-12263.6,-444.678,18.7317)
        moveA(-12255,-468.902,17.1024)
        moveA(-12249.3,-509.22,26.9673)
        moveA(-12242.9,-548.852,29.9986)
        moveA(-12245,-577.147,30.5882)
        moveA(-12252.1,-600.386,30.3518)
        moveA(-12229.3,-661.459,12.6439)
        moveA(-12209.2,-732.32,13.6918)
        moveA(-12198.4,-780.84,18.4627)
        --开启爬墙
        enableClimb()
        moveA(-12191.5,-840.175,42.0541)
        moveA(-12188.4,-866.612,40.0694)
        moveA(-12159.1,-965.826,32.9224)
        moveA(-12152,-994.84,35.1348)
        moveA(-12149.2,-1014.62,64.4694)
        moveA(-12146.5,-1081.76,101.217)
        moveA(-12135.9,-1130.12,112.459)
        moveA(-12133,-1175.94,186.753)
        moveA(-12115.2,-1192.18,196.39)
        moveA(-12093.5,-1211.3,212.224)
        moveF(-12090.1,-1210.61,217.484,1)
        moveF(-12090.1,-1210.61,217.484,1)
        moveA(-12013.9,-1191.39,216.316)
        moveA(-11916.2,-1262.75,214.316)
        moveF(-11916.2,-1262.75,98.127,1)
        --闪现并关闭飞天
        unableFly()
        unableWallThrough()
        unableClimb()
        sleep(1000)
        castSpellA("闪现术")
        moveA(-11916.4,-1274.29,85.1067)
        prints("进入祖尔格拉布开始")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("进入祖尔格拉布成功")
    end
end

function dugeonToStone()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-11916.7,-1246.61)--如果在副本里的门口
    if mapDistance <= 10 and mapDistance > 0 and getStoneCoolDown(6948) == 0 then--如果炉石没在CD,就使用炉石
        local headDuration = getEquipementDurationBySlotNum(1)
        local unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if headDuration <= 30 or unusedBag <= 3 then
            sleep(2000)
            useItem("炉石")
            sleep(9000)
            waitForLoading()
            sleep(2000)
        end
    end
end

--从副本门口进本
function dugeonOutToIn()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-11916.2,-1207.7)--如果在副本门口
    if mapDistance <= 10 and mapDistance > 0 then 
        prints("开始从副本门口到副本内")
        moveA(-11916.2,-1207.7,92.2612)
        moveA(-11916.4,-1219.35,92.2612)
        openGate("祖尔格拉布大门")
        prints("进入祖尔格拉布开始")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("进入祖尔格拉布成功")
    end
end

function sellJunks()
    ID1,ID2 = getClosetTargetIDFilterName("维哈尔",3,8)
    contactTarget(ID1,ID2)
    sleep(1000)
    useLua("/run RepairAllItems()")
    for i=0,4,1 do --循环将所有副背包的物品都放入,直到填满邮件
        bagNum = getBagSlotNum(i) --获得背包的大小
        unUsedSLot = getUnusedBagSlotNum(i)--获得所有背包剩余的空格子
        if bagNum-unUsedSLot > 0 then --如果背包中有东西
            for k = 1,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
                ID1,ID2,GUID,num,bag,slot = getItemInfoBySlot(i,k)
                if doNotSellItems[GUID] ~= true then
                    putMailItem(i,k) --放入
                    sleep(10)
                end
            end
        end  
    end
    useLua("/click MerchantFrameCloseButton")
end

--销毁垃圾
function destroyJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    for i = 1, mustDestroyItemNum, 1 do
        if isItemExist(mustDestroyItem[i]) == 1 then
            prints("销毁垃圾:%s",mustDestroyItem[i])
            destroyItemByID(mustDestroyItem[i])
        end
    end
end

function pickUp() 
    if getGlobalFlag() ~= 1 then
        return 0
    end
    printd("开始拾取：%d",getNumOfCanBeLootUnit())
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 do -- 循环n次（mld可能有很多怪）
        local n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if(n > 0) then --如果背包大于4格子就拾取
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                if distance < 20 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    moveB(x,y,z)
                    contactTarget(ID1,ID2) --拾取目标
                    quickPickUp()
                    sleep(10)
                    useLua("/click StaticPopup1Button1")
                    
                end
            else --代表没有可以拾取的目标了，跳出循环
                break
            end
        else
            break
        end
        if getRoleflag1() ~= 0x00 and getRoleflag1() ~= 0x04 then
            castSpellA("魔爆术")
        end
        sleep(10)
    end
end




function mail()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始邮寄")
    for i=0,4,1 do --循环将所有副背包的物品都放入,直到填满邮件
        bagNum = getBagSlotNum(i) --获得背包的大小
        unUsedSLot = getUnusedBagSlotNum(i)--获得所有背包剩余的空格子
        if bagNum-unUsedSLot > 0 then --如果背包中有东西
            contactClosetMailObjec()--与邮箱互动(打开邮箱)
            clickSendMailFrame()--打开发送页面
            setMailTargetName()--填写名字，名字在脚本界面填写
            for k = 1,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
                ID1,ID2,GUID,num,bag,slot = getItemInfoBySlot(i,k)
                if doNotMailItems[GUID] ~= true then
                    putMailItem(i,k) --放入
                    sleep(10)
                end
                sleep(10)
            end
            sendMail()--发送邮件
            useLua("/click MailFrameCloseButton")
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
    end
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    sleep(200)
    setMailTargetName()--填写名字，名字在脚本界面填写
    putMailMoney(500)
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
    sleep(500) -- 略微延迟，防止发邮件卡住
end



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

--制造法力宝石
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("制造魔法宝石")
    if isItemExist(5513) == 0 then
        castSpellA("制造魔法翡翠")
        sleep(3500)
    end
    if isItemExist(8008) == 0 then
        castSpellA("制造魔法红宝石")
        sleep(3500)
    end
    if isItemExist(8007) == 0 then
        castSpellA("制造魔法黄水晶")
        sleep(3500)
    end
end

--上BUFF
function castBuffs()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("上BUFf")
    sleep(1500)
    castSpellA("奥术智慧")
    sleep(1500)
    castSpellA("冰甲术")
    sleep(1000)
end

--开启大门
function openGate(name)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开启大门:"..name)
    local ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
    standBy()
    local time = getThreadTime()
    --判断门是否为开启状态
    while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
        ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
        contactTarget(ID1,ID2)
        sleep(1000)
    end
end


--法术反制目标
function silenceTarget(name,target_x,target_y)
    prints("法术反制:%s",name)
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    chooseTarget(ID1,ID2)
    castSpellA("法术反制")
    sleep(100)
end

--暴风雪拉怪
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    standBy()
    printf("暴风雪:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("暴风雪".."(等级 "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end


--释放盾
function castShilds()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    -- 盾没有CD时释放盾
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        prints("没有盾,上盾")
        castSpellA("寒冰护体")
        return
    end
    --都没有，就极冷寒冰护盾
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        prints("没有盾并且CD中,极冷上盾")
        castSpellA("急速冷却")
        sleep(50)
        castSpellA("寒冰护体")
    end
end

--距离检测
function battleDistanceCheck(time,state)
    for i = 1, 40, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 15 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z-r_z) < 10 then
                prints("%s 过于接近，回避",name)
                printf("1怪物z轴距离 = %f",math.abs(z-r_z))
                return
            elseif state == 0 and math.abs(z-r_z) > 17 then
                prints("%s 过于接近，回避",name)
                printf("0怪物z轴距离 = %f",math.abs(z-r_z))
                return
            end
        end
        sleep(time/4)
    end
end


--基于原本FLy修改
function battleFly(x,y,z,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local _,_,r_z = getRolePosition()
    if math.abs(z-r_z) > 2 then
        moveF(x,y,z,state)
        unableWallThrough()
    else
        moveA(x,y,z)
    end
end


function battle()
    prints("开始正式战斗")
    moveF(-11710.1,-1501.17,43.2902,1)
    --先在左边下一波
    storm(1,-11743.4,-1497.48,40.6609)
    battleDistanceCheck(600,1)
    storm(1,-11738.5,-1493.95,43.606)
    battleDistanceCheck(800,1)
    storm(1,-11733.8,-1490.8,40.4841)
    battleDistanceCheck(200,1)
    battleFly(-11710.4,-1505.82,43.2284,0)
    storm(1,-11743.4,-1497.48,40.6609,350)
    battleDistanceCheck(800,0)
    local flag = getRoleflag1()
    printp("当前战斗状态：%p",flag)
    while getNumOfInBattleUnit() ~= 0 and flag == 0x08 and flag ~= 0x04  and getGlobalFlag() == 1 do

        useLua("/use 13")
        useLua("/use 14")
        battleFly(-11710.1,-1501.17,43.2902,0)
        stormWhenInbattle(-11738.5,-1493.95,43.606,400,1)
        battleFly(-11710.4,-1505.82,43.2284,0)
        if getRoleCurrentMP() <= 40 and getSpellCoolDown(12051) == 1 then
            castSpellA("唤醒")
            battleDistanceCheck(600,0)
        else
            stormWhenInbattle(-11743.4,-1497.48,40.6609,400,0)
        end
        if getRoleCurrentHP() <= 50  then
            castShilds()
        end
        flag = getRoleflag1()
        flag = getRoleflag1()
    end
    printp("当前战斗状态：%p",flag)
end



--在战斗中下雪(有目标靠近时才会才是下雪)state = 在内还是在外 1 = 在内
function stormWhenInbattle(x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --吃血检测
    if  getRoleCurrentHP() <= 70 then
        useItem("特效治疗药水")
    end
    --如果蓝量大于xx%就使用满级暴风雪,根据玩家的当前等级
    local stormLevelCheck = 0
    if getRoleLevel() == 57 and getRoleCurrentMP() >= 50 then
        stormLevelCheck = 1
    elseif getRoleLevel() > 57  and getRoleCurrentMP() >= 25  then
        stormLevelCheck = 1
    end
    if stormLevelCheck == 1 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --循环卡死延迟判断，如果技能被打断，就释放一级暴风雪延续
    local stormTime = getThreadTime()
    for i = 1, 40, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - stormTime) > 8 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= maxStormID and spellID ~= 0xCD and spellID ~= 0x0A and i > 10 and i < 30 then
            storm(1,x,y,z)
        else
            sleep(time/2)
        end
        local _,_,_,_,z1,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 15 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z1-r_z) < 10 then
                prints("%s 过于接近，回避",name)
                printf("1怪物z轴距离 = %f",math.abs(z1-r_z))
                return
            elseif state == 0 and math.abs(z1-r_z) > 17 then
                prints("%s 过于接近，回避",name)
                printf("0怪物z轴距离 = %f",math.abs(z1-r_z))
                return
            end
        end
    end
    printd("暴风雪时间:%d",getThreadTime() - stormTime)
    --吃宝石

    if isItemExist(8008) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力红宝石")
        useItem("优质法力药水")
        return
    end
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力黄水晶")
        useItem("优质法力药水")
        return
    end
    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力翡翠")
        useItem("优质法力药水")
        return
    end

end

--等待到15分钟，防止爆本
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end

    prints("开始等待防止爆本，15分钟,现在：%ss",getThreadTime())
    --开始计算时间，必须刷到15分钟，不然爆本
    while getThreadTime() < waitTime*60 and getGlobalFlag() == 1  do
        sleep(5000)
        prints("剩余等待:%ss",waitTime*60-getThreadTime())
    end
    prints("防爆本等待结束")
end

function main()
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        prints("\n需要等级:59\n开始地点:荆棘谷格罗姆高旅店,副本内外\n炉石地点:荆棘谷格罗姆高\n标准刷本天赋\n 不要刺骨\n需要鞋子移动速度附魔\n需要大量精神智力装备(裁缝,夜枭)")
        stoneToDugeon()
        dugeonOutToIn()
        dugeonToStone()
        stoneToDugeon()
        --脚本正式开始
        prints("脚本正式开始")
        destroyJunks()
        drink()
        magicStone()      
        drink()
        castBuffs()
        drink()
        enableClimb()
        moveA(-11916.7,-1246.61,92.5351)
        moveA(-11916.7,-1256.58,92.5416)
        moveA(-11899.7,-1257.65,85.3841)
        moveA(-11904.6,-1258.16,85.3841)
        moveA(-11905.3,-1246.27,109.433)
        mountUp()
        moveF(-11904.4,-1246.46,111.069,1)
        unableClimb()
        moveA(-11870.4,-1281.58,110.55)
        moveA(-11834,-1332.94,109.88)
        moveA(-11815.6,-1365.01,109.494)
        moveA(-11803.4,-1388.78,109.206) 
        moveA(-11789.5,-1417.06,108.871)   
        moveF(-11796.1,-1427.59,33.3976,0)
        castShilds()
        sleep(1500)
        --下雪第一波鳄鱼
        storm(1,-11785.1,-1408.72,12.5907)
        sleep(1000)
        moveF(-11855.5,-1496.81,32.2118,0)
        --下雪第2波鳄鱼
        sleep(200)
        storm(1,-11828.2,-1496.68,11.2276)
        sleep(1000)
        moveF(-11876.5,-1508.44,32.132,1)
        --第3波鳄反制
        silenceTarget("鳄鱼",-11894.5,-1495.56)
        moveA(-11913,-1565.53,32.0221)
        moveF(-11913,-1565.53,43.2782,0)
        moveF(-11873.7,-1629.34,46.4913,1)
        moveF(-11877.3,-1673.88,46.0136,1)
        moveF(-11877.3,-1673.88,63.8584,1)
        moveA(-11874.6,-1695.31,46.2955)
        moveF(-11905.2,-1744.63,63.0842,1)
        moveF(-11901.2,-1771.43,63.8239,1)
        moveA(-11832.2,-1768.32,63.1088)
        moveF(-11753,-1784.1,63.2719,1)
        moveA(-11699.4,-1770.21,63.273)
        moveA(-11720.8,-1729.43,60.9604)
        moveA(-11698.5,-1715.04,63.5538)
        moveA(-11698.2,-1650.77,63.5366)
        sleep(1000)
        moveA(-11699,-1642.9,63.7982,1)
        moveA(-11702.7,-1576.3,63.9725,1)
        castSpellA("法师护甲")
        moveA(-11702.4,-1537.09,63.1255)
        moveA(-11729.3,-1503.37,40.4667)
        castSpellA("寒冰护体")
        sleep(500)

        battle()
        moveF(-11741.7,-1491.11,42.8837)
        pickUp()
        mountUp()
        moveA(-11757.4,-1475.93,42.0385)
        moveA(-11827.7,-1379.15,40.7903)
        moveF(-11827.7,-1379.15,109.581,1)
        moveA(-11916.8,-1269.74,108.042)
        moveA(-11917,-1258.01,107.906)
        sleep(1000)
        --关闭飞天挑一下
        unableFly()
        unableWallThrough()
        jumpB()
        moveA(-11916.8,-1234.53,92.5338)
        wait()
        prints("祖尔格拉布开始出本")
        moveB(-11916.6,-1228.12,92.5353)
        moveB(-11916.6,-1228.12,92.5353)
        waitForLoadingPosition(-11916.6,-1228.12,92.5353)
        prints("祖尔格拉布出本成功")
        sleep(2000)
        useLua("/run ResetInstances()") --重置
        sleep(1000)
        prints("副本重置成功")   
    else
        --开启爬墙
        unableFly()
        unableWallThrough()
        enableClimb()
        moveA(-11517.7,-243.994,30.8086)
        moveA(-11519.5,-305.782,38.3364)
        moveA(-11560.7,-344.725,39.9673)
        moveA(-11606.9,-396.388,18.6466)
        moveA(-11650.1,-453.555,21.1574)
        moveA(-11675.8,-490.45,21.1338)
        moveA(-11698.2,-522.538,24.9601)
        moveA(-11717.7,-550.556,47.1129)
        moveA(-11740.8,-564.99,42.6027)
        moveA(-11757.1,-623.674,37.0155)
        moveA(-11772.9,-684.938,36.9134)
        moveA(-11788,-740.26,38.0435)
        moveA(-11829.2,-782.46,36.1628)
        moveA(-11860.9,-827.802,33.3895)
        moveA(-11888,-861.42,35.6195)
        moveA(-11910.3,-889.012,33.2024)
        moveA(-11916.4,-946.946,53.7693)
        moveA(-11912.5,-982.787,66.1638)
        moveA(-11911.5,-1048.73,69.8083)
        moveA(-11912.5,-1080.53,77.2801)
        moveA(-11913.6,-1117.16,77.2801)
        moveA(-11915.3,-1169.84,85.0092)
        moveA(-11916.4,-1203.77,92.2888)
        unableClimb()
        prints("跑尸进入祖尔格拉布开始")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("跑尸进入祖尔格拉布成功")
    end
end



main()

