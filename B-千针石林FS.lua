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

function attackClosetTarget()
    local ID1,ID2 = getClosetTargetID(3)
    local ID3,ID4 = getClosetTargetIDInBattle(3)
    local distance1 = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local distance2 = getTargetAndRoleDistanceByID(ID3,ID4,3)
    local hp1 = getTargetHPByID(ID1,ID2,3)
    local hp2 = getTargetHPByID(ID3,ID4,3)
    
    if IsBuffExist(27125) == 0 then
        castSpellA("法师护甲(等级 4)")
    end
    if ID1 ~= -1 and ID1 ~= 0 then
        if distance1 <= 14 and distance1 >= 0 and hp1 >= 1 then
            castSpellB("魔爆术(等级 6)")
        end
    end
    if ID3 ~= -1 and ID3 ~= 0 then
        if distance2 <= 14  and distance2 >= 0 and hp2 >= 1 then
            castSpellB("魔爆术(等级 6)")
        end
    end

    
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
        if(n > 4) then --如果背包大于4格子就拾取
            local ID1,ID2 = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --获得目标与玩家的距离
                if distance < 8 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    contactTarget(ID1,ID2) --拾取目标
                    useLua("/click AceGUI30Button1") --销毁垃圾
                    useLua("/click AceGUI30Button11") --销毁垃圾
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



function move(x,y,z) --改写过的移动
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 do
        moveB(x,y,z)
        attackClosetTarget()
        heal()
        pickup()
        sleep(40)
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


move(-5464.79,-1637.98,28.7485)
move(-5473.32,-1634.69,29.1987)
move(-5480.12,-1631.69,27.4015)
move(-5487.62,-1628.38,27.4386)
move(-5495.71,-1624.8,26.8568)
move(-5497.66,-1619.87,27.8349)
move(-5496.82,-1612.99,29.0598)
move(-5496.68,-1605.89,28.1083)
move(-5498.21,-1600.53,27.9417)
move(-5502.5,-1595.25,28.2525)
move(-5508.09,-1587.94,28.0837)
move(-5512.96,-1583.82,28.291)
move(-5516.8,-1588.81,28.5022)
move(-5519.8,-1592.7,29.2584)
move(-5524.79,-1594.07,29.7356)
move(-5528.97,-1593.13,29.6083)
move(-5534.84,-1594.51,29.5261)
move(-5537.4,-1598.94,28.6627)
move(-5539.39,-1606.76,27.0841)
move(-5541.42,-1614.69,25.069)
move(-5543.07,-1621.16,23.6511)
move(-5545.67,-1625.89,23.2168)
move(-5552.68,-1631.49,22.6082)
move(-5559.08,-1630.89,21.8749)
move(-5566.16,-1629.11,20.8384)
move(-5573.38,-1627.3,18.9128)
move(-5579.32,-1624.92,16.6795)
move(-5585.97,-1621.89,15.1856)
move(-5591.85,-1617.02,14.7763)
move(-5598,-1611.42,14.2567)
move(-5603.12,-1607.35,13.4572)
move(-5610.92,-1607.72,14.3174)
move(-5614.3,-1605.1,14.2407)
move(-5616.55,-1601.13,13.1836)
move(-5617.09,-1599.7,12.3895)
move(-5624.51,-1596.6,13.7962)
move(-5627.91,-1595.27,13.8306)
move(-5626.19,-1590.83,13.6635)
move(-5624.01,-1587.83,13.8868)
move(-5617.5,-1585.82,12.5756)
move(-5611.86,-1584.08,12.6534)
move(-5606.92,-1582.55,12.3572)
move(-5603.52,-1581.24,12.183)
move(-5598.16,-1578.46,11.9268)
move(-5594.24,-1576.43,12.1125)
move(-5590.09,-1574.28,11.6131)
move(-5586.85,-1572.6,11.2209)
move(-5583.06,-1572.89,10.8442)
move(-5579.73,-1574.93,10.567)
move(-5584.64,-1574.19,11.1382)
move(-5594.68,-1575.43,12.1334)
move(-5599.18,-1576.97,12.2035)
move(-5604.25,-1580.49,12.09)
move(-5609.32,-1584.01,12.571)
move(-5612.55,-1590.33,13.2325)
move(-5613.46,-1594.64,11.9754)
move(-5614.41,-1599.21,12.5862)
move(-5614.87,-1602.68,14.1714)
move(-5613.87,-1604.7,14.2547)
move(-5611.56,-1605.72,14.2344)
move(-5607.19,-1607.65,13.911)
move(-5601.53,-1610.14,13.8363)
move(-5598.06,-1611.67,14.3657)
move(-5592.65,-1615.57,14.8501)
move(-5585.3,-1620.88,15.1122)
move(-5580.19,-1624.57,16.3819)
move(-5576.94,-1625.52,17.5066)
move(-5571.34,-1626.97,19.7154)
move(-5562.1,-1628.8,21.7017)
move(-5556.94,-1630.45,22.2091)
move(-5553.1,-1631.67,22.5794)
move(-5548.5,-1629.39,22.8704)
move(-5546.34,-1627.82,23.0716)
move(-5544.42,-1622.61,23.4678)
move(-5541.63,-1615.05,24.955)
move(-5539.68,-1609.59,26.578)
move(-5538.43,-1604.58,27.6656)
move(-5537.27,-1599.94,28.5974)
move(-5535.77,-1597.43,29.0983)
move(-5529.63,-1595.76,29.673)
move(-5524.77,-1594.44,29.7648)
move(-5520.63,-1593.29,29.4828)
move(-5515.09,-1590.88,28.6883)
move(-5513.01,-1589.63,28.274)
move(-5513.86,-1584.16,28.2563)
move(-5514.16,-1582.42,28.6176)
move(-5508.34,-1587.85,28.0821)
move(-5502.68,-1594.76,28.2515)
move(-5497.33,-1601.29,27.847)
move(-5495.41,-1603.63,27.6268)
move(-5496.47,-1612.35,29.0516)
move(-5497.56,-1617.53,28.3325)
move(-5497.71,-1621.53,27.5015)
move(-5489.81,-1625.17,27.2652)
move(-5485.07,-1626.85,27.8237)
move(-5480.95,-1628.77,27.8805)
move(-5475.34,-1631.1,28.3005)
move(-5471.44,-1633.17,29.0777)
move(-5465.1,-1636.52,29.0524)


