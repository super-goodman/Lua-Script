goBackFlag = 0
function drink()
    local drinkBag, drinkSlot = 0,0
    local breadBag, breadSlot = 0,0
   
    local je1Bag, je1Slot = getBelongBagAndSlotByID(22044)
    if je1Slot == 0 then
        standBy()
        castSpellA("制造魔法玉石")
        sleep(3500)
    end
    if getRoleCurrentHP() < 95 and getRoleCurrentMP() < 95 and getRoleCurrentHP() >= 0 and getRoleCurrentMP() >= 0 then
        useItem("魔法肉桂面包")
        useItem("魔法山泉水")
    end
    while true do
        if getRoleCurrentHP() == -1 then
            break
        end
        drinkBag, drinkSlot = getBelongBagAndSlotByID(30703)
        breadBag, breadSlot = getBelongBagAndSlotByID(22895)
        if drinkSlot == 0 or breadSlot == 0 then
            useItem("法力刚玉")
            standBy()
            castSpellA("造食术(等级 7)")
            sleep(3500)
            castSpellA("造水术(等级 8)")
            sleep(3500)
        end
        if IsBuffExist(29073) == 0 or IsBuffExist(34291) == 0 then
            useItem("魔法肉桂面包")
            useItem("魔法山泉水")
        end
        if getRoleCurrentHP() >= 95 and getRoleCurrentMP() >= 95 then
            break
        end
        if getRoleflag1() == 0x08 then
            local ID1,ID2 = getClosetTargetIDInBattle(3)
            while ID1 ~= 0 and ID1 ~= -1 do
                ID1,ID2 = getClosetTargetIDInBattle(3)
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                if distance <= 10 and distance > 0 then
                    castSpellB("魔爆术(等级 8)")
                end
            end
            useItem("魔法肉桂面包")
            useItem("魔法山泉水")
        end
        sleep(1000)
    end
    
end

