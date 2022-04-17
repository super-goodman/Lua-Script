

level  = getRoleLevel()--获得人物等级
if level < 52 then --如果等级小于52级
    maxStormLevel = 4  --当前最大暴风雪等级
    maxStormID = 0xC9  --当前最大暴风雪的技能ID 16进制的后2位
    maxShieldID = 13031  --当前最大寒冰护体法术ID
else --如果等级大于等于52级
    maxStormLevel = 5  --当前最大暴风雪等级
    maxStormID = 0xCA  --当前最大暴风雪的技能ID 16进制的后2位
    maxShieldID = 13032  --当前最大寒冰护体法术ID
end

maxWaterLevel = 6 --最大水制造等级
maxBreadLevel = 6 --最大面包制作等级
maxLevelWaterName = "魔法苏打水"  --使用水名字
maxLevelBreadName = "魔法甜面包" --使用面包名字
maxLevelWaterCreatorID = 8078   --使用水物品ID
maxLevelBreadCreatorID = 8076   --使用面包物品ID
maxLevelWaterBUFFID = 1137      --使用水BUFFID
maxLevelBreadBUFFID = 1131      --使用面包BUFFID
waitTime = 15 --爆本时间设置
pickUpCheck = 1 --设置是否拾取,默认拾取

--不卖掉的物品ID
doNotSellItems = {[1705]=true,[6149]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--不能邮寄得物品ID
doNotMailItems = {[17031]=true,[17032]=true,[6149]=true}
--需要销毁的垃圾数量
mustDestroyItemNum = 1
--需要销毁的物品的ID
mustDestroyItem = {[1]=11734}



--脚本变量(不要改动)
deadCheck = 0 --校验是否在中途死亡

--改写过特意为走台子设计的移动函数
function move(x,y,z,dis)
    moveB(x,y,z)
    local rx,ry,rz = getRolePosition()
    while getDistanceBetween(x,y,rx,ry) > dis and getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 do
        moveB(x,y,z)
        sleep(40)
        rx,ry,rz = getRolePosition()
    end
end

--副本外门口到副本内
function DugeonOutToIn()
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-10171.3,-3997.14)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("开始副本外门口到副本内")
        moveB(-10171.3,-3997.14,-113.894)
        moveB(-10171.3,-3997.14,-113.894)
        waitForLoadingPosition(-10171.3,-3997.14,-113.894)
        prints("副本外门口到副本内成功")
    end
end

--炉石到副本内
function stoneToDugeon()
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-10482,-3258.08)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("开始从炉石到副本内")
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
        moveA(-10431.7,-3281.42,20.1786)
        moveA(-10407.6,-3289.55,20.179)
        moveA(-10407,-3296.79,20.1446)
        moveA(-10397.4,-3297.3,20.5325)
        moveA(-10370.7,-3317.26,22.7522)
        moveA(-10357.1,-3346.58,22.8766)
        moveA(-10350.4,-3377.25,23.2737)
        moveA(-10321.9,-3455.87,22.4871)
        moveA(-10303.9,-3522.03,22.5413)
        moveA(-10296.7,-3541.31,21.6327)
        moveA(-10293.9,-3594.3,21.6294)
        moveA(-10300.7,-3654.42,22.7738)
        moveA(-10264,-3743.86,17.2187)
        moveA(-10233.7,-3809.11,22.8239)
        moveA(-10200.5,-3822,23.5574)
        moveA(-10191.8,-3891.88,23.5003)
        moveA(-10176.2,-3995.18,-112.186)
        castSpellA("寒冰护体")
        --神庙遁地
        moveF(-10176.2,-3995.18,-112.186,0)
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(1000)
        prints("炉石到副本门口进本开始")
        moveB(-10171.3,-3997.14,-113.894)
        waitForLoadingPosition(-10171.3,-3997.14,-113.894)
        prints("炉石到副本门口进本成功")
    end
end


function dugeonToStone()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-315.903,100.197)--如果在副本里的门口
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

function pickUp() 
    if getGlobalFlag() ~= 1 or pickUpCheck == 0 then
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

--等待到15分钟，防止爆本
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if deadCheck == 1 then
        prints("开始等待防止爆本，5分钟,现在：%ss",getThreadTime())
        waitTime = 5
    else
        prints("开始等待防止爆本，15分钟,现在：%ss",getThreadTime())
    end
  
    --开始计算时间，必须刷到15分钟，不然爆本
    while getThreadTime() < waitTime*60 and getGlobalFlag() == 1  do
        sleep(5000)
        prints("剩余等待:%ss",waitTime*60-getThreadTime())
    end
    prints("防爆本等待结束")
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
    castSpellA("魔法抑制")
