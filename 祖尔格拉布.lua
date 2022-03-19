
function pickUp() --拾取
    while true do -- 循环n次（mld可能有很多怪）
        if getRoleCurrentHP() == -1 then --如果结束脚本就退出
            break
        end
        local n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if(n > 4) then --如果背包大于4格子就拾取
            local ID1,ID2 = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                if distance < 40 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    contactTarget(ID1,ID2) --拾取目标
                    sleep(50)
                    useItem("裂纹的蚌壳")
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

function mail()
    for i=1,4,1 do --循环将所有副背包的物品都放入,直到填满邮件
        bagNum = getBagSlotNum(i) --获得背包的大小
        unUsedSLot = getUnusedBagSlotNum(i)--获得所有背包剩余的空格子
        if bagNum-unUsedSLot > 0 then --如果背包中有东西
            contactClosetMailObjec()--与邮箱互动(打开邮箱)
            clickSendMailFrame()--打开发送页面
            setMailTargetName()--填写名字，名字在脚本界面填写
            for k = 1,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
                putMailItem(i,k) --放入
            end
            sendMail()--发送邮件
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
    end
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    setMailTargetName()--填写名字，名字在脚本界面填写
    sendMail()--发送邮件
    sleep(500) -- 略微延迟，防止发邮件卡住
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    putMailMoney(3)
    setMailTargetName1()--填写名字，名字在脚本界面填写
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
end


function openGate()
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("祖尔格拉布大门",-11916.1,-1219.04,6,8)
    local flag1 = getTargetFlag1ByID(ID1,ID2,6)
    if flag1 == 1 then
        contactTarget(ID1,ID2)
        sleep(2000)
    end
end

function jumpAndFloat1(x,y,z)
    moveB(x,y,z)
    sleep(400)
    jumpB()
    castSpellA("缓落术")
    moveA(x,y,z)
end

function jumpAndFloat2(x,y,z)
    castSpellA("缓落术")
    jumpA(x,y,z)
end

function silence(name,x,y) --反制
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,x,y,3,8)
    --prints(name)
    chooseTarget(ID1,ID2)
    castSpellA("法术反制")
end

function movePrepare(x,y,z) --改写过的移动
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 do
        moveB(x,y,z)
     
        if getRoleflag1() == 0x08 then
            castSpellA("冰霜新星(等级 1)")
        end
        sleep(40)
        n = n + 1
        if n >= 750 then
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

function waitForRemoveBattle()
    
    while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04 and getRoleflag1() == 0x08 do
        -- body
    end
end

function drink() --吃喝
    local drinkBag, drinkSlot = getBelongBagAndSlotByID(30703)
    local breadBag, breadSlot = getBelongBagAndSlotByID(22895)
    if drinkSlot == 0 or breadSlot == 0 then
        standBy()
        castSpellA("造食术(等级 7)")
        sleep(3500)
        castSpellA("造水术(等级 8)")
        sleep(3500)
    end
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
        if IsBuffExist(29073) == 0 or IsBuffExist(34291) == 0 then
            useItem("魔法肉桂面包")
            useItem("魔法山泉水")
        end
        if getRoleCurrentHP() >= 95 and getRoleCurrentMP() >= 95 then
            break
        end
        if getRoleflag1() == 0x08 then
            local ID1,ID2 = getClosetTargetIDInBattle(3)
            while ID1 ~= 0 and ID1 ~= -1 and getRoleflag1() ~= 0x04 do
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


function jump(x,y,z)
    local x1,y1,z1 = getRolePosition()
    local x2,y2,z2 = 0,0,0
    ::continue::
    while getDistanceBetween(x1,y1,x,y) > 0.8 and z1 < 32.2 and z1 >= 0 and getRoleCurrentMP() ~= -1 do
        if getRoleCurrentHP() < 15 then
            useItem("特效治疗药水")
        end
        for i = 1, 8, 1 do
            rotateA(x,y)
            moveB(x,y,z)
            rotateA(x,y)
            jumpB()
            x1,y1,z1 = getRolePosition()
            if z1 > 32 then
                break
            end
            sleep(45)
        end
        x1,y1,z1 = getRolePosition()
    end
    standBy()
    sleep(100)
    x1,y1,z1 = getRolePosition()
    sleep(100)
    x2,y2,z2 = getRolePosition()
    if z2 ~= z1 or z2 <= 32 or z1 <= 32 then
        if z2 >= 29 and z1 >= 29 then
            --prints("goto")
            goto continue
        end

    end
   
