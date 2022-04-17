maxStormLevel = 7  --当前最大暴风雪等级
maxShieldID = 33405  --当前最大寒冰护体法术ID
maxWaterLevel = 8 --最大水制造等级
maxBreadLevel = 7 --最大面包制作等级
maxLevelWaterName = "魔法山泉水"  --使用水名字
maxLevelBreadName = "魔法肉桂面包" --使用面包名字
maxLevelWaterCreatorID = 30703   --使用水物品ID
maxLevelBreadCreatorID = 22895   --使用面包物品ID
maxLevelWaterBUFFID = 34291      --使用水BUFFID
maxLevelBreadBUFFID = 29073      --使用面包BUFFID
waitTime = 15 --爆本时间设置


--脚本变量(勿动)
initialMoney = 0
resetFlag = 0
--出本修理分结束后和开始，所以需要标志位
repairResetFlag = 0

--专门为进出本设计的移动函数
function moveInOut(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    moveB(x,y,z)
end


--炉石到副本
function stornToDugeon()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,2294.99,-5347.1)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("炉石地开始出发")
        moveA(2294.99,-5347.1,90.8804)
        moveA(2292.83,-5339.2,90.8804)
        moveA(2292.69,-5332.77,90.8804)
        moveA(2282.95,-5318.98,88.7434)
        --上坐骑
        standBy()
        mountUp()
        moveA(2259.75,-5319.51,81.6764)
        --修理垃圾
        ID1,ID2 = getClosetTargetIDFilterName("工匠",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --等待打开修理界面
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(6000)
        useLua("/click MerchantFrameCloseButton")
        moveA(2262.53,-5305.01,82.1187)
        moveA(2288.7,-5316.27,88.5085)
        --邮箱
        mail()
        moveA(2296.22,-5284.8,82.1805)
        moveA(2316.64,-5232.94,85.4355)
        moveA(2325.81,-5217.15,84.0463)
        moveA(2384.88,-5163.64,74.0783)
        moveA(2430.97,-5112.89,81.4461)
        moveA(2455.92,-5089.93,76.285)
        moveA(2471.91,-5070.97,80.5016)
        moveA(2484.17,-5029.04,70.155)
        moveA(2490.52,-4981.94,74.4519)
        moveA(2492.49,-4946.69,78.7178)
        moveA(2493.95,-4920.95,76.8368)
        moveA(2491.3,-4876.13,74.8377)
        moveA(2471.8,-4837.47,73.881)
        moveA(2448.29,-4798.22,74.7355)
        moveA(2429.07,-4767.39,71.4756)
        moveA(2442.07,-4714.06,76.2384)
        moveA(2485.91,-4676.39,78.0516)
        moveA(2518.44,-4658.76,76.2983)
        moveA(2588.18,-4628.32,82.3714)
        moveA(2665.7,-4587.67,85.5991)
    
        moveA(2720.11,-4556.01,89.2648)
        moveA(2758.66,-4528.95,90.2397)
        moveA(2782.53,-4504.47,91.3378)
        moveA(2810.27,-4473.89,91.6529)
        moveA(2838.08,-4438.49,90.9734)
        moveA(2862.08,-4398.44,91.0572)
        moveA(2880.03,-4363.37,90.2409)
        moveA(2915.55,-4316.17,93.6137)
        moveA(2984.78,-4242.26,89.6534)
        moveA(3058.61,-4161.75,95.4958)
    
        moveA(3089.31,-4131.92,97.0188)
        moveA(3126.38,-4064.73,101.806)
        moveA(3155.49,-4040.56,103.817)
        moveA(3183.83,-4039.08,107.992)
        --开门
        openGate("长者广场入口")
        moveA(3197.09,-4038.61,107.991)
        moveA(3229.59,-4037.22,108.422)
        prints("进本")
        moveInOut(3235.5,-4056.65,108.467)
        waitForLoadingPosition(3235.5,-4056.65,108.467)
        prints("进本结束")
        
    end
end

--副本到炉石
function dugeonToStorn()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    moveA(3229.59,-4037.22,108.422)
    moveA(3197.09,-4038.61,107.991)
    openGate("长者广场入口")
    --防止有玩家提前开启而导致的卡住
    enableFly()
    moveA(3183.83,-4039.08,107.992)
    unableFly() 
    unableWallThrough()
    moveA(3171.2,-4042.08,105.149)
    standBy()
    mountUp()
    moveA(3155.49,-4040.56,103.817)
    moveA(3126.38,-4064.73,101.806)
    moveA(3089.31,-4131.92,97.0188)
    moveA(3058.61,-4161.75,95.4958)

    moveA(2984.78,-4242.26,89.6534)
    moveA(2915.55,-4316.17,93.6137)
    moveA(2880.03,-4363.37,90.2409)
    moveA(2862.08,-4398.44,91.0572)
    moveA(2838.08,-4438.49,90.9734)
    moveA(2810.27,-4473.89,91.6529)
    moveA(2782.53,-4504.47,91.3378)
    moveA(2758.66,-4528.95,90.2397)
    moveA(2720.11,-4556.01,89.2648)
    moveA(2665.7,-4587.67,85.5991)
    moveA(2588.18,-4628.32,82.3714)
    moveA(2518.44,-4658.76,76.2983)
    moveA(2485.91,-4676.39,78.0516)
    moveA(2442.07,-4714.06,76.2384)
    moveA(2429.07,-4767.39,71.4756)
    moveA(2448.29,-4798.22,74.7355)
    moveA(2471.8,-4837.47,73.881)
    moveA(2491.3,-4876.13,74.8377)
    moveA(2493.95,-4920.95,76.8368)
    moveA(2492.49,-4946.69,78.7178)
    moveA(2490.52,-4981.94,74.4519)
    moveA(2484.17,-5029.04,70.155)
    moveA(2471.91,-5070.97,80.5016)
    moveA(2455.92,-5089.93,76.285)
    moveA(2430.97,-5112.89,81.4461)
    moveA(2384.88,-5163.64,74.0783)
    moveA(2325.81,-5217.15,84.0463)
    moveA(2282.67,-5317.75,88.6079)
    moveA(2294.27,-5335.28,90.8806)
    moveA(2293.12,-5344.16,90.8806)
end

--检查是否需要修理和卖
function checkIfNeedRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,3588,-3637.26)--如果在副本内才执行
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        headDuration = getEquipementDurationBySlotNum(1)
        printd("当前头部耐久：%d",headDuration)
        printd("当前未使用背包数量：%d",unusedBag)
        if unusedBag > 20 and headDuration >= 30 then --如果装备不红，背包没满，就出本继续

        elseif unusedBag <= 20 or headDuration <= 30 then --如果装备红了或者背包满了回城修理
            if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
                prints("修理-开始出本")
                if  getStoneCoolDown(6948) == 0 then --如果炉石没在CD,就使用炉石
                    sleep(2000)
                    useItem("炉石")
                    sleep(9000)
                    waitForLoading()
                    sleep(2000)
                    --重置副本
                    if repairResetFlag == 1 then
                        useLua("/run ResetInstances()") --重置
                        sleep(1000)
                        prints("副本重置成功")
                    end
                    stornToDugeon()
                else
                    moveInOut(3588,-3637.26,138.469)
                    waitForLoadingPosition(3588,-3637.26,138.469)
                    moveA(3229.59,-4037.22,108.422)
                    if repairResetFlag == 1 then
                        useLua("/run ResetInstances()") --重置
                        prints("副本重置成功")
                    end 
                    dugeonToStorn()
                    stornToDugeon()
                end     
            end
        end
    end