function useIceLance()

    local ID1,ID2 = getClosetTargetID2(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local x,y,z = getTargetPositionByID(ID1,ID2,3)
    local name = getTargetNameByID(ID1,ID2,3)
    local ID3,ID4 = getClosetTargetIDInBattle(3)
    local distance2 = getTargetAndRoleDistanceByID(ID3,ID4,3)
    if distance <= 70 and name == "巨型血牙野猪" then

        if ID3 ~= 0 and ID3 ~= -1 and distance2 <= 10 then
            castSpellB("魔爆术(等级 8)")
        end
        moveB(x,y,z)
        sleep(200)
        chooseTarget(ID1,ID2)
        castSpellB("冰枪术(等级 1)")
    end
    pickup()


end

function heal()
    if getRoleflag1() ~= 0x08 then
        if  getRoleCurrentMP() <= 40 then
            standBy()
            drink()
        end
    end
end

function pickup()

    while true do -- 循环n次（mld可能有很多怪）
        if getRoleCurrentHP() == -1 then --如果结束脚本就退出
            break
        end
        local n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if(n > 2) then --如果背包大于4格子就拾取
            local ID1,ID2 = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                local x,y,z = getTargetPositionByID(ID1,ID2,3)
                local x1,y1,z1 = getRolePosition()
                if distance <= 12 and distance >= 0 and z-z1 <= 2 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    --for i = 1, 20 do
                        contactTarget(ID1,ID2) --拾取目标
                        sleep(300)
                        while getTargetLevelByID(ID1,ID2,3) ~= -1 and getTargetLevelByID(ID1,ID2,3) ~= 0 do
                            contactTarget(ID1,ID2) --拾取目标
                            sleep(300)
                       
                        end
                   -- end
                    --sleep(2200)
                    useLua("/click Destroyer") --销毁垃圾
                    --useLua("/click AceGUI30Button11") --销毁垃圾
                    sleep(500)
                    useLua("/click StaticPopup1Button1") --拾取蓝装
                else --范围外就跳出循环
                    break
                end
            else --代表没有可以拾取的目标了，跳出循环
                break
            end
        else
            break
        end
    end
end

function mail()
    prints("a:邮寄")
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
        if i == 3 then
            contactClosetMailObjec()--与邮箱互动
            clickSendMailFrame()--打开发送页面
            putMailMoney(1)--放入1G
            setMailTargetName1()--填写名字，名字在脚本界面填写
            sendMail()--发送邮件
            useLua("/click MailFrameCloseButton")
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
    end
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    --putMailMoney(100)--放入1G
    setMailTargetName()--填写名字，名字在脚本界面填写
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
    sleep(500) -- 略微延迟，防止发邮件卡住
end

function move(x,y,z) --改写过的移动
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 do
        moveB(x,y,z)
        useIceLance()
        heal()
    
        sleep(40)
        pickup()
        n = n + 1
        if n >= 550 then
            moveB(x+1,y+1,z)
            sleep(100)
            jumpB()
            sleep(650)
            jumpB()
            n1 = 0
        end
        x1,y1,z1 = getRolePosition()
    end
end

function checkBag()
    unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
    headDuration = getEquipementDurationBySlotNum(1)
    if unusedBag > 3 and headDuration >= 10 then --如果装备不红，背包没满，就出本继续
        -- 4. 拾取
        -- 5. 出本流程(加延迟等待读条)
        -- 6. 重置副本
        -- 9. 这样构成一个循环
    elseif unusedBag <= 3 or headDuration <= 5 then --如果装备红了或者背包满了回城修理
        if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
             -- 4. 拾取
             -- 5. 炉石(加延迟等待读条与蓝条加载20s左右)
             -- 6. 重置副本
             -- 7. 前往邮箱寄信过程
             -- 8. 前往修理商人修理过程
             -- 9. 回去副本门口过程
             -- 10. 重置副本
             -- 11. 这样构成一个循环
             goBackFlag = 1
             prints("a:回城修理继续")
             -- 5. 炉石(加延迟等待读条与蓝条加载20s左右)
             sleep(3000)
             useItem("炉石")
             prints("a:炉石")
             waitForLoading()--等待读条 和 加载蓝条结束
             prints("a:炉石读条结束")
             -- 6. 重置副本
             --useLua("/run ResetInstances()") --重置
             sleep(1000)   
        end
    end      
end

function mainF()
    --主程序开始
    --从本外开始
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        -- 副本内刷怪流程
        -- 1.从副本门口跑进副本(加延迟等待读条)
        -- 2.吃喝-上buff-吃喝
        -- 3.开始正常流程-刷完整个本
        roleX,roleY,roleZ = getRolePosition() --如果在斯通纳德
        mapDistance1 = getDistanceBetween(roleX,roleY,-10483.2,-3258.58)--如果在炉石
        if mapDistance1 <= 100 and mapDistance1 >= 0 then --如果在炉石 then
            prints("a:斯通纳德开始")
            move(-10483.2,-3258.58,21.0343)
            move(-10462.5,-3262.79,20.1786)
            mail()
            move(-10434,-3265.42,20.1777)
            move(-10408.2,-3263.48,21.8754)
            ID1,ID2 = getClosetTargetIDFilterName("卡尔拉什",3,8)
            contactTarget(ID1,ID2)
            sleep(1000) --等待打开修理界面
            useLua("/run RepairAllItems()")
            sleep(11000)
            useLua("/click MerchantFrameCloseButton")
            move(-10434,-3265.42,20.1777)
            sleep(1000)
            useItem("霜狼嗥叫者的号角")
            useItem("紫色陆行鸟")
            sleep(3500)
            move(-10456.7,-3238.34,20.3134)
            move(-10463.2,-3211.41,20.1818)
            move(-10457.2,-3136.38,20.1793)
            move(-10481.9,-3086.2,20.436)
            move(-10492.1,-3046.14,20.443)
            move(-10484.2,-3025.84,22.249)
            move(-10482.7,-2967.26,23.6878)
            move(-10467.5,-2895.29,17.3745)
            move(-10467.2,-2837.48,18.8393)
            move(-10450.6,-2760.94,21.6878)
            move(-10439.2,-2717.73,22.4074)
            move(-10437,-2709.03,22.0878)
            move(-10420.3,-2664.66,22.0275)
            move(-10412.3,-2644.46,23.0982)
            move(-10422.9,-2615.48,23.1634)
            move(-10415,-2518.85,27.4802)
            move(-10391.5,-2456.46,43.9686)
            move(-10387,-2420.88,53.5203)
            move(-10507,-2383.03,78.4759)
            move(-10552.8,-2363.26,84.6646)
            move(-10557,-2296.04,91.7236)
            move(-10585.5,-2187.77,91.9637)
            move(-10589,-2126.24,90.9656)
            move(-10523.1,-2073.76,91.7143)
            move(-10502.1,-2043.11,92.81)
            move(-10425,-2032.58,93.4242)
            move(-10439.1,-1964.72,102.859)
            move(-10444,-1865.55,104.843)
            move(-10425,-1799.68,97.6826)
            move(-10460.1,-1730.55,86.0863)
            move(-10464.1,-1671.14,78.9226)
            move(-10454.2,-1558.5,74.537)
            move(-10449.8,-1499.18,74.7108)
            move(-10456.9,-1456.88,70.0182)
            move(-10495,-1413.39,64.1992)
            move(-10464.7,-1437.48,66.9334)
            move(-10443.3,-1433.71,70.584)
            move(-10438.3,-1428.92,71.6229)
            move(-10436.9,-1410.97,75.4803)
            move(-10426.2,-1368.88,66.1716)
            move(-10400.8,-1345.28,55.9661)
            move(-10367.5,-1319.6,52.7918)
            move(-10335.7,-1295.62,38.5419)
            move(-10284.9,-1252.55,35.9309)
            move(-10261.8,-1222.97,36.0878)
            move(-10246.2,-1215.6,32.8123)
            move(-10238.3,-1189.11,35.4953)
            move(-10216,-1151.25,22.6421)
            move(-10162.1,-1147.96,25.5253)
            move(-10130.8,-1175.18,25.628)
            move(-10088.7,-1269.13,31.6251)
            move(-10078.2,-1350.11,31.0961)
            move(-10082.7,-1426.86,28.9371)
            move(-10083,-1468.99,28.2248)
            move(-10057,-1520.53,28.4999)
            move(-9984.06,-1615.65,27.5138)
            move(-9931.95,-1693.81,23.4061)
            move(-9867.13,-1726.24,23.2389)
            move(-9812.76,-1780.65,25.8236)
            move(-9721.05,-1866.52,48.7701)
            move(-9655.97,-1916.42,57.5078)
            move(-9592.83,-1980.29,66.6687)
            move(-9566.77,-2031.96,67.6857)
            move(-9544.15,-2087.38,79.2105)
            move(-9550.8,-2120.84,81.2808)
            move(-9530.47,-2173.2,97.4504)
            move(-9506.19,-2193.13,84.3345)
            move(-9499.1,-2223.92,80.7708)
            move(-9420.7,-2270.95,69.6618)
            move(-9372.43,-2277.83,71.1108)
            move(-9251.77,-2300.01,73.9251)
            move(-9185.7,-2359.49,90.1282)
            move(-9155.48,-2389.95,99.5479)
            move(-9139.77,-2442.76,109.29)
            move(-9120.31,-2494.81,116.605)
            move(-9079.3,-2536.8,120.521)
            move(-9033.17,-2576.23,125.347)
            move(-8994.28,-2607.86,130.495)
            move(-8956.43,-2599.77,132.512)
            move(-8925.63,-2589.34,132.447)
            move(-8885.63,-2552.65,130.499)
            move(-8850.71,-2556.69,130.605)
            move(-8822.11,-2569.3,130.496)
            move(-8801.34,-2581.9,130.498)
            move(-8772.83,-2583.92,130.751)
            move(-8745.39,-2583.26,132.642)

        end
        if goBackFlag == 0 then
            move(-8723.72,-2583.31,132.613)
            useIceLance()
            useIceLance()
            checkBag()
        end
        if goBackFlag == 0 then
            --rotateA(-8762.19,-2585.72)
            move(-8762.19,-2585.72,132.26)
            useIceLance()
            useIceLance()
            checkBag()   
        end
        if goBackFlag == 0 then
            --rotateA(-8723.72,-2583.31)
            move(-8799.86,-2581.36,130.497)
            useIceLance()
            useIceLance()
            --rotateA(-8762.19,-2585.72)
            checkBag()
        end
        if goBackFlag == 0 then
            move(-8762.19,-2585.72,132.26)
            useIceLance()
            useIceLance()
            --rotateA(-8799.86,-2581.36)
            checkBag()
        end
        
        
    else -- 如果身上带着灵魂状态的Debuff(人物死亡)
        -- 副本外跑尸流程
        -- 1.跑尸进本
        -- 2.出本
        -- 这样，脚本会自动循环到上面的刷怪流程，构成一个循环
    end
end




mainF()