end



function IfminionsOnUp() --检测怪群是否到下方下雪点
    local ID1,ID2,x1,y1,z1,distance,flag,mp,targetHP = 0,0,0,0,0,0,0,0,0
    local name,chat = getChatInfoByType(7)
    if name ~= "" and name ~= 0 and name ~= -1 then
        useLua("/reply 没有")
    end
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(10)
        flag = getRoleflag1()
        if flag == 0 then --脱战了就跳出
            break
        end
        mp = getRoleCurrentMP()
        if mp < 60  then
            useItem("法力刚玉")
        end

        ID1,ID2 = getClosetTargetIDToAPositionInBattle(-11732.2,-1487.62,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,-11732.2,-1487.62,3)
        --printf(distance)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 9 and distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                --prints("-------------")
                mp = getRoleCurrentMP()
                if IsBuffExist(12536) == 1 or mp >= 40 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(-11731.1,-1492.43,38.7051)
                else
                                    
                    castSpellA("暴风雪(等级 1)")
                    sleep(5)
                    castSpellPosition(-11731.1,-1492.43,38.7051)
                end
                for i = 1, 50 do
                    --[[
                    ID1,ID2 = getClosetTargetIDInBattle(3)
                    distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                    if distance <= 6 and distance >= 0 then
                        return 0
                    end
                    --]]
                    sleep(155)
                end
                ID1,ID2 = getHighestHPTargetIDInBattle(3) --第二次下雪
                targetHP = getTargetHPByID(ID1,ID2,3)
                if targetHP <= 17 and targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(-11722.2,-1495.45,34.4716)
                    sleep(8000)
                end
                return 0
            end
        end
    end
end


function IfminionsOnDown() --检测怪群是否到下方下雪点
    local ID1,ID2,x1,y1,z1,distance,flag = 0,0,0,0,0,0,0
    local x,y,z,distance1 = 0,0,0,0
    local name,chat = getChatInfoByType(7)
    local mp = 0
    if name ~= "" and name ~= 0 and name ~= -1 then
        useLua("/reply 没有")
    end
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(10)
        flag = getRoleflag1()
        if flag == 0 then --脱战了就跳出
            break
        end
        sleep(100)
        if getRoleCurrentMP() < 30  then
            useItem("法力刚玉")
        end
        
        if getRoleCurrentHP() <= 20 then
            useItem("灵纹布绷带")
            sleep(8200)
            return 0
        end
        mp = getRoleCurrentMP()
        
        if mp <= 40 and getSpellCoolDown(12051) == 1 then
            castSpellA("唤醒")
            sleep(8200)
            return 0
        end

        ID1,ID2 = getClosetTargetIDToAPositionInBattle(-11733.4,-1504.19,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,-11733.4,-1504.19,3)
       -- printf(distance)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 10 and distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                --prints("-------------")
                if IsBuffExist(12536) == 1  then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(-11732.2,-1503.03,36.9518)
                else
                                    
                    castSpellA("暴风雪(等级 1)")
                    sleep(5)
                    castSpellPosition(-11732.2,-1503.03,36.9518)
                end

                for i = 1, 50 do
                    ID1,ID2 = getClosetTargetIDInBattle(3)
                    distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                    x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
                    x,y,z = getRolePosition()
                    distance1 = math.abs(z-z1)
                    if distance <= 6 and distance >= 0 and distance1 > 2 then
                        return 0
                    end
                    
                    sleep(120)
                end
                return 0
            end
        end
    end
end