end

--制造法力宝石
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("制造魔法宝石")
    standBy()
    if isItemExist(8007) == 0 then
        castSpellA("制造魔法黄水晶")
        sleep(3500)
    end
    if isItemExist(5513) == 0 then
        castSpellA("制造魔法翡翠")
        sleep(3500)
    end
end


--释放盾
function castShilds()
    if getGlobalFlag() ~= 1 then
        return 
    end
    --20%蓝以下不释放盾
    if getRoleCurrentMP() < 10 then
        return
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    -- 盾没有CD时释放盾
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        castSpellA("寒冰护体")
        return
    end
    --都没有，就极冷寒冰护盾
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        castSpellA("急速冷却")
        sleep(10)
        castSpellA("寒冰护体")
    end
end

--准备工作
function preparation()
    --开始准备工作
    prints("开始准备工作")
    drink()
    magicStone()
    drink()
    castBuffs()
    drink()
    castShilds()
    drink()
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
    printf("暴风雪:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("暴风雪".."(等级 "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end



--在战斗中下雪 level = 1 最高等级 level = 0 1级----state = 1 开启距离检测 0关闭距离检测
function stormWhenInbattle(level,x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --吃血检测
    if  getRoleCurrentHP() <= 70 then
        --多写一层降低性能损耗
        if isItemExist(6149) == 1 or isItemExist(13446) == 1 then
            useItem("特效治疗药水")
            useItem("优质治疗药水")
        end
    end
    --没有盾用冰冷血脉
    if (getSpellCoolDown(12472) == 0 and IsBuffExist(maxShieldID) == 0) or (getSpellCoolDown(maxFireShieldID) == 0 and IsBuffExist(maxFireShieldID) == 0) == 0 then
        castSpellB("冰冷血脉")
    end 
    --如果蓝量大于40%就使用满级暴风雪
    if getRoleCurrentMP() >= 40 and level == 1 then
        storm(maxStormLevel,x,y,z)   
    elseif level == 0 then
        storm(1,x,y,z)   
    end
    --循环卡死延迟判断，如果技能被打断，就释放一级暴风雪延续
    local stormTime = getThreadTime()
    for i = 1, 20, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - stormTime) > 7.5 then
            prints("脱战或死亡或超时")
            break
        end
        local spellID = getRoleCurrentSpellID()
        --如果技能ID不正确就一级暴风雪,并且超过1.3s后开始判断，因为前1s 法术ID标志位没有被置位
        if spellID ~= maxStormID and spellID ~= 0x0A and i > 5 and i < 15 then
            storm(1,x,y,z)
        else
            sleep(time)
        end
        if state == 1 then
            local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance >= 0 and distance < 8 then
                prints("%s 过于接近，回避",name)
                return
            end
        end
    end
    printd("暴风雪持续时间:%d",getThreadTime() - stormTime)
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力黄水晶")
        return
    end
    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("法力翡翠")
        return
    end
    if isItemExist(6149) == 1 and getRoleCurrentMP() <= 60 then
        useItem("强效法力药水")
        return
    end


end

--距离检测
function battleDistanceCheck(time)
    for i = 1, 10, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 8 then
                prints("%s 过于接近，回避",name)
                return
        end
        sleep(time)
    end
end

--聚怪
function battle1()
    prints("开始聚怪战斗")
    sleep(4000)
    --第一个点
    stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
    --第二个点
    castShilds()
    stormWhenInbattle(0,-284.706,76.2606,-91.467,200)  
    --开始躲避第一波轰炸
    moveA(-303.732,91.7557,-91.4674)
    move(-303.693,89.5952,-88.5929,1)
    sleep(9000)
    castSpellA("寒冰护体")
    --返回回去
    moveA(-299.28,94.3029,-91.4685)
    moveA(-298.392,101.316,-90.6758)
    --开启爬墙
    enableClimb()
    --上墙并跳跃
    move(-298.415,102.308,-88.7195,1)
    jumpB()
    castShilds()
    --前往A怪开始地点
    moveA(-308.763,101.805,-88.5769,3)
    --开始正向A怪
    --第一个点
    standBy()
    stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
    --第二个点
    castShilds()
    stormWhenInbattle(1,-284.706,76.2606,-91.467,400)  
    --第三个点
    castShilds()
    stormWhenInbattle(0,-287.171,80.8275,-91.467,350,1)
    castShilds()
    --前往地上
    moveA(-299.28,94.3029,-91.4685)
    --第二个点
    stormWhenInbattle(0,-284.706,76.2606,-91.467,350)
    --第四个点
    castShilds()
    stormWhenInbattle(1,-288.13,71.0988,-90.6759,400)
    --第五个点
    stormWhenInbattle(0,-291.516,65.0149,-91.4671,350,1)
    castShilds()
end




--正式战斗
function battle2()
    prints("开始正式战斗")
    while getRoleflag1() == 0x08 and getRoleflag1() ~= 0x04 and getGlobalFlag() == 1 do
        moveA(-299.28,94.3029,-91.4685)
        moveA(-298.392,101.316,-90.6758)
        --开启爬墙
        enableClimb()
        --上墙并跳跃
        move(-298.415,102.308,-88.7195,1)
        jumpB()
        castShilds()
        --前往A怪开始地点
        moveA(-308.763,101.805,-88.5769,3)
        --开始正向A怪
        --第一个点
        standBy()
        stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
        --第二个点
        castShilds()
        stormWhenInbattle(1,-284.706,76.2606,-91.467,400)
        --第三个点
        castShilds()
        stormWhenInbattle(0,-287.171,80.8275,-91.467,340,1)
        castShilds()
        --判断是否前往另外一边唤醒还是下地继续A
        if getRoleCurrentMP() < 30 and getSpellCoolDown(12051) == 1  then
            moveA(-303.732,91.7557,-91.4674)
            move(-303.693,89.5952,-88.5929,1)
            sleep(2000)
            standBy()
            castSpellA("唤醒")
            battleDistanceCheck(1000)
        else
            --前往地上，开始反向A怪
            moveA(-299.28,94.3029,-91.4685)
            --第二个点

            stormWhenInbattle(0,-284.706,76.2606,-91.467,350)
            --第四个点
            castShilds()
            stormWhenInbattle(1,-288.13,71.0988,-90.6759,400)
            --第五个点
            castShilds()
            stormWhenInbattle(0,-291.516,65.0149,-91.4671,350,1)
        end
       
    end
    printd("战斗结束!玩家当前战斗Flag = %d",getRoleflag1())
end

--主函数
function main()
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        prints("\n需要等级:49\n开始地点:斯通纳德炉石,副本内外\n炉石地点:斯通纳德\n需要必点出寒冰护体,奥术专注,魔法吸收,魔法协调\n 不要刺骨,优先寒冰护体,奥术专注与1点魔法吸收\n需要鞋子移动速度附魔\n需要大量精神智力装备(裁缝,夜枭)\n天赋图：https://github.com/super-goodman/Lua-Script/blob/main/README.md")
        DugeonOutToIn()
        dugeonToStone()
        stoneToDugeon()
        DugeonOutToIn()
        --进本后跳跃
        moveF(-315.903,100.197,-67.4536)
        --检查是否因为死亡跳过波次
        local _,_,_,_,_,_,_,_,_,_,_,distance = getClosetTargetIDToAPosition(-302.038,95.482,3)
        if distance < 20 then
            moveF(-402.826,98.4152,-70.2394)
            moveA(-482.302,128.905,-71.0511)
            --准备工作
            preparation()
            prints("脚本第一波正式开始")
            --下第一波雪
            storm(1,-499.869,149.781,-91.0591)
            sleep(1000)
            moveA(-466.341,107.446,-71.7752)
            --反制拉中间的怪
            silenceTarget("龙",-491.301,109.234)
            moveA(-400.663,132.49,-76.0984)
            --下第二波雪
            storm(1,-422.34,147.472,-90.9367)
            sleep(1000)
            moveF(-400.663,132.49,-73.0984)
            moveA(-359.359,83.748,-73.561,0)
            --掉到地上，并下一级雪4s
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(2000)
            storm(1,-378.04,95.0535,-90.865)
            sleep(4000)
            --5s雪后冰箱，并等待35s
            castSpellA("寒冰屏障")
            sleep(30000)
            moveA(-362.464,95.2888,-90.8697)
            moveA(-355.657,95.4889,-90.9073)
            --闪现
            castSpellA("闪现术")
            moveA(-298.48,96.8887,-91.4684)
            moveA(-298.392,101.316,-90.6758)
            --开启爬墙
            enableClimb()
            --上墙并跳跃
            move(-298.415,102.308,-88.7195,1)
            jumpB()
            --前往A怪开始地点
            moveA(-308.763,101.805,-88.5769,3)
            castSpellA("寒冰护体")
            --开始聚怪
            battle1()
            --开始正式的战斗
            battle2()
            --第一波战斗结束,开始拾取
            moveA(-297.588,94.7891,-91.467)
            moveA(-288.048,74.2222,-91.467)
            moveF(-288.048,74.2222,-88.1948)
            pickUp()
            --拾取结束后准备开始第二波
            moveA(-296.94,79.8073,-91.4669)
            unableFly()
            unableWallThrough()
            moveA(-296.644,94.9367,-91.4669)
            moveA(-336.498,95.4791,-90.9287)
        else
            deadCheck = 1
        end
        prints("脚本第二波正式开始")
        --准备工作
        preparation()
        moveA(-382.543,94.6914,-90.8695)
        moveF(-383.404,94.4865,-70.3386,0)
        moveF(-531.478,59.1547,-71.3054,1)
        --第一波暴风雪
        standBy()
        sleep(100)
        storm(1,-533.511,86.6282,-90.9701)
        sleep(1000)
        moveF(-430.883,35.1762,-72.4317,1)
        moveA(-405.455,53.5684,-72.7539)
        --第二波暴风雪
        standBy()
        sleep(100)
        storm(1,-424.429,40.0693,-90.9019)
        sleep(1000)
        moveA(-359.358,84.2123,-87.5611)
        standBy()
        sleep(100)
        --掉到地上，并下一级雪4s
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(2500)
        storm(1,-378.04,95.0535,-90.865)
        sleep(4000)
        --5s雪后冰箱，并等待35s
        castSpellA("寒冰屏障")
        sleep(30000)
        moveA(-362.464,95.2888,-90.8697)
        moveA(-355.657,95.4889,-90.9073)
        --闪现
        castSpellA("闪现术")
        moveA(-298.48,96.8887,-91.4684)
        moveA(-298.392,101.316,-90.6758)
        --开启爬墙
        enableClimb()
        --上墙并跳跃
        move(-298.415,102.308,-88.7195,1)
        jumpB()
        --前往A怪开始地点
        moveA(-308.763,101.805,-88.5769,3)
        castSpellA("寒冰护体")
        --开始聚怪
        battle1()
        --开始正式的战斗
        battle2()
        --第一波战斗结束,开始拾取
        moveA(-297.588,94.7891,-91.467)
        moveA(-288.048,74.2222,-91.467)
        moveF(-288.048,74.2222,-88.1948)
        pickUp()
        --开始出本
        moveF(-315.318,99.883,-125.913)
        unableFly()
        unableWallThrough()
        jumpB()
        --防爆本
        drink()
        wait()
        prints("出本开始")
        moveB(-308.647,100.205,-131.848)
        waitForLoadingPosition(-308.647,100.205,-131.848)
        prints("出本成功")
        sleep(1000)
        useLua("/run ResetInstances()") --重置
        sleep(1000)
        prints("副本重置成功")   
    else
        prints("开始跑尸")
        moveA(-10562.1,-3377.31,22.0487)
        moveA(-10533.4,-3403,22.3131)
        moveA(-10528.4,-3439.76,22.284)
        moveA(-10467.5,-3532.23,22.5713)
        moveA(-10430.5,-3591.52,22.22)
        moveA(-10412.2,-3621.4,23.7291)
        moveA(-10402.8,-3656.02,22.1372)
        moveA(-10385.4,-3692.49,18.3501)
        moveA(-10325.6,-3772.53,18.3276)
        moveA(-10276.6,-3837.36,18.3276)
        moveA(-10237.8,-3888.57,19.4929)
        moveA(-10233.3,-3918.53,20.692)
        moveA(-10213.5,-3925.8,21.9629)
        moveA(-10201,-3945.58,22.4559)
        moveA(-10170.1,-3996.37,22.4975)
        moveF(-10170.1,-3996.37,11.2189,1)
        unableFly()
        unableWallThrough()
        jumpB()
        prints("跑尸进本开始")
        waitForLoading()
        prints("跑尸进本成功")
    end
end



main()