end


--副本门口到副本里
function DugeonGateToInside()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,3235.5,-4056.65)--如果在副本门口
    if mapDistance1 <= 40 and mapDistance1 > 0 then 
        prints("从副本门口出发，进本")
        moveInOut(3235.5,-4056.65,108.467)
        prints("开始等待进本读条")
        waitForLoadingPosition(3235.5,-4056.65,108.467)
    end
end

function mail()
    prints("开始邮寄")
    bagNum = getBagSlotNum(0) --获得背包的大小
    unUsedSLot = getUnusedBagSlotNum(0)--获得所有背包剩余的空格子
    if bagNum-unUsedSLot > 0 then --如果背包中有东西
        contactClosetMailObjec()--与邮箱互动(打开邮箱)
        clickSendMailFrame()--打开发送页面
        setMailTargetName()--填写名字，名字在脚本界面填写
        for k = 9,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
            putMailItem(0,k) --放入
            sleep(10)
        end
        sendMail()--发送邮件
        useLua("/click MailFrameCloseButton")
        sleep(500) -- 略微延迟，防止发邮件卡住
    end
    for i=1,4,1 do --循环将所有副背包的物品都放入,直到填满邮件
        bagNum = getBagSlotNum(i) --获得背包的大小
        unUsedSLot = getUnusedBagSlotNum(i)--获得所有背包剩余的空格子
        if bagNum-unUsedSLot > 0 then --如果背包中有东西
            contactClosetMailObjec()--与邮箱互动(打开邮箱)
            clickSendMailFrame()--打开发送页面
            setMailTargetName()--填写名字，名字在脚本界面填写
            for k = 1,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
                putMailItem(i,k) --放入
                sleep(10)
            end
            sendMail()--发送邮件
            useLua("/click MailFrameCloseButton")
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
    end
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    putMailMoney(200)--放入1G
    setMailTargetName()--填写名字，名字在脚本界面填写
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
    castSpellA("法师护甲")
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
        sleep(1000)
        --如果一不小心在战斗中，就放魔爆术
        if getRoleflag1() == 0x08 then
            castSpellA("魔爆术")
        else
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
            contactTarget(ID1,ID2)
        end


    end