if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,-12433,212.579)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 >= 0 then
        moveA(-12433,212.579,2.36524)
        moveA(-12425.1,225.6,1.23122)
        useItem("紫色陆行鸟")
        sleep(3200)
        moveA(-12403.5,216.992,2.00727)
        moveA(-12408.9,206.503,2.16177)
        ID1,ID2 = getClosetTargetIDFilterName("哈格兰",3,6)
        contactTarget(ID1,ID2)
        sleep(1000) --等待打开修理界面
        useLua("/run RepairAllItems()")
        sleep(11000)
        useLua("/click MerchantFrameCloseButton")
        moveA(-12409.4,207.053,2.07034)
        moveA(-12391.2,202.155,1.89457)
        moveA(-12390.9,145.38,2.74639)
        mail()
        moveA(-12391.5,127.499,3.37616)

        moveA(-12382.7,90.0769,4.64884)
        moveA(-12365.4,26.0212,2.80655)
        moveA(-12353.3,-23.9292,18.9724)
        moveA(-12342.9,-55.4914,18.5596)
        moveA(-12327,-124.642,17.9594)
        moveA(-12253.7,-182.396,15.1971)
        moveA(-12196.5,-213.717,19.4693)
        moveA(-12174.8,-255.224,30.3489)
        moveA(-12178.4,-303.598,30.8916)
        moveA(-12164.8,-365.76,23.6311)
        moveA(-12156.5,-407.022,30.3479)
        moveA(-12156.7,-457.609,31.2711)
        moveA(-12109.7,-559.378,12.8666)
        moveA(-12066.1,-637.278,17.6448)
        moveA(-12036.3,-680.745,15.6803)
        moveA(-11995.3,-744.409,15.5846)
        moveA(-11961.4,-807.172,28.4101)
        moveA(-11939,-853.939,33.2532)
        moveA(-11925.2,-888.444,33.6892)
        moveA(-11921,-963.201,60.0741)
        moveA(-11920.1,-1041.65,69.8666)
        moveA(-11918.3,-1099.25,78.0994)
        moveA(-11916.4,-1145.06,77.2798)
        moveA(-11915.9,-1182.24,85.1453)
        moveA(-11915.9,-1205.11,92.2879)

    end
    moveA(-11916.1,-1219.04,92.2612)
    openGate()
    moveB(-11915.8,-1230.09,92.2612)   
    waitForLoading() 
    castSpellA("奥术智慧(等级 6)")
    castSpellA("冰甲术(等级 5)")
    useItem("紫色陆行鸟")
    sleep(3200)
    moveA(-11915.7,-1257.58,92.5444)
    moveA(-11915.5,-1273.61,85.3865)
    moveA(-11891.9,-1289.01,79.6895)
    moveA(-11869.1,-1306.81,77.2478)
    moveA(-11868,-1336.41,76.7806)
    moveA(-11866,-1368.25,71.0983)
    moveA(-11865.4,-1404.15,62.7067)
    movePrepare(-11855.5,-1416.34,59.089)
    movePrepare(-11830,-1457.33,8.86841)
    movePrepare(-11831.1,-1481.27,8.89299)
    movePrepare(-11824.6,-1485.2,10.6856)
    movePrepare(-11811.4,-1470.91,19.9283)
    movePrepare(-11805.2,-1477.54,26.8576)
    movePrepare(-11787.6,-1505.85,25.9422)
    movePrepare(-11796.3,-1531.1,20.3716)
    movePrepare(-11832.9,-1556.25,22.1222)
    movePrepare(-11845.5,-1568.29,19.5759)
    movePrepare(-11870.2,-1570.68,19.5759)
    movePrepare(-11868.4,-1644.33,19.5759)
    movePrepare(-11865.9,-1712.55,19.5759)
    movePrepare(-11864.9,-1727.26,19.5759)
    movePrepare(-11865.6,-1773.03,16.541)
    -- 准备开始


    --准备阶段
    waitForRemoveBattle()
    sleep(1000)
    drink()
    sleep(1000)
    castSpellA("寒冰护体(等级 6)")
    castSpellA("法力护盾(等级 7)")
    --开始拉怪
    useItem("紫色陆行鸟")
    sleep(3200)
    moveA(-11870.5,-1776.18,19.1569)
    moveA(-11898.8,-1741.89,13.6873)
    moveA(-11863.5,-1769.57,14.4823)
    moveA(-11838.1,-1764.28,13.6309)
    moveA(-11863.8,-1782.38,22.5964)
    moveA(-11909.7,-1783.87,40.3512)
    moveA(-11924.7,-1772.41,47.4367)
    moveB(-11922.3,-1767.25,47.3532)
    sleep(1000)
    jumpAndFloat1(-11888.5,-1688.87,11.285)
    castSpellA("寒冰护体(等级 6)")
    moveA(-11885,-1668.88,11.1455)
    useLua("/cancelAura 缓落术")
    moveA(-11881,-1657.9,10.827)
    silence("祖利安鳄鱼",-11889.1,-1683.9) 
    moveA(-11876.2,-1641.78,12.2757)
    castSpellA("冰霜新星(等级 1)")
    moveA(-11874.7,-1624.29,13.5788)
    castSpellA("闪现术")
    moveA(-11871.7,-1582.96,11.3136)
    moveA(-11872.7,-1569.6,8.92977)
    moveA(-11872.5,-1566.52,8.21748)
    castSpellA("寒冰护体(等级 6)")
    moveA(-11872.8,-1565.45,8.93464)
    rotateA(-11865.7,-1567.51)
    jumpA(-11865.7,-1567.51,13.8856)
    moveA(-11844.8,-1555.43,18.5834)
    moveA(-11805.6,-1530.71,20.0677)
    moveA(-11791.6,-1512.9,23.9398)
    silence("祖利安鳄鱼",-11808.8,-1509.59) 
    castSpellA("法术反制")
    moveA(-11781.2,-1505.96,26.9934)
    castSpellA("闪现术")
    moveA(-11748.4,-1487.61,39.8437)
    moveA(-11727,-1494.65,36.4193)
    moveA(-11700.9,-1503.71,30.862)
    --暴风雪
    castSpellA("暴风雪(等级 1)")
    sleep(5)
    castSpellPosition(-11726.2,-1494.55,36.1294)
    sleep(7000)
    rotateA(-11712.4,-1550.91,8.6834)
    jumpA(-11705.7,-1522.89,8.81789)--差坐标
    castSpellA("闪现术")
    moveA(-11712,-1558.91,9.13065)
    moveA(-11712.6,-1562.09,12.7163)
    moveA(-11709.3,-1561.84,10.4223)
    moveA(-11707.9,-1604.54,13.502)
    moveB(-11707.6,-1613.35,14.1686)
    sleep(300)
    jumpB()
    moveA(-11706,-1636.56,16.3575)
    castSpellA("寒冰护体(等级 6)")
    moveA(-11705.9,-1650.39,16.4059)
    moveA(-11700.8,-1654.97,16.0277)
    castSpellA("冰霜新星(等级 1)")
    --castSpellA("召唤水元素")
    moveA(-11701.4,-1673.02,12.6826)
    castSpellA("闪现术")
    moveA(-11702.6,-1707.15,11.2305)
    castSpellA("暴风雪(等级 1)")
    sleep(5)
    castSpellPosition(-11701.5,-1682.5,10.6772)
    sleep(7100)
    --castSpellB("冰冻术")
    --sleep(5)
    --castSpellPosition(-11701.9,-1690.41,10.3746)
    --sleep(5)
    castSpellA("暴风雪(等级 1)")
    sleep(5)
    castSpellPosition(-11701.9,-1690.41,10.3746)
    sleep(3100)
    moveA(-11702.4,-1730.28,9.3963)
    silence("祖利安鳄鱼",-11712.3,-1726.65) 
    castSpellA("闪现术")
    useLua("/run PetDismiss()")  
    moveA(-11685.8,-1755.03,11.5464)
    moveA(-11672.9,-1753.9,15.9559)
    moveA(-11667.3,-1753.48,20.882)
    moveA(-11644.1,-1743.52,31.0881)
    moveA(-11638.1,-1727.92,38.6042)
    moveA(-11640.3,-1693.24,37.6415)
    moveA(-11642.3,-1670.36,38.4249)
    moveA(-11640.9,-1659.03,38.746)
    moveA(-11642.6,-1634.8,37.7324)
    castSpellA("闪现术")
    moveA(-11645.9,-1605.21,37.5696)
    moveA(-11654.6,-1587.09,37.4292)
    moveA(-11671.9,-1567.11,38.8703)
    moveA(-11676.1,-1561.88,37.2383)
    jumpAndFloat1(-11717.7,-1539.08,8.65389)
    castSpellA("闪现术")
    moveA(-11732.5,-1533.84,8.79665)
    useLua("/cancelAura 缓落术")
    rotateA(-11734.3,-1538.83)
    jumpA(-11734.3,-1538.83,13.4413)
    moveA(-11738.7,-1535.82,14.5493)
    moveB(-11754.3,-1535.51,17.6078)
    sleep(50)
    jumpB()
    jumpA(-11754.3,-1535.51,17.6078)
    moveA(-11769.7,-1522.37,26.1229)
    moveA(-11767,-1517.51,29.0237)
    moveA(-11748.7,-1486.42,39.7162)
    castSpellA("法师护甲(等级 4)")
    moveA(-11735.3,-1491.29,41.2213)
    castSpellA("闪现术")
    moveA(-11700.2,-1503.92,30.8956)
    castSpellA("暴风雪(等级 1)")
    sleep(5)
    castSpellPosition(-11726.2,-1494.55,36.1294)
    sleep(7000)

    for i = 1, 50 do
        flag1 = getRoleflag1()
        if  flag1 == 0x08 then --在战斗中就循环战斗
                
            rotateA(-11700.2,-1504.64)
            sleep(100)
            moveA(-11700.2,-1504.64,30.903)
            jump(-11700.7,-1506.83,32.7391)
            rotateA(-11702.7,-1505.52)
            sleep(200)
            moveA(-11702.7,-1505.52,32.7161)
            rotateA(-11731.1,-1492.43)
            IfminionsOnDown()
            rotateA(-11699.6,-1503.22)
            sleep(100)
            moveA(-11699.6,-1503.22,30.9083)
            rotateA(-11731.1,-1492.43)
            IfminionsOnUp()
        elseif flag1 == 0 or flag1 == 0x04 then --脱战了就跳出
            break
        end
    end


    moveA(-11733.4,-1492.61,39.922)
    pickUp()
    sleep(60000)




    unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
    headDuration = getEquipementDurationBySlotNum(1)
    if unusedBag > 11 and headDuration >= 20 then --如果装备不红，背包没满，就出本继续
        useItem("紫色陆行鸟")
        sleep(3200)
        rotateA(-11735.7,-1493.15)
        moveA(-11735.7,-1493.15,41.101)
        moveA(-11754.1,-1487.88,37.9797)
        moveA(-11809.5,-1501.31,18.122)
        moveA(-11831.6,-1504.1,11.923)
        moveA(-11843.9,-1508.33,8.93581)
        castSpellA("闪现术")
        moveA(-11882.4,-1511.03,11.4124)
        castSpellA("寒冰护体(等级 6)")
        useItem("紫色陆行鸟")
        sleep(3200)
        moveA(-11904.8,-1523.69,24.8064)
        moveA(-11941.6,-1535.38,39.5951)
        moveA(-11916.4,-1437.22,43.4749)
        moveA(-11891.8,-1436.57,52.1899)
        moveA(-11859.6,-1431.98,53.6204)
        moveA(-11855.5,-1414.84,59.3804)
        moveA(-11866.5,-1400.08,63.5358)
        moveA(-11865.4,-1374.93,71.5843)
        moveA(-11866.1,-1343.04,75.5622)
        moveA(-11875.6,-1299.8,77.5044)
        moveA(-11907.9,-1311.41,77.5773)
        moveA(-11918.6,-1304.25,78.6505)
        moveA(-11917.2,-1258.52,92.547)
        moveB(-11917.9,-1225.98,92.534)
        waitForLoading()
        useLua("/run ResetInstances()") --重置
        






    elseif unusedBag <= 11 or headDuration < 20 then --如果装备红了或者背包满了回城修理
        if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
            sleep(3000)
            useItem("炉石")
            waitForLoading()--等待读条 和 加载蓝条结束
            -- 6. 重置副本
            useLua("/run ResetInstances()") --重置
            sleep(1000)   
        end
    end



