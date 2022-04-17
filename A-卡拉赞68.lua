


maxStormLevel = 7  --当前最大暴风雪等级
maxStormID = 0xCD
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

--不卖掉的物品ID
doNotSellItems = {[17031] = true,[23883] = true,[31329] = true,[31878] = true,[17032] = true,[21990] = true,[13446] = true,[30668] = true,[22832] = true,[22829] = true,[31952] = true,[27498] = true,[31883] = true}
--不能邮寄得物品ID
doNotMailItems = {[17031]=true,[17032]=true,[13446]=true,[22829]=true}
--需要销毁的垃圾数量
mustDestroyItemNum = 1
--必须销毁的物品
mustDestroyItem = {[1] = 22044}

--脚本变量(勿动)
initialMoney = 0

--斯通纳德到卡拉赞
function StoneToDugeon()

    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-10468.5,-3330.76)--如果在传送点
    if mapDistance <= 20 and mapDistance > 0 then    
        prints("开始斯通纳德传送点到卡拉赞") 
        moveA(-10468.5,-3330.76,25.4716)
        moveA(-10446.3,-3297.47,20.1779)
        mountUp()
        moveA(-10440.8,-3284,20.1779)
        moveA(-10459.7,-3226.84,20.1783)
    end 
    roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    mapDistance = getDistanceBetween(roleX,roleY,-10482,-3258.08)--如果在传送点
    if mapDistance <= 20 and mapDistance > 0 then 
        prints("开始斯通纳德炉石点到卡拉赞") 
        --绑定炉石
        ID1,ID2 = getClosetTargetIDFilterName("卡拉",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --等待打开修理界面
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/click StaticPopup1Button1")
        sleep(1000)
        moveA(-10482,-3258.08,21.0343)
        moveA(-10459,-3262.06,20.1793)
        moveA(-10424.9,-3261.75,20.1793)
        moveA(-10408.2,-3265.15,21.7433)
        --修装备
        ID1,ID2 = getClosetTargetIDFilterName("卡尔拉",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --等待打开修理界面
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton5")
        useLua("/click GossipTitleButton3")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(3000)
        useLua("/click MerchantFrameCloseButton")
        moveA(-10416.2,-3262.4,20.1785)
        --上坐骑
        mountUp()
        moveA(-10461.5,-3265.31,20.179)
        --邮寄
        mail()
        moveA(-10449.1,-3258.32,20.1783)
        moveA(-10463.3,-3222.34,20.1789)
    end
    roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    mapDistance = getDistanceBetween(roleX,roleY,-10462.8,-3217.05)--如果在传送点
    if mapDistance <= 10 and mapDistance > 0 then 
        moveA(-10462.8,-3217.05,20.1915)
        moveA(-10458.5,-3154.24,20.1788)
        moveA(-10455.9,-3128.66,20.1788)
        moveA(-10446.7,-3098.11,23.2261)
        moveA(-10456.8,-3041.5,21.8261)
        moveA(-10459.6,-3004.64,22.5315)
        moveA(-10463.8,-2953.44,21.3707)
        moveA(-10466.6,-2890.16,17.8211)
        moveA(-10466.5,-2846.82,17.3747)
        moveA(-10464.3,-2804.26,21.7074)
        moveA(-10459.8,-2779.47,21.6856)
        moveA(-10417.1,-2725.71,21.6782)
        moveA(-10387.4,-2695.17,21.6782)
        moveA(-10380.1,-2633.04,21.6832)
        moveA(-10377.7,-2604.18,21.7591)
        moveA(-10403.2,-2568.72,23.9284)
        moveA(-10420.3,-2537.84,24.8528)
        moveA(-10396,-2468.85,39.5839)
        moveA(-10383.6,-2436.22,49.4544)
        moveA(-10404.7,-2416.72,58.4537)
        moveA(-10419.7,-2408.09,64.1064)
        moveA(-10484.5,-2388.23,75.6944)
        moveA(-10525.8,-2372.13,81.8335)
        moveA(-10548.9,-2362.15,84.5792)
        moveA(-10554.8,-2312.18,90.201)
        moveA(-10561.6,-2274.16,94.0009)
        moveA(-10572.3,-2238.77,93.3192)
        moveA(-10583.8,-2189.11,90.0489)
        moveA(-10592,-2143.51,93.0137)
        moveA(-10609,-2118.5,92.6163)
        moveA(-10642,-2090.82,102.873)
        moveA(-10702.6,-2045.01,121.778)
        moveA(-10731.2,-2016.24,121.538)
        moveA(-10733.3,-1992.17,121.649)
        moveA(-10729.6,-1965.5,121.622)
        moveA(-10753.5,-1945.46,122.284)
        moveA(-10778.8,-1951.35,122.898)
        moveA(-10795.7,-1970.28,123.157)
        moveA(-10808.7,-1987.54,122.6)
        moveA(-10809.7,-2018.98,124.643)
        moveA(-10810,-2047.75,121.788)
        moveA(-10848.1,-2091.71,122.25)
        moveA(-10825.1,-2134.65,121.548)
        moveA(-10835.1,-2174.8,121.522)
        moveA(-10896,-2211.03,121.694)
        moveA(-10925.1,-2252.09,122.435)
        moveA(-10986.4,-2275,121.531)
        moveA(-11051.3,-2259.28,121.541)
        moveA(-11086.2,-2252.99,121.532)
        moveA(-11136.6,-2256.59,120.6)
        moveA(-11172,-2251.65,113.97)
        moveA(-11178.2,-2206.88,93.9723)
        moveA(-11173.5,-2167.55,77.7505)
        moveA(-11152.8,-2139.07,60.0673)
        moveA(-11133.2,-2108.17,48.6663)
        moveA(-11126,-2096.56,47.021)
        moveA(-11128.4,-2074.66,47.0709)
        moveA(-11127.6,-2038.49,47.0745)
        moveA(-11126.3,-2019.1,47.2108)
        moveA(-11105.3,-2023.49,47.0763)
        moveA(-11092.6,-2008.26,47.0763)
        moveF(-11087.4,-2004.38,42.2565,1)
        prints("炉石到副本进本中")
        moveB(-11094.1,-1997.29,42.4755)
        waitForLoadingPosition(-11094.1,-1997.29,42.4755)
        prints("炉石到副本进本成功")    
    end
end

function dugeonToStone()
    if getMoney() >= 300 and getStoneCoolDown(6948) == 0 then
        sleep(2000)
        useItem("炉石")
        sleep(9000)
        waitForLoading()
        sleep(2000)  
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
    putMailMoney(500)--放入500G
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
    sleep(500) -- 略微延迟，防止发邮件卡住
end

--修装备
function repaire(name)
    ID1,ID2 = getClosetTargetIDFilterName(name,3,8)
    contactTarget(ID1,ID2)
    sleep(2000) --等待打开修理界面
    contactTarget(ID1,ID2)
    useLua("/click GossipTitleButton1")
    sleep(1000)
    useLua("/run RepairAllItems()")
    sleep(2000)
end



--从空中跳下
function jumpDown()
    standBy()
    sleep(500)
    unableFly()
    unableWallThrough()
    jumpB()
    sleep(2000)  
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

function sellJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
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

--前往修理
function goToRepaire()
    --获得头部的耐久度
    local headDuration = getEquipementDurationBySlotNum(5)
    --获得背包剩余的格子数目
    local unusedBag = getUnusedAllBagSlotNum()
    if unusedBag <= 10 or headDuration <= 20  then
        prints("前往修理")
        moveF(-10898.1,-1796.37,238.9649)
        moveF(-10934.9,-1804.33,236.921)
        moveF(-11011,-1819.05,234.388)
        moveF(-11110.7,-1838.33,231.69)
        moveF(-11153.8,-1846.68,248.298)
        jumpDown()
        repaire("伊萨尔")
        sellJunks()
        moveA(-11170.4,-1829,239.47)
        sleep(10000)
    end
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
        return 
    end
    prints("上BUFf")
    sleep(500)
    castSpellA("奥术智慧")
    sleep(1500)
    castSpellA("法师护甲")
    sleep(1000)
end


--冰枪术目标
function iceLenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("冰枪术目标:%s",name)
    local ID1,ID2,x,y = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    standBy()
    sleep(100)
    rotateA(x,y)
    rotateA(x,y)
    chooseTarget(ID1,ID2)
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


--基于原本FLy修改
function battleFly(x,y,z,state)
    if getGlobalFlag() ~= 1 then
        return 
    end
    local _,_,r_z = getRolePosition()
    if math.abs(z-r_z) > 2 then
        moveF(x,y,z,state)
    else
        moveA(x,y,z)
    end
end

--暴风雪拉怪
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 
    end
    standBy()
    sleep(10)
    printf("暴风雪:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        castSpellA("暴风雪")
    else
        castSpellA("暴风雪".."(等级 "..stormLevel..")")
    end

    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end

--距离检测
function battleDistanceCheck(time,distance)
    for i = 1, 40, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance1 = getClosetTargetIDInBattle(3)
        if distance1 >= 0 and distance1 < distance then
                prints("%s 过于接近，回避",name)
                return true
        end
        sleep(time/40)
    end
    return false
end


--在战斗中下雪 level = 1代表下满级,不是下1级
function stormWhenInbattle(level,x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 
    end
    --吃血检测
    if getRoleCurrentHP() <= 70 then
        useItem("特效治疗药水")
        useItem("超级治疗药水")
    end
    if getRoleCurrentMP() >= 15 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --循环卡死延迟判断，如果技能被打断，就释放一级暴风雪延续
    local stormTime = getThreadTime()
    for i = 1, 36, 1 do
        local flag = getRoleflag1()
        if flag ~= 0x08 and flag == 0x00 or flag == 0x04 or (getThreadTime() - stormTime) > 8 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= maxStormID and spellID ~= 0x0A and i > 10 and i < 30 then
            storm(1,x,y,z)
        else
            sleep(time/40)
        end
        if state == 1 then
            local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance >= 0 and distance < 13 then
                prints("%s 过于接近，回避",name)
                return
            end
        end
    end
    printd("暴风雪时间:%d",getThreadTime() - stormTime)
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



function battle()
    prints("开始正式战斗")
    
    while getRoleflag1() == 0x08 and getRoleflag1() ~= 0x04 and  getGlobalFlag() == 1 do
        --下雪门口1（怪物走来）
        stormWhenInbattle(1,-10868.4,-1794.89,78.3937,8000,1)
        --走到外侧
        battleFly(-10898.7,-1799,98.0319)
        if getRoleCurrentMP() <= 20 and getSpellCoolDown(12051) == 1 then
            standBy()
            sleep(100)
            castSpellA("唤醒")
            sleep(7000)
        else
            useLua("/use 13")
            useLua("/use 14")
            stormWhenInbattle(1,-10869.5,-1791.61,78.3937,8500,0)
        end
        sleep(500)
        --走到内侧
        battleFly(-10898.6,-1795.39,97.1787)
    end
end


function main()
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        prints("\n需要等级:68\n开始地点:斯通纳德传送点或炉石点与副本内部门口 \n技能需要:标准刷本天赋,不要刺骨！！！\n需要鞋子移动速度附魔\n需要大量精神智力装备(裁缝,夜枭)")
        dugeonToStone()
        StoneToDugeon()
        initialMoney = getMoney()
        --前往刷怪点
        castBuffs()
        moveF(-11102,-1998.29,154.8921,1)
        moveF(-11116.9,-1935.44,153.788)
        moveF(-11054.9,-1897.62,152.241)
        moveF(-10913.7,-1837.96,154.520,1) 
        --准备工作
        local headDuration = getEquipementDurationBySlotNum(5)
        if headDuration < 10 then
            goToRepaire() 
        end  
        --升空，准备拉怪 
        moveF(-10891.8,-1789.75,118.502)
        sleep(1000)
        drink()
        magicStone()
        drink()
        moveA(-10898.2,-1817.81,118.516)
        iceLenceTarget("鬼灵",-10914,-1838.06)
        moveA(-10887.6,-1816.71,116.252)
        silenceTarget("鬼灵",-10889,-1836.21)
        moveA(-10886.3,-1805.74,116.443)
        iceLenceTarget("鬼灵",-10904.3,-1812.87)
        --开始让怪到楼梯
        moveA(-10884.6,-1791.51,117.972)
        moveF(-10858.4,-1792.93,116.763)
        --moveF(-10856.7,-1794.8,106.574)
        sleep(4000)
        moveA(-10889,-1795.06,110.797)
        --前往聚怪暴风雪
        moveA(-10894,-1802.65,110.417)
        moveF(-10894,-1802.65,104.7723)
        --下雪聚怪
        storm(1,-10867.5,-1820.38,91.7319)
        local distanceState = battleDistanceCheck(7000,21)
        --走到内侧
        moveF(-10898.6,-1795.39,97.1787)
        --等待怪物到达,等待的时间根据聚怪的时间产生变化
        if distanceState == true then
            sleep(3000)
        else
            sleep(5000)
        end
    
        --正式开始战斗
        battle()
        prints("正式战斗结束")
        --开始捡尸体
        moveA(-10895.8,-1791.68,95.9627)
        moveF(-10895.8,-1791.68,78.8996,1)
        moveA(-10874.8,-1793.73,78.5277)
        pickUp() 
        destroyJunks()

        goToRepaire()
        setGlobleVairable(1,1)
        moveF(-10871.7,-1794.14,97.3941)
        jumpDown()
        printd("本次总计收入G:%d",getMoney()-initialMoney+1)
        printd("本次总计收入G:%d",getMoney()-initialMoney+1)
        sleep(100000)
    else
        --如果死后重置标志位为1,就在抛尸状态下重置副本
        printd("GlobleVairabl = %d",getGlobleVairable(1,1))
        if getGlobleVairable(1) == 1 then
            sleep(2000)
            useLua("/run ResetInstances()") --重置
            sleep(1000)
            prints("副本重置成功")   
            setGlobleVairable(1,0)
        end
        moveA(-11104.6,-1830.5,71.8651)
        moveA(-11068.5,-1828.84,60.2697)
        moveF(-11068.5,-1828.84,48.6474,1)
        moveA(-11073.7,-1912.07,47.398)
        moveA(-11067.4,-1966.39,46.5002)
        jumpDown()
        moveA(-11078.4,-1975.56,40.3192)
        moveA(-11087.7,-1983.34,43.8297)
        prints("跑尸开始进本")
        moveB(-11096,-1990.53,47.0757)
        waitForLoadingPosition(-11096,-1990.53,47.0757)
        prints("跑尸进本成功")
    end
end

main()