end

--拾取
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
        if(n > 1) then --如果背包大于4格子就拾取
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                if distance < 40 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    moveB(x,y,z)
                    contactTarget(ID1,ID2) --拾取目标
                    quickPickUp()
                    sleep(50)
                    useLua("/click StaticPopup1Button1")
                    
                end
            else --代表没有可以拾取的目标了，跳出循环
                break
            end
        else
            break
        end
        sleep(10)
    end
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


--在战斗中下雪
function stormWhenInbattle(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --唤醒回蓝
    if getRoleCurrentMP() <= 20 and getSpellCoolDown(12051) == 1 and getRoleCurrentHP() > 70 then
        castSpellB("冰冷血脉")
        sleep(50)
        castSpellA("唤醒")
        sleep(4000)
        return
    end
    --没有盾用冰冷血脉
--[[     if getSpellCoolDown(12472) == 1 and IsBuffExist(maxShieldID) == 0 then
        castSpellB("冰冷血脉")
    end ]]
    --如果蓝量大于50%就使用满级暴风雪
    
    if getRoleCurrentMP() >= 20 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --循环卡死延迟判断，如果技能被打断，就释放一级暴风雪延续
    for i = 1, 20, 1 do
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(380)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 4 then
            prints("%s 过于接近，回避",name)
            break
        end
    end
    --有法系怪并且没有盾的buff，盾没有CD时释放盾
    ID1 =  getClosetTargetIDInBattleFilterName("守护者",3)
    if IsBuffExist(maxShieldID) == 0 and  getSpellCoolDown(maxShieldID) == 1 and ID1 ~= -1 and ID1 ~= 0  then
        castSpellB("寒冰护体")
    end
    --吃宝石
    if isItemExist(22044) == 1 and getRoleCurrentMP() <= 65 then
        useItem("法力刚玉")
        useItem("特效法力药水")
    end
    if isItemExist(8008) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力红宝石")
    end
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力黄水晶")
    end


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


--战斗
function battle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local count = 0
    prints("开始战斗",name)
    battleFly(3686.46,-3647.17,145.638,0)
    stormWhenInbattle(3666.89,-3625.17,139.951)
    battleFly(3695.24,-3641.22,145.078,0)
    stormWhenInbattle(3679.47,-3623.01,140.264)
    --如果在战斗中，并且场上不是只剩下憎恶大胖子
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 do
        count = count + 1
        if count > 4 and checkForGetRidOfBattle() == true then
            break
        end
        --房子内  
        rotateB(3.3)
        useLua("/use 13")
        useLua("/use 14")
        battleFly(3685.83,-3646.46,146.136,0)
        stormWhenInbattle(3666.89,-3625.17,139.951)
        --房子外
        rotateB(0.7)
        battleFly(3694.8,-3640.04,145.778,0)
        stormWhenInbattle(3679.47,-3623.01,140.264)  
    end    
        
end


--等待脱战
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    prints("开始等待脱战:%d",checkForGetRidOfBattle())
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        sleep(1000)
    end
    prints("脱战成功,等待怪物消失")
    moveF(3687.52,-3646.88,145,0)
    --等待怪物消失
    sleep(19000)


end

--检测是否要脱战
function checkForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local InBattleNum = getNumOfInBattleUnit()
    printd("剩余怪物：%d",InBattleNum)
    printd("可拾取：%d",getNumOfCanBeLootUnit())
    _,_,_,_,_,HP = getLowestHPTargetID(3)
    if InBattleNum < 10 then
        return true
    else
        return false
    end
end

--等待到15分钟，防止爆本
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("开始等待防止爆本，14分钟,现在：%ss",getThreadTime())
    --开始计算时间，必须刷到15分钟，不然爆本
    while getThreadTime() < waitTime*60  do
        sleep(10000)
        prints("剩余等待:%ss",waitTime*60-getThreadTime())
    end
    prints("放爆本等待结束")
end

--小号进出本
function tellOtherInOrOut(state)
    if isInPartyOrGroup() == 1 then
        useLua("/party follow"..state) --让小号出本
        useLua("/party follow"..state) --让小号出本
    end
end


function main()
    --主程序开始
    --从本外开始
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        
        -- 副本内刷怪流程
        -- 1.从副本门口跑进副本(加延迟等待读条)
        -- 2.吃喝-上buff-吃喝
        -- 3.开始正常流程-刷完整个本

        unableFly()
        unableWallThrough()
        sleep(200)
        --副本门口到副本里
        DugeonGateToInside()
        --检测是否需要修理
        checkIfNeedRepaire()
        --炉石到副本
        stornToDugeon()
        --副本门口到副本里
        DugeonGateToInside()
        --开始准备工作
        --吃喝
        initialMoney = getMoney()
        --进本
        tellOtherInOrOut(1)
        drink()
        --上BUFF
        castBuffs()
        if isItemExist(22044) == 1  then
            useItem("法力刚玉")
        end
        drink()
        --制造法力宝石
        magicStone()
        drink()
        castSpellA("寒冰护体")
        --正式开始
        moveA(3596.73,-3655.13,138.514) 
        moveA(3622.96,-3643.19,138.51) 
        --开门
        openGate("仆从入口大门")
        --飞天
        moveF(3626.42,-3641.2,161.394,1)
  
        --moveA(3678.23,-3628.53,158.088)
        --冰枪术拉房子右边 3684.95,-3615.04
        --iceLenceTarget("死尸|骷髅",3686.61,-3612.29)
        moveA(3627.15,-3614.87,157.072)
        tellOtherInOrOut(1)
        --法术反制拉房子左边
        silenceTarget(" 死尸|骷髅",3634.02,-3620.46)
        --前往喷泉
        moveF(3619.88,-3490.09,165.684,0)
        --延迟等后面的怪上来
        sleep(3000)
        --暴风雪拉前后两波怪
        storm(1,3637.05,-3479.9,138.265)
        sleep(1000)
        --storm(1,3606.75,-3507.73,137.523)
        --sleep(1000)
        --钻进墙里面(前往前门)
        moveA(3584.63,-3493.02,162.723)
        moveA(3562.16,-3461.61,162.279)
        moveA(3512.37,-3403.62,161.173)
        castSpellA("寒冰护体")
        moveA(3459.66,-3382.98,160.006)
        --延迟等后面的怪上来
        sleep(5000)
        --冰枪术拉前门
        iceLenceTarget("死尸|骷髅",3442.14,-3377.46)
        moveA(3510.4,-3306.8,158.094)
        --暴风雪拉邮差
        storm(1,3491.72,-3303.13,130.40)
        sleep(1000)
        --前往血色正门
        moveF(3590.43,-3312.82,154,0)
        moveF(3641.8,-3320.11,153,0)
        moveF(3702.91,-3263.52,151.364,1)
 
        --暴风雪拉里面一波怪+边上食尸鬼
        storm(1,3719.55,-3261.71,127.754)
        sleep(1000)
        --storm(1,3678.04,-3265,127.469)
        --sleep(1000)
        --开始返回后门

        moveF(3690.21,-3356.56,153,0)
        castSpellA("寒冰护体")
        --moveA(3709.04,-3382.45,157.315)
        
        --救赎者铁门
        moveA(3719.21,-3458.79,152)
        silenceTarget("食尸鬼",3730.73,-3455.07)

        moveA(3672.01,-3522.44,151.881)
        moveA(3678.12,-3578.21,151)
        --等待
        --sleep(1000)
        castSpellA("魔法抑制")
        --到达房子右边开始下降
        moveF(3695.07,-3641.27,145,0)
        castSpellA("寒冰护体")
        silenceTarget("骷髅",3701.5,-3625.41)
        --进入房子，准备开始刷怪
        moveF(3686.46,-3647.17,145.638,0)
 
        battle()
        --开始穿墙并等待脱战
        --castSpellA("隐形术")
        moveF(3700.16,-3668.2,146.764,0)
        waitForGetRidOfBattle()

        --开始前往目的地拾取(别被炸死了)
        castSpellA("寒冰护体")
        moveF(3670.07,-3621.29,141.447,0)
        pickUp()
        --出本
        moveF(3614.96,-3647.25,156.545,1)
        unableFly()
        unableWallThrough()
        printd("本次收入G:%d",getMoney()-initialMoney)
        moveA(3597.01,-3654.75,138.514)
        prints("开始出本，并消耗没用完的宝石")
        if isItemExist(22044) == 1  then
            useItem("法力刚玉")
        end
        tellOtherInOrOut(2)
        castSpellA("寒冰屏障")
        sleep(1500)
        castSpellA("寒冰屏障")
        prints("开始耐久度背包检查")
        unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        headDuration = getEquipementDurationBySlotNum(1)
        if unusedBag > 20 and headDuration >= 30 then --如果装备不红，背包没满，就出本继续
            -- 6. 重置副本
            -- 9. 这样构成一个循环
            if resetFlag == 0 then
                wait()
            end
            --出本
            tellOtherInOrOut(2)
            moveInOut(3587.84,-3637.8,138.472)
            waitForLoadingPosition(3587.84,-3637.8,138.472)
            sleep(1000)
            if resetFlag == 0 then
                useLua("/run ResetInstances()") --重置
                sleep(1000)
                prints("副本重置成功")   
               
            end
        elseif unusedBag <= 20 or headDuration <= 30 then --如果装备红了或者背包满了回城修理
            if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功

                --前往炉石
                repairResetFlag = 1
                checkIfNeedRepaire()
            end
        end      
    else -- 如果身上带着灵魂状态的Debuff(人物死亡)
        -- 副本外跑尸流程
        -- 1.跑尸进本
        -- 2.出本
        -- 这样，脚本会自动循环到上面的刷怪流程，构成一个循环
        prints("开始跑尸")
        unableFly()
        unableWallThrough()
        sleep(1000)
        moveA(2676.76,-4016.84,95.1686)
        moveA(2757.58,-4015.35,96.6255)
        moveA(2829.81,-4017.36,102.793)
        moveA(2889.88,-4020.86,101.258)
        moveA(2958.57,-4034.25,100.984)
        moveA(3081.33,-4039.23,103.373)
        moveA(3179.2,-4039.46,105.703)
        moveA(3229.49,-4036.99,108.421)
        prints("灵魂进本")
        moveInOut(3235.5,-4056.65,108.467)
        waitForLoadingPosition(3235.5,-4056.65,108.467)
        prints("灵魂出本")
        moveInOut(3587.84,-3637.8,138.472)
        waitForLoadingPosition(3587.84,-3637.8,138.472)
    end
end

main()