else
    moveA(-11542.6,-228.637,27.8427)
    moveA(-11511.4,-255.487,34.7156)
    moveA(-11519.8,-313.201,37.1009)
    moveA(-11526,-371.284,40.3774)
    moveA(-11531.8,-408.958,33.0403)
    moveA(-11577.2,-435.929,20.1911)
    moveA(-11626.8,-477.939,17.6254)
    moveA(-11656.8,-521.208,22.4504)
    moveA(-11699.9,-551.214,44.2415)
    moveA(-11706.7,-549.084,47.751)
    moveA(-11725.5,-556.874,43.7638)
    moveA(-11741.6,-566.28,42.564)
    moveA(-11748.9,-614.548,36.7272)
    moveA(-11761,-660.863,39.3475)
    moveA(-11777.7,-712.315,39.0766)
    moveA(-11821.8,-776.076,34.7175)
    moveA(-11857.6,-821.342,33.3055)
    moveA(-11893,-866.237,35.2148)
    moveA(-11906.3,-883.072,32.8938)
    moveA(-11909.1,-969.825,62.2137)
    moveA(-11910.4,-1025.31,69.7316)
    moveA(-11911.1,-1070.79,77.2802)
    moveA(-11912.1,-1103.14,77.28)
    moveA(-11913.5,-1140.09,77.2815)
    moveA(-11915.4,-1187.67,86.1586)
    moveA(-11915.9,-1211.3,92.9379)
    moveB(-11915.9,-1229.84,92.2879)
    waitForLoading()
    moveB(-11917.9,-1225.98,92.534)
    waitForLoading()
end



