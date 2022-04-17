maxStormLevel = 7  --当前最大暴风雪等级
maxShieldID = 33405  --当前最大寒冰护体法术ID
maxFireShieldID = 27128  --当前最大火焰防护结界法术ID
maxWaterLevel = 8 --最大水制造等级
maxBreadLevel = 7 --最大面包制作等级
maxLevelWaterName = "魔法山泉水"  --使用水名字
maxLevelBreadName = "魔法肉桂面包" --使用面包名字
maxLevelWaterCreatorID = 30703   --使用水物品ID
maxLevelBreadCreatorID = 22895   --使用面包物品ID
maxLevelWaterBUFFID = 34291      --使用水BUFFID
maxLevelBreadBUFFID = 29073      --使用面包BUFFID
waitTime = 15 --爆本时间设置

--不卖掉的物品ID
doNotSellItems = {[1705]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--不能邮寄得物品ID
doNotMailItems = {[17031]=true,[17032]=true}
--需要销毁的垃圾数量
mustDestroyItemNum = 6
--需要销毁的物品的ID
mustDestroyItem = {[1]=11734,[2]=11732,[3] = 11754,[4] = 11737,[5] = 22044,[6] = 11733}





--脚本变量(勿动)
initialMoney = 0

--改写的移动函数，用于解除定身状态
function moveT(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end   
    local roleX,roleY,roleZ = getRolePosition()
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 and getDistanceBetween(roleX,roleY,x,y) > 2  do
        moveB(x,y,z)
        sleep(40)
        if IsBuffExist(14030) == 1 then
            castSpellA("闪现术")
        end
        roleX,roleY,roleZ = getRolePosition()
    end
end

function mount()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    mountUp()
end

--斯通纳德到修理
function wildToRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-10468.2,-3331.48)--如果在修理
    if mapDistance <= 100 and mapDistance > 0 then 
        prints("从斯通纳德飞机出发")
        moveA(-10468.2,-3330.39,25.4716)
        moveA(-10457.4,-3313.91,20.9642)
        moveA(-10441.6,-3289.82,20.1791)
        moveA(-10457,-3280.39,21.3375)
        --点击飞机
        ID1,ID2 = getClosetTargetIDFilterName("布雷",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --等待打开飞机界面
        useLua("/click GossipTitleButton1")
        sleep(3000) --等待打开飞机界面
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        prints("请手动点击一下瑟银塔哨,如果没有,请关闭后自行前往")
        while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 do
            roleX,roleY,roleZ = getRolePosition()
            mapDistance = getDistanceBetween(roleX,roleY,-6554.93,-1100.05)--如果在修理
            printd("飞行中，距离目的地：%d",mapDistance)
            if mapDistance <= 10  then
                printd("飞行目的地到达")
                break
            end
            sleep(20000)
        end
        sleep(3000)
        mountUp()
        moveA(-6522.97,-1107.71,311.083)
        moveA(-6496.83,-1141.24,307.127)
        moveA(-6518.54,-1180.41,309.334)

    end
end

--副本外进本
function dugeonOutToIn()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-7178.58,-921.016)--如果在副本外
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("副本外开始进入副本")
        moveB(-7178.26,-927.956,166.845)
        waitForLoadingPosition(-7178.26,-927.956,166.845)
        prints("副本外成功进入副本")
    end
end

--修理到副本内
function repaireToDugeon()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-6521.95,-1183.29)--如果在修理
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("开始从修理到副本")
        ID1,ID2 = getClosetTargetIDFilterName("大铁匠",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --等待打开修理界面
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton5")
        useLua("/click GossipTitleButton3")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(3000)
        useLua("/click MerchantFrameCloseButton")
        rotateB(1.04)
        sleep(100)
        enableClimb()
        moveA( -6513.33,-1176.57,309.24)
        moveA(-6490.37,-1129.02,306.218)
        moveA(-6482.99,-1101.47,301.293)
        moveA(-6502.37,-1075.77,292.338)
        moveA(-6586.24,-1055.31,262.785)
        moveA(-6752.46,-1036.49,240.226)
        moveA(-6861.56,-1030.84,242.625)
        moveA(-6944.64,-1024.49,241.668)
        moveA(-7057.29,-965.264,260.145)
        moveA(-7179.91,-922.851,266.327)
        unableClimb()
        moveF(-7179.91,-922.851,170.225,0)
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(1000)
        prints("开始进入副本")
        moveB(-7178.26,-927.956,166.845)
        waitForLoadingPosition(-7178.26,-927.956,166.845)
        prints("成功进入副本")

    end
end

--副本外到修理
function dugeonToRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,456.929,34.0923)--如果在副本里门口
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --如果装备红了或者背包满了回城修理
            prints("修理开始出本")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("修理出本成功")
        end
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,-7178.26,-927.956)--如果在副本外门口
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --如果装备红了或者背包满了回城修理
            prints("开始从副本外到修理")
            moveF(-7178.36,-923.692,280.92,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(3000)
            mount()
            enableClimb()
            moveA(-7020.08,-986.74,246.984)
            moveA(-6871.69,-1059.63,246.24)
            moveA(-6808.48,-1107.05,243.419)
            moveA(-6661.69,-1184.71,242.928)
    
            moveA(-6583.4,-1153.13,278.42)
            moveA(-6538.25,-1167.97,309.28)
            moveA(-6515.8,-1178.61,309.305)
            moveA(-6521.79,-1186.61,309.256)
            unableClimb()

        end
    end
end

function pickUp() 
    if getGlobalFlag() ~= 1 then
        return 0
    end
    printd("开始拾取：%d",getNumOfCanBeLootUnit())
    --如果数量少于10，不重置副本，代表脱战了
    if getNumOfCanBeLootUnit() < 20 then
        resetFlag = 1
    end
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 do -- 循环n次（mld可能有很多怪）
        local n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if(n > 0) then --如果背包大于4格子就拾取
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                if distance < 40 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
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





--身上有圣契前往邮寄
function dugeonToMail()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,456.929,34.0923)--如果在副本里门口
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --如果装备红了或者背包满了回城修理
            prints("邮箱开始出本")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("邮箱出本成功")
        end
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,-7178.26,-927.956)--如果在副本外门口
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        if isItemExist(11736) == 1 or getMoney() >= 300 then
            prints("开始从副本外到邮箱")
            moveF(-7178.36,-923.692,280.92,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(3000)
            mount()
            enableClimb()
            moveA(-7177.17,-1080.68,241.574)
            moveA(-7179.58,-1242.7,246.795)
            moveA(-7120.82,-1371.16,241.615)
            moveA(-7013.84,-1516.53,244.19)
            moveA(-6938.31,-1743.29,240.744)
            moveA(-6901.41,-1840.05,246.067)
            moveA(-6935.02,-1983.83,282.478)
            moveA(-6946.59,-2068.46,282.478)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6854.62,-2198.92,252.99)
            moveA(-6785.02,-2201.08,244.127)
            moveA(-6696.81,-2171.4,244.144)
            moveA(-6675.58,-2152.91,244.195)
            --修理
            ID1,ID2 = getClosetTargetIDFilterName("斯兰达",3,8)
            contactTarget(ID1,ID2)
            sleep(2000) --等待打开修理界面
            contactTarget(ID1,ID2)
            useLua("/click GossipTitleButton3")
            sleep(1000)
            useLua("/run RepairAllItems()")
            sleep(3000)
            useLua("/click MerchantFrameCloseButton")
            sleep(100)
            moveA(-6687.29,-2171.95,244.144)
            moveA(-6675.77,-2175.45,244.157)
            --邮寄
            mail()
            moveA(-6687.29,-2171.95,244.144)
            moveA(-6696.81,-2171.4,244.144)
            moveA(-6785.02,-2201.08,244.127)
            moveA(-6854.62,-2198.92,252.99)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6946.59,-2068.46,282.478)
            moveA(-6935.02,-1983.83,282.478)
            moveA(-6901.41,-1840.05,246.067)
            moveA(-6938.31,-1743.29,240.744)
            moveA(-7013.84,-1516.53,244.19)
            moveA(-7120.82,-1371.16,241.615)
            moveA(-7179.58,-1242.7,246.795)
            moveA(-7177.17,-1080.68,241.574)
            moveA(-7178.36,-923.692,280.92)
            unableClimb()
            moveF(-7179.91,-922.851,170.225,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(1000)
            prints("邮箱开始进入副本")
            moveB(-7178.26,-927.956,166.845)
            waitForLoadingPosition(-7178.26,-927.956,166.845)
            prints("邮箱成功进入副本")  
        end
    end
end
--dugeonToMail()


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
    putMailMoney(500)--放入500G
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
    sleep(500) -- 略微延迟，防止发邮件卡住
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


--售卖垃圾

function  sellJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始售卖")
    ID1,ID2,x,y,z = getClosetTargetIDFilterName("普拉格",3,8)
    moveA(x,y,z)
    contactTarget(ID1,ID2)
    sleep(2000) 
    --开始售卖
    --售卖2次
    for i = 1, 1, 1 do
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
    end
    useLua("/click MerchantFrameCloseButton")
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
    if isItemExist(22044) == 0 and getRoleLevel() >= 68 then
        castSpellA("制造魔法玉石")
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
    sleep(1000)
    castSpellA("奥术智慧")
    sleep(1500)
    castSpellA("冰甲术")
    sleep(1000)
end


--冰枪术目标
function iceLenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("冰枪术目标:%s",name)
    local ID1,ID2,x,y = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    --local player_x,player_y = getRolePosition()
    --local rotation = getface(x,y,player_x,player_y)
    chooseTarget(ID1,ID2)
    sleep(200)
    castSpellA("冰枪术")
    sleep(100)
 
end

--法术反制目标
function silenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("法术反制目标:%s",name)
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
    printf("暴风雪拉怪:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("暴风雪".."(等级 "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end

--暴风雪聚怪
function keepTargetTogether(target_x,target_y,target_z)
    printf("开始门口暴风雪聚怪:%f,%f,%f",target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --拉广场的监工
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("监军",470.643,-92.9271,3)
    chooseTarget(ID1,ID2)
    castSpellA("召唤水元素")
    sleep(600)
    useLua("/petattack")
    sleep(2000)
    storm(1,target_x,target_y,target_z)
    for i = 1, 20, 1 do
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(380)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 7 then
            prints("%s 过于接近，回避",name)
            break
        end
    end
    storm(1,  545.317,-65.4708,-62.4661)
    for i = 1, 10, 1 do
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(200)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 7 then
            prints("%s 过于接近，回避",name)
            break
        end
    end
    useLua("/run PetDismiss()")
end

--基于原本FLy修改
function battleFly(x,y,z,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    _,_,r_z = getRolePosition()
    if math.abs(z-r_z) > 2 then
        moveF(x,y,z,state)
    else
        moveA(x,y,z)
    end
end


--第一次聚怪战斗
function battle1()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始第一次循环聚怪战斗")
    battleFly(627.993,-66.9434,-43.4235,0)
    storm(1,596.665,-62.4957,-52.0746)
    sleep(5000) 
    for i = 1, 2, 1 do
        if getGlobalFlag() ~= 1 then
            return 0
        end
        rotateB(4.79076)
        battleFly(632.091,-74.9228,-41.9433,0)
        storm(maxStormLevel,601.185,-79.9312,-44.0048)
        for i = 1, 20, 1 do
            local spellID = getRoleCurrentSpellID()
            --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
            if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
                storm(1,x,y,z)
            else
                sleep(320)
            end
            local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance > 0 and distance < 7 then
                prints("%s 过于接近，回避",name)
                break
            end
        end
        rotateB(1.59811)
        battleFly(631.327,-66.9412,-42.8821,1)
        for i = 1, 6, 1 do
            castShilds()
            sleep(1000)
        end

    end
    rotateB(4.79076)
    battleFly(632.091,-74.9228,-41.9433,0)
    storm(maxStormLevel,601.185,-79.9312,-44.0048)
    sleep(6000) 
    castShilds()

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
    --没有盾用冰冷血脉
    if (getSpellCoolDown(12472) == 0 and IsBuffExist(maxShieldID) == 0) or (getSpellCoolDown(maxFireShieldID) == 0 and IsBuffExist(maxFireShieldID) == 0) == 0 then
        castSpellB("冰冷血脉")
    end 
    --如果蓝量大于50%就使用满级暴风雪
    if getRoleCurrentMP() >= 20 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --循环卡死延迟判断，如果技能被打断，就释放一级暴风雪延续
    local time = getThreadTime()
    for i = 1, 20, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - time) > 7.5 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 5 and i < 15 then
            storm(1,x,y,z)
        else
            sleep(time)
        end
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 14 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z-r_z) < 6 then
                prints("%s 过于接近，回避",name)
                printf("z轴距离 = %f",math.abs(z-r_z))
                break
            elseif state == 0 and math.abs(z-r_z) > 10 then
                prints("%s 过于接近，回避",name)
                printf("z轴距离 = %f",math.abs(z-r_z))
                break
            end
        end
    end
    --吃宝石
    if isItemExist(22044) == 1 and getRoleCurrentMP() <= 65 then
        useItem("法力刚玉")
        useItem("优质法力药水")
        return
    end
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
    

end

--释放盾
function castShilds()
    local count = 0
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    local fireShiledBuffState = IsBuffExist(maxFireShieldID)
    local fireShiledCoolDownState = getSpellCoolDown(maxFireShieldID)
    -- 盾没有CD时释放盾
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        castSpellA("寒冰护体")
        return
    end
    -- 火盾没有CD时释放盾
    if fireShiledBuffState == 0 and  fireShiledCoolDownState == 1 and getRoleCurrentMP() >45 then
        castSpellA("防护火焰结界")
    end
    --都没有，就极冷寒冰护盾
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        castSpellA("急速冷却")
        sleep(50)
        castSpellA("寒冰护体")
    end
end

--等待脱战
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if getRoleflag1() ~= 0x00 and getRoleflag1() ~= 0x04 then
        --前往脱战点
        moveA(644.319,-62.2487,-42.43)
        moveF(642.47,-78.6685,-45.6846,1)
        local time = getThreadTime()
        prints("开始等待脱战")
        while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
            sleep(1000)
        end
        prints("脱战成功,等待怪物消失")
    end
end

--正式战斗
function battle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    for i = 1, 8, 1 do
        castShilds()
        sleep(1000)
    end
    prints("开始正式战斗")
    printd("剩余怪物：%d",getNumOfInBattleUnit())
    printd("可拾取：%d",getNumOfCanBeLootUnit())
    rotateB(4.79076)
    castShilds()
    battleFly(605.81,-67.2953,-43.16,0)
    castSpellB("冰冷血脉")
    stormWhenInbattle(629.034,-59.8755,-45.9641,350,1)
    stormWhenInbattle(632.186,-67.4766,-45.9368,200,1)
    --管道外
    rotateB(1.59811)
    battleFly(606.028,-62.129,-43.2694,0)
    --等待
    for i = 1, 9, 1 do
        castShilds()
        sleep(1000)
    end
    --如果在战斗
    printd("flag1 = %d",getRoleflag1())
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and  getGlobalFlag() == 1 do
        --管道上
        --开饰品
        castShilds()
        sleep(1000)
        castShilds()  
        rotateB(4.79076)
        battleFly(605.81,-67.2953,-43.16,0)
        useLua("/use 13")
        useLua("/use 14")
        stormWhenInbattle(629.034,-59.8755,-45.9641,300,1)
        stormWhenInbattle(632.186,-67.4766,-45.9368,350,1)
        local numOfInBattleUnits =  getNumOfInDistanceInBattleUnit(632.186,-67.4766,20)
        printd("离目标点靠近的数量 = %d",numOfInBattleUnits)
        if numOfInBattleUnits <= 0 and numOfInBattleUnits ~= -1 then
            break
        end

        --管道外
        rotateB(1.59811)
        battleFly(606.028,-62.129,-43.2694,0)
        if getRoleCurrentHP() < 70 then
            castShilds()
        end
        --唤醒回蓝
        if getRoleCurrentMP() <= 30 and getSpellCoolDown(12051) == 1 then
            castSpellB("冰冷血脉")
            sleep(50)
            castSpellA("唤醒")
            sleep(7800)
        else
            stormWhenInbattle(624.817,-51.9445,-45.4766,350,0)
        end 
        printd("剩余怪物：%d",getNumOfInBattleUnit())
        printd("可拾取：%d",getNumOfCanBeLootUnit())
    end    
    printd("flag1 = %d",getRoleflag1())
    prints("正式战斗结束") 
end

--等待到13分钟，防止爆本
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
    prints("放爆本等待结束")
end

--与目标互动
function contact(name,x,y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开启宝库:"..name)
    if x == 0 then
        local ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
        standBy()
        local time = getThreadTime()
        --判断门是否为开启状态
        while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
            sleep(200)
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
            contactTarget(ID1,ID2)
        end
    else
        ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDToAPositionFilterName(name,x,y,6)
        standBy()
        time = getThreadTime()
        --判断门是否为开启状态
        while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
            sleep(200)
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDToAPositionFilterName(name,x,y,6)
            contactTarget(ID1,ID2)
        end
    end

end

--开启宝库和门
function OpenTreasure(x,y,z,x1,y1)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if isItemExist(11078) == 0 then
        prints("钥匙不够")
        return
    end
    moveA(x,y,z)
    standBy()
    contact("宝库大门",x1,y1)
    sleep(10)
    contact("古物宝库",x1,y1)
    sleep(100)
    useLua("/click StaticPopup1Button1")
    sleep(100)
    useItem("一小袋钱币")
    useItem("一袋宝石")
    useItem("一大袋钱币")
    sleep(500)
    useItem("一小袋钱币")
    useItem("一袋宝石")
    useItem("一大袋钱币")
end

--开所有宝库
function OpenTreasures()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始开启所有宝库:")
    OpenTreasure(812.893,-333.221,-46.1247,809.755,-330.136)
    OpenTreasure(807.132,-336.698,-50.1911,805.925,-334.683)
    OpenTreasure(802.904,-340.635,-50.1939,801.213,-338.7)
    OpenTreasure(798.181,-345.348,-50.1969,796.685,-343.078)
    OpenTreasure(799.29,-348.606,-50.1969,796.192,-350.051)
    OpenTreasure(803.493,-353.352,-50.1983,800.483,-354.597)
    OpenTreasure(808.515,-358.651,-50.1983,806.057,-359.328)
    OpenTreasure(812.387,-362.61,-50.1983,810.36,-363.677)
    OpenTreasure(816.498,-362.112,-50.1914,817.078,-364.37)
    OpenTreasure(820.76,-357.835,-50.1835,821.335,-360.367)
    OpenTreasure(825.415,-353.586,-50.1741,826.046,-356.051)
    for i = 1, 5, 1 do
        useItem("一小袋钱币")
        useItem("一大袋钱币")
        useItem("一袋宝石")
        sleep(500)
    end
end

--小号进出本
function tellOtherInOrOut(state)
    if isInPartyOrGroup() == 1 then
        useLua("/party follow"..state) --让小号出本
    end
end


function main()
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        prints("\n需要等级:66\n开始地点:斯通纳德(需要根据提示手动点击飞机并开通瑟银岗哨飞机),瑟银岗哨修理,副本内外 \n技能需要:标准刷本天赋,需要火盾,尽量点出水宝宝,不要刺骨\n需要鞋子移动速度附魔\n需要大量精神智力装备(裁缝,夜枭)")
        --开始准备工作
        prints("开始准备工作")
        wildToRepaire()
        dugeonToMail()
        dugeonToRepaire()
        dugeonOutToIn()
        repaireToDugeon()
        --进本
        tellOtherInOrOut(1)
        initialMoney = getMoney()
        castSpellA("寒冰护体")
        destroyJunks()
        drink()
        magicStone()      
        drink()
        prints("脚本开始")
        moveF(457.943,28.7849,-26.3027,0)
        --到达开始地点
        moveA(496.657,-2.78235,-26.3027)
        moveA(556.776,-51.7217,-26.9178)
        moveA(614.427,-98.652,-26.3027)
        moveA(675.796,-148.608,-26.3027)
        moveF(680.877,-152.746,-42.5316)
        --开始吃喝，上buff
        drink()
        --上BUFF
        castBuffs()
        drink()
        --进本
        tellOtherInOrOut(1)
        castSpellA("寒冰护体")
        moveA(677.806,-146.413,-42.5316)
        --暴风雪拉第一波怪(熔炉顶部)
        storm(1,690.92,-137.15,-44.4085)
        sleep(1000)
        moveA(659.351,-129.041,-43.2007)
        --暴风雪拉第二波怪(熔炉顶部，可能可以忽略)
        storm(1,665.305,-137.18,-45.4541)
        sleep(1000)
        moveF(656.652,-93.2556,-39.0511,0)
        moveA(625.258,-90.2843,-39.7489)
        --暴风雪拉左手边里面2只怪
        storm(1,622.965,-115.167,-46.1644)
        sleep(1000)
        --暴风雪拉右手边双火元素怪
        storm(1,632.025,-78.5422,-45.7834)
        sleep(1200)

        moveA(597.777,-83.8746,-38.5254)
        --暴风雪拉左边门口怪(可能可以忽略)
        --storm(1,609.101,-95.7069,-45.8012)
        --sleep(1000)
        moveA(575.002,-71.8757,-38.8411)
        --法术反制拉最里面怪
        silenceTarget("铁怒卫士|铁怒卫兵",572.232,-100.672)
        --开始绕圈，聚怪
        moveF(559.516,-60.6503,-43.9753,0)
        --关闭飞天
        unableFly() 
        unableWallThrough()
        moveA(574.873,-33.6352,-45.4673)
        moveA(614.986,-33.7919,-45.4673)
        moveA(627.328,-55.0291,-45.4814)
        castSpellA("寒冰护体")
        --等待0.5S
        --sleep(500)

        moveF(605.139,-60.5101,-44.8312,1)
        --开始冰枪术拉3波怪
        rotateB(2.17556)
        iceLenceTarget("铁怒步兵|铁怒卫士",591.911,-41.1126)
        sleep(100)
        rotateB(1.19382)
        iceLenceTarget("铁怒步兵|铁怒卫士",609.192,-44.7214)
        sleep(100)
        rotateB(0.12568)
        iceLenceTarget("铁怒步兵|铁怒卫士|火焰卫士",626.792,-54.6729)
        sleep(200)
        rotateB(5.17556)
        --前往竞技场
        moveA(601.319,-159.027,-46.4656)
        castSpellA("寒冰护体")
        moveA(592.099,-171.647,-46.9109)
        --闪现到地上后延迟100ms
        castSpellA("闪现术")
        sleep(100)
        moveA(575.186,-184.311,-53.4699)
        moveF(533.923,-176.894,-52.8194,0)
        moveA(526.608,-228.654,-52.3738)
        --火元素（竞技场出来后第一波）
        storm(1,513.177,-209.735,-58.7221)
        sleep(1000)
        moveF(534.936,-229.718,-63.0521,0)
        moveA(537.541,-257.264,-63.8809)
        --暴风雪拉身后小怪(可能可以忽略)
        storm(1,522.584,-244.441,-66.0279)
        sleep(1000)
        castSpellA("寒冰护体")
        moveF(536.255,-274.634,-75.8316,0)
        moveA(570.046,-295.46,-75.2908)
        moveA(596.649,-301.813,-74.7322)
        moveA(592.169,-285.044,-75.0575)
        --暴风雪拉左前方小怪(可能可以忽略)
        storm(1,598.679,-268.29,-82.6645)
        sleep(1000)
        castSpellA("冰霜新星")
        moveF(630.244,-300.706,-76.0419,0)
        moveA(642.197,-254.764,-76.7668)
        --法术反制拉前方的怪(可能可以忽略)
        silenceTarget("铁怒步兵|铁怒卫士",649.541,-239.049)
        moveA(657.344,-255.553,-72.0875)
        castSpellA("寒冰护体")
        moveF(665.854,-229.152,-68.9699,0)
        moveA(661.006,-213.68,-69.1038)
        moveA(664.055,-205.202,-69.2455)
        --冰枪术左前(可能可以忽略)
        rotateB(2.17146)
        sleep(50)
        iceLenceTarget("铁怒步兵|铁怒卫士",652.448,-201.95)
        rotateB(0.958021)
        moveF(678.887,-177.845,-65.5016,0)
        moveA(660.959,-168.444,-66.4242)
        --闪现
        sleep(100)
        castSpellA("闪现术")
        moveA(644.085,-152.145,-71.0924)
        --冰环
        castSpellA("冰霜新星")
        moveF(646.946,-129.596,-59.7906,0)
        moveA(611.929,-117.036,-54.7631)
        castSpellA("寒冰护体")
        moveA(588.923,-121.347,-59.2933)
        silenceTarget("铁怒步兵|铁怒卫士",591.492,-138.02)
        --暴风雪身后(可能可以忽略)
        --storm(1,618.416,-126.343)
        --sleep(1000)
        --到达门口
        moveF(561.768,-46.5746,-54.1599,0)
        --准备暴风雪聚怪
        keepTargetTogether(540.897,-69.0214,-62.1275)
        moveT(594.791,-64.408,-54.7704)
        castSpellA("法师护甲")
        moveA(605.75,-64.5632,-55.4874)
        --闪现
        sleep(200)
        castSpellA("闪现术")
        moveF(638.628,-63.3514,-41.165,0)
        castSpellA("魔法抑制")
        moveA(631.649,-67.8431,-42.546)
        battle1()
        rotateB(4.79076)
        moveF(627.993,-66.9434,-43.4235,1)
        castShilds()
        sleep(1000)
        castSpellA("寒冰屏障")
        sleep(2000)
        castSpellA("寒冰屏障")
  
        prints("第一次聚怪结束，开始走向另外一边")
        castSpellA("寒冰护体")
        battle()
        waitForGetRidOfBattle()
        moveF(629.384,-60.4337,-42.5302)
        --出本
        tellOtherInOrOut(2)
        --开始拾取
        pickUp() 
        moveF(626.61,-54.8915,-42.6237,0)
        pickUp() 
        if getRoleCurrentHP() < 20 then
            drink()
        end
        if getNumOfItem(11078) >= 12 then
            prints("开始前往宝库")
            --前往宝库
            moveF(628.946,-57.3383,-21.1406)
            moveA(672.857,-123.155,-24.3728)
            moveA(713.251,-183.75,-26.8656)
            moveA(754.698,-245.924,-29.2743)
            moveA(803.197,-318.677,-31.8199)
            moveA(812.915,-335.063,-32.634)
            moveF(812.915,-335.063,-46.1247,0)

            unableFly()
            unableWallThrough()
            jumpB()
            sleep(2000)
            OpenTreasures()
            tellOtherInOrOut(2)
            --宝库前往酒吧
            prints("宝库前往酒吧")
            moveF(825.032,-353.936,-28.9064)
            moveA(843.439,-298.24,-30.6395)
            moveA(864.934,-235.145,-32.606)
        else
            moveF(628.946,-57.3383,-21.1406)
            moveA(672.857,-123.155,-24.3728)
        end
        moveF(884.044,-179.091,-42.542)
        sellJunks()
        destroyJunks()
        printd("本次总计收入G:%d",getMoney()-initialMoney+1)
        printd("本次总计收入G:%d",getMoney()-initialMoney+1)
        --开始出本
        moveF(783.612,-130.032,-41.9002,0)
        moveA(724.264,-101.112,-44.4169)
        moveA(656.531,-68.105,-46.5114)
        moveA(561.614,-21.8514,-49.5417)
        moveA(474.309,20.7891,-53.0545)
        moveA(458.231,28.6439,-53.7889)
        moveF(458.021,28.151,-65.1132,0)
        unableFly()
        unableWallThrough()
        wait()

        prints("开始出本")
        moveB(456.425,38.7342,-68.9003)
        waitForLoadingPosition(456.425,38.7342,-68.9003)
        prints("出本成功")
        sleep(1000)
        useLua("/run ResetInstances()") --重置
        sleep(1000)
        prints("副本重置成功")   
        --检查是否需要修理
        --dugeonToRepaire()
        prints("脚本结束")
        --准备开始战斗
    else -- 如果身上带着灵魂状态的Debuff(人物死亡)
        -- 副本外跑尸流程
        -- 1.跑尸进本
        -- 2.出本
        -- 这样，脚本会自动循环到上面的刷怪流程，构成一个循环
        prints("开始跑尸")
        unableFly()
        unableWallThrough()
        sleep(1000)
        enableClimb()
        moveA(-6482.99,-1101.47,301.293)
        moveA(-6502.37,-1075.77,292.338)
        moveA(-6586.24,-1055.31,262.785)
        moveA(-6752.46,-1036.49,240.226)
        moveA(-6861.56,-1030.84,242.625)
        moveA(-6944.64,-1024.49,241.668)
        moveA(-7057.29,-965.264,260.145)
        moveA(-7179.91,-922.851,250.327)
        unableClimb()
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(6000)
        moveF(-7180.15,-930.262,260.087,0)
        unableFly()
        unableWallThrough()
        jumpB()
        prints("灵魂进本")
        waitForLoading()
        prints("灵魂进本成功")

    end
end

main()
--battle()
--dugeonToRepaire()
--OpenTreasures()
