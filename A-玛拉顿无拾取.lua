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
                sleep(10)
            end
            sendMail()--发送邮件
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
        if i == 3 then
            contactClosetMailObjec()--与邮箱互动
            clickSendMailFrame()--打开发送页面
            putMailMoney(3)--放入1G
            setMailTargetName1()--填写名字，名字在脚本界面填写
            sendMail()--发送邮件
            useLua("/click MailFrameCloseButton")
            sleep(500) -- 略微延迟，防止发邮件卡住
        end
    end
    contactClosetMailObjec()--与邮箱互动
    clickSendMailFrame()--打开发送页面
    putMailMoney(50)--放入1G
    setMailTargetName()--填写名字，名字在脚本界面填写
    sendMail()--发送邮件
end

function pickUp(x,y) --拾取
    local distance = 0

    while true do -- 循环n次（mld可能有很多怪）
        sleep(10)
        if getRoleCurrentHP() == -1 then --如果结束脚本就退出
            break
        end
        local n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        if(n > 2) then --如果背包大于4格子就拾取
            local ID1,ID2 = getClosetTargetIDFilterCanBeLoot() --获得最近的可以被拾取的鬼屋
            if ID1 ~= 0 and ID1 ~= -1 then --证明搜索到了怪物
                distance = getTargetAndPositionDistanceByID(ID1,ID2,x,y,3) --获得目标与玩家的距离
                if distance <= 10 and distance >= 0 then -- 如果在8码范围内，防止去拾取太远的目标，然后被卡住
                    contactTarget(ID1,ID2) --拾取目标
                    sleep(10)
                    quickPickUp()
                    useLua("/click StaticPopup1Button1") --拾取蓝装
                    useItem("浮渣覆盖的袋子")
                    useLua("/click Destroyer") --销毁垃圾
                else --范围外就跳出循环
                    break
                end
            else --代表没有可以拾取的目标了，跳出循环
                break
            end
        else
            useLua("/click Destroyer") --销毁垃圾
            --useLua("/click AceGUI30Button1") --销毁垃圾
            sleep(2000)
            n = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
            if(n <= 2) then --如果背包大于4格子就拾取
                break
            end
        end
    end
   
    
end
function jumpOutOfRoof()
    while getRoleflag1() == 0x08 do -- 等待脱战结束
        --prints("等待脱战")
        sleep(200)
    end
    local x,y,z = getRolePosition()
    while getDistanceBetween(x,y,669.581, -246.182) > 2 do
        moveB(669.581,-246.182,-64.3912)
        jumpB()
        sleep(1000)
        x,y,z = getRolePosition()
    end
end

function jumpToRoof() --跳上去
    moveB(663.822,-251.164,-61.5678)
    sleep(200)
    jumpB()
end

function jumpCliff()
    moveB(814.702,-78.6533,-88.6579)
    sleep(1500)
    castSpellB("闪现术")
end

function openGate()
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("石门",-1422.38, 2924.89,6,3)
    local flag1 = getTargetFlag1ByID(ID1,ID2,6)
    
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04 do
        flag1 = getTargetFlag1ByID(ID1,ID2,6)
      
        if flag1 == 1 then
            contactTarget(ID1,ID2)
            sleep(1000)
            flag1 = getTargetFlag1ByID(ID1,ID2,6)
            --printd(flag1)
            if flag1 == 0 or flag1 == 2 then
                return 0
            end
            sleep(1000)
        else
            return 0
        end
    end
end

function drink()
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

function useIceLance(x,y)
    local ID1,ID2 = getClosetTargetIDToAPosition(x,y,3)
    chooseTarget(ID1,ID2)
    castSpellB("冰枪术(等级 1)")
end

function silence(name,x,y)
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,x,y,3,8)
    --prints(name)
    chooseTarget(ID1,ID2)
    castSpellA("法术反制")
end

function sheildAndAttact()
    local coolDown = getSpellCoolDown(33405)
    if coolDown == 1 and IsBuffExist(33405) == false then
        castSpellB("寒冰护体(等级 6)")
    else
        castSpellB("魔爆术(等级 1)")
    end
end

function firstLevelStormGathered(x,y,z) --一级暴风雪聚怪判断
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local spellID = 0
    --printf(distance)
    if distance <= 8 and distance >=0 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(x,y,z)
        for i = 1, 10, 1 do
            spellID = getRoleCurrentSpellID()
            if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                --prints("暴风雪被打断")
                castSpellB("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)
            end
            sleep(640)
        end
    end

end

function ifMnionsUnderFloor(x,y,z) --检测怪群是否到楼梯下
    local ID1,ID2,distance,spellID = 0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(100)
        if getRoleCurrentHP() < 50 then
            useItem("灵纹布绷带")
        end
        if getRoleCurrentMP() < 40 then
            useItem("唤醒")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(680.208, -246.522,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,680.208,-246.522,3)
        --printf(distance)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 3.5 and distance >= 0 then
                
                castSpellB("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)
                for i = 1, 10, 1 do
                    spellID = getRoleCurrentSpellID()
                    if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                        --prints("暴风雪被打断")
                        castSpellB("暴风雪(等级 1)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    end
                    sleep(220)
                end
                return 0
            end
        end
    end
end

function ifMnionsInposition(x,y,z) --检测怪群是否到下雪点
    local ID1,ID2,distance,spellID = 0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(10)
        if getRoleCurrentHP() < 70 then
            useItem("灵纹布绷带")
        end
        if getRoleCurrentMP() < 40 then
            useItem("唤醒")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(787.684, -508.677,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,787.684, -508.677,3)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 3.5 and distance >= 0 then
                if getRoleCurrentMP() > 40 then
                    castSpellA("暴风雪(等级 7)")
                elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
                    castSpellA("暴风雪(等级 1)")
                    
                end
                sleep(5)
                castSpellPosition(x,y,z)
                for i = 1, 10, 1 do
                    spellID = getRoleCurrentSpellID()
                    if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                        --prints("暴风雪被打断")
                        castSpellB("暴风雪(等级 7)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    end
                    sleep(820)
                end
                return 0
            end
        end
    end
end

function ifMnionsInposition2(x,y,z) --检测怪群是否到下雪点2
    local ID1,ID2,distance,spellID = 0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(10)
        if getRoleCurrentHP() < 70 then
            useItem("灵纹布绷带")
        end
        if getRoleCurrentMP() < 40 then
            useItem("唤醒")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(787.684, -508.677,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,787.684, -508.677,3)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 7 and distance >= 0 then
                castSpellB("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)
                for i = 1, 10, 1 do
                    spellID = getRoleCurrentSpellID()
                    if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                        --prints("暴风雪被打断")
                        castSpellB("暴风雪(等级 1)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    end
                    sleep(720)
                end
                return 0
            end
        end
    end
end


function IfminionsOnUp(x,y,z)--检测怪群是否到上方下雪点
    prints("上方下雪点")
    local ID1,ID2,x1,y1,z1,distance,coolDown,flag = 0,0,0,0,0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleCurrentMP() ~= 0 and getRoleflag1() ~= 0x04 do
        sleep(10)
        flag = getRoleflag1()
        if flag == 0 then --脱战了就跳出
            break
        end
        sleep(100)
        if getRoleCurrentMP() < 30 then
            useItem("法力刚玉")
        end
        if isOnlyOneMinionInBattleFilterName("毒劣魔") == 1 then
            ID1,ID2 = getClosetTargetIDInBattleFilterName("毒劣魔",3,4)
            x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
            castSpellA("暴风雪(等级 7)")
            sleep(5)
            castSpellPosition(x1,y1,z1)
            sleep(8000)
            return 0
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(801.757, -512.926,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,801.757, -512.926,3)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 9 and distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                if getRoleCurrentMP() > 40 then
                    castSpellA("暴风雪(等级 7)")
                elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
                    castSpellA("暴风雪(等级 1)")
                    
                end
                sleep(5)
                castSpellPosition(x,y,z)
                for i = 1, 50 do
                    spellID = getRoleCurrentSpellID()
                    if spellID ~= 0xCB and spellID ~= 0xCD and  spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() > 40 then
                        prints("暴风雪被打断")
                        castSpellA("暴风雪(等级 7)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    elseif spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() <= 40 then
                        prints("暴风雪被打断")
                        castSpellA("暴风雪(等级 1)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    end
                    ID1,ID2,x,y,z = getClosetTargetID(3)
                    r_x,r_y,r_z = getRolePosition()
                    distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                    if distance <= 6 and distance >= 0 and math.abs(r_z-z) < 3 then
                        return 0
                    end
                    sleep(158)
                end
              
                return 0
            end
        end

    end
end

function IfminionsOnDown(x,y,z) --检测怪群是否到下方下雪点
    prints("下方下雪点")
    local ID1,ID2,x1,y1,z1,distance,flag = 0,0,0,0,0,0,0
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
        if isOnlyOneMinionInBattleFilterName("毒劣魔") == 1 then
            ID1,ID2 = getClosetTargetIDInBattleFilterName("毒劣魔",3,4)
            x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
            castSpellA("暴风雪(等级 7)")
            sleep(5)
            castSpellPosition(x1,y1,z1)
            sleep(8000)
            return 0
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(786.727, -524.713,3)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,786.727, -524.713,3)
        if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
            if distance <= 9 and distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                if getRoleCurrentMP() > 40 then
                    castSpellA("暴风雪(等级 7)")
                elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
                    castSpellA("暴风雪(等级 1)")
                    
                end
                sleep(5)
                castSpellPosition(x,y,z)
                local time = getThreadTime()
                for i = 1, 50 do
                    spellID = getRoleCurrentSpellID()
                    if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() > 40 then
                        prints("暴风雪被打断")
                        castSpellA("暴风雪(等级 7)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    elseif spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() <= 40 then
                        prints("暴风雪被打断")
                        castSpellA("暴风雪(等级 1)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                    end
                    r_x,r_y,r_z = getRolePosition()
                    ID1,ID2 = getClosetTargetID(3)
                    distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                    if distance <= 6 and distance >= 0 and  math.abs(r_z-z) > 3 then
                        return 0
                    end

                    sleep(158)
                end
                printd("暴风雪时间 = %d",getThreadTime() - time)
                return 0
            end
        end
    end
end

function IfminionsOnMid(x,y,z) --检测怪群是否到下方下雪点
    prints("中间下雪点")
    if getRoleCurrentMP() >= 40 then
            -- body
        
        if IsBuffExist(33405) == 0 then
            return 0
        end
        local ID1,ID2,x1,y1,z1,distance,flag = 0,0,0,0,0,0,0
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
            if isOnlyOneMinionInBattleFilterName("毒劣魔") == 1 then
                ID1,ID2 = getClosetTargetIDInBattleFilterName("毒劣魔",3,4)
                x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
                castSpellA("暴风雪(等级 7)")
                sleep(5)
                castSpellPosition(x1,y1,z1)
                sleep(8000)
                return 0
            end
            ID1,ID2 = getClosetTargetIDToAPositionInBattle(795.169,-521.756,3)
            distance = getTargetAndPositionDistanceByID(ID1,ID2,795.169,-521.756,3)
            if distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                if distance <= 9 and distance >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    if getRoleCurrentMP() > 40 then
                        castSpellA("暴风雪(等级 7)")
                    elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
                        castSpellA("暴风雪(等级 1)")
                        
                    end
                    sleep(5)
                    castSpellPosition(x,y,z)
                    local time = getThreadTime()
                    for i = 1, 100 do
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() > 40 then
                            prints("暴风雪被打断")
                            castSpellA("暴风雪(等级 7)")
                            sleep(5)
                            castSpellPosition(x,y,z)
                        elseif spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a and i>= 20 and getRoleCurrentMP() <= 40 then
                            prints("暴风雪被打断")
                            castSpellA("暴风雪(等级 1)")
                            sleep(5)
                            castSpellPosition(x,y,z)
                        end
                        r_x,r_y,r_z = getRolePosition()
                        ID1,ID2 = getClosetTargetID(3)
                        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                        if distance <= 6 and distance >= 0 and  math.abs(r_z-z) > 3 then
                            return 0
                        end
                        sleep(38)--怪群到下方下雪点
                    end
                    printd("暴风雪时间 = %d",getThreadTime() - time)
                    return 0
                end
            end
        end
    end
end

function shield()--是否上盾
    local coolDown2 = getSpellCoolDown(33405) -- 盾
    local coolDown3 = getSpellCoolDown(12472) --血脉
    local coolDown4 = getSpellCoolDown(11958) -- 极冷
    if coolDown2 == 1 then
        castSpellA("寒冰护体(等级 6)")
        sleep(1400)
    elseif coolDown2 == 0 and IsBuffExist(33405) == 0 then
        castSpellB("冰冷血脉")
    elseif coolDown3 == 0 and coolDown2 == 0 and coolDown4 == 1 and IsBuffExist(33405) == 0 then
        castSpellB("急速冷却")
        castSpellA("寒冰护体(等级 6)")
        sleep(1400)
    end
end


function firstLevelStorm(x,y,z)--下一级暴风雪
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
    local x2,y2,z2 = getRolePosition()
    local spellID = 0
    --printf(distance)
    if distance <= 8 and distance >=0 and math.abs(z2 - z1)<=2 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(x,y,z)
        for i = 1, 10, 1 do
            spellID = getRoleCurrentSpellID()
            if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                --prints("暴风雪被打断")
                castSpellB("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)
            end
            sleep(720)
        end
    end
end

function maxLevelStorm(x,y,z)--下一级暴风雪
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local x1,y1,z1 = getTargetPositionByID(ID1,ID2,3)
    local x2,y2,z2 = getRolePosition()
    local spellID = 0
    --printf(distance)
    if distance <= 8 and distance >=0 and math.abs(z2 - z1)<=2 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
        if getRoleCurrentMP() > 40 then
            castSpellA("暴风雪(等级 7)")
        elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
            castSpellA("暴风雪(等级 1)")
            
        end
        sleep(5)
        castSpellPosition(x,y,z)
        for i = 1, 10, 1 do
            spellID = getRoleCurrentSpellID()
            if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0a then
                --prints("暴风雪被打断")
                if getRoleCurrentMP() > 40 then
                    castSpellA("暴风雪(等级 7)")
                elseif getRoleCurrentMP() <= 40 and getRoleCurrentMP() ~= -1 then
                    castSpellA("暴风雪(等级 1)") 
                end
                sleep(5)
                castSpellPosition(x,y,z)
            end
            sleep(820)
        end
    end
end

function jumpUp() --跳上去
    rotateB(1.0645)
    moveB(785.245,-490.023,-40.0391)
    sleep(100)
    jumpB()
end



function battle()
    --local name,chat = getChatInfoByType(7)
    --if name ~= "" and name ~= 0 and name ~= -1 then
      --  useLua("/reply 满")
    --end

    rotateB(4.31212)
    moveA( 781.57,-497.335,-42.7343 )--是否上盾--走到树上开始下下面的雪1
    shield()
    IfminionsOnMid(795.169,-521.756,-44.8361)
    IfminionsOnDown(784.664,-523.728,-49.6389) --下下面的雪
    shield()
    sleep(100)
    jumpUp()
    rotateB(4.31212)
    moveA( 785.245,-490.023,-40.0391 )--跑到上面，到位
    IfminionsOnUp(801.786,-509.902,-41.2647) --下下面的雪
    sleep(100)

end

function main()
    -- body
    --主程序开始
    --从本外开始
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        
        --启动地点
        roleX,roleY,roleZ = getRolePosition()
        mapDistance1 = getDistanceBetween(roleX,roleY,-1593.53,3149.39)--如果在炉石
        if mapDistance1 <= 20 and mapDistance1 >= 0 then --如果在炉石 then
            moveA(-1593.53,3149.39,46.4945)
            moveA(-1598.5,3141.34,46.4945)
            moveA(-1612.78,3119.97,45.1597)
            moveA(-1629.44,3102.8,36.7935)
            moveA(-1649.47,3092.34,30.6122)
            moveA(-1662.24,3086.35,30.4154)
            moveA(-1674.99,3079.01,34.38)
            moveA(-1676.36,3076.9,34.5379)
            ID1,ID2 = getClosetTargetIDFilterName("海维拉尼",3,8)
            contactTarget(ID1,ID2)
            sleep(1000) --等待打开修理界面
            useLua("/run RepairAllItems()")
            sleep(11000)
            useLua("/click MerchantFrameCloseButton")
            moveA(-1668.36,3085.98,30.6245)
            useItem("霜狼嗥叫者的号角")
            useItem("紫色陆行鸟")
            sleep(3500)
            moveA(-1624.11,3102.93,37.9205)
            moveB(-1609.94,3118.17,44.7236)
            mail()
            moveA(-1616.9,3113.95,42.8356)
            moveA(-1640.17,3089.57,31.9638)
            moveA(-1728.46,3092.6,34.8786)
            moveA(-1769.99,3070.85,20.6514)
            moveA(-1801.31,3037.54,7.60516)
            moveA(-1825.67,3010.58,12.8264)
            moveA(-1795.92,2944.74,38.9812)
            moveA(-1765.55,2879.67,59.0841)
            moveA(-1701.92,2873.39,79.3667)
            moveA(-1636.1,2877.08,95.519)
            moveA(-1598.36,2882.43,105.554)
            moveA(-1574.12,2898.42,111.414)
            moveA(-1559.1,2894.61,113.274)
            moveA(-1530.54,2884.51,115.712)
            moveA(-1515.29,2860.24,110.477)
            moveA(-1500.9,2838.57,109.018)
            moveA(-1498.35,2809.36,112.491)
            moveA(-1519.53,2777.86,111.941)
            moveA(-1528.62,2753.11,111.941)
            moveA(-1516.14,2732.57,111.954)
            moveA(-1483.91,2710.63,111.942)
            moveA(-1463.64,2720.43,112.744)
            moveA(-1438.59,2740.69,112.907)
            moveA(-1427.72,2757.01,113.114)
            moveA(-1424.52,2784.75,112.162)
            moveA(-1401.91,2819.58,112.914)
            moveA(-1415.44,2843.4,119.443)
            moveA(-1416.69,2863.6,127.153)
            moveA(-1423.07,2911.94,137.043)
            moveA(-1422.35,2924.9,136.31)--开门
            openGate()
            moveA(-1424.27,2944.92,134.548)
            castSpellB("寒冰护体(等级 6)")
            moveA(-1432.14,2948.61,134.625)
            moveA(-1440.11,2953.03,124.195)
            moveA(-1454.04,2960.03,123.408)
            moveA(-1471.38,2958.23,121.63)
            moveA(-1474.12,2970.78,122.613)
            moveA(-1471.22,2979.11,116.647)
            moveA(-1444.57,2995,115.205)
            moveA(-1432.17,2999.81,115.382)
            moveA(-1430.46,2982.86,115.737)
            moveA(-1431.61,2973.07,99.9977)
            moveA(-1426.44,2939.17,94.3915)
            castSpellB("寒冰护体(等级 6)")
            moveA(-1384.9,2918.55,92.6443)
            moveA(-1377.68,2885.07,89.279)
            moveA(-1368.45,2857.39,89.1626)
            moveA(-1344.26,2847.42,87.6364)
            moveA(-1318.76,2891.4,88.7209)
            moveA(-1305.63,2897.74,88.7486)
            moveA(-1293.39,2929.78,88.2552)
            castSpellB("寒冰护体(等级 6)")
            moveA(-1279.51,2920.76,87.9473)
            moveA(-1273.6,2903.67,87.7759)
            moveA(-1209.8,2904.93,86.4382)
            useLua("/party follow2") --让小号出本
            moveA(-1185.54,2881.45,85.9243)
            return 0
        end

        -- 副本内刷怪流程
        -- 1.从副本门口跑进副本(加延迟等待读条)
        -- 2.吃喝-上buff-吃喝
        -- 3.开始正常流程-刷完整个本
        
        moveB(-1184.72,2869.68,85.6133)
        waitForLoading()
        --进本
        drink()
        sleep(1000)
        castSpellA("奥术智慧(等级 6)")
        castSpellA("冰甲术(等级 5)")
        castSpellA("魔法抑制(等级 6)")
        drink()
        --准备工作结束

        --开始跑进去

        useLua("/party follow1") --让小号进本
        moveA(766.442,-602.741,-32.8828)
        moveA(792.868,-589.757,-32.908)
        moveA(781.783,-559.336,-32.5542)
        moveA(777.184,-543.259,-34.3982)
        moveA(777.37,-535.189,-36.9917)
        moveA(780.281,-520.732,-51.2589)
        moveA(790.953,-511.759,-52.873)--闪现
        castSpellB("闪现术")
        moveA(821.166,-473.698,-55.6676)
        moveA(833.526,-456.154,-56.3205)
        moveA(854.96,-439.599,-55.0072)
        moveA(873.436,-400.554,-51.7529)
        moveA(873.394,-378.652,-52.0495)
        moveA(869.143,-367.33,-52.0495)
        moveA(865.139,-360.625,-52.0495)
        moveA(836.539,-339.758,-51.8239)
        castSpellB("寒冰护体(等级 6)")
        moveA(809.402,-354.19,-51.5743)
        moveA(790.132,-345.124,-51.1086)
        moveA(783.561,-338.689,-50.2253)
        moveA(768.815,-333.268,-50.6594)
        moveA(758.992,-329.328,-51.4554)
        moveA(753.248,-335.979,-50.6628)--找闪现得位置
        moveA(746.354,-332.894,-50.6383)--闪现
        castSpellB("闪现术")
        moveA(721.104,-324.517,-51.0716)
        moveA(676.94,-323.676,-52.1575)
        moveA(657.654,-324.968,-52.0193)
        moveA(655.183,-319.311,-52.0193)
        castSpellB("寒冰护体(等级 6)")
        moveA(649.669,-303.409,-52.2289)
        moveA(646.332,-286.629,-52.5106)
    
        moveA(646.898,-271.447,-52.9334)
        moveA(655.024,-259.309,-53.1231)--找角度跳
        --moveA(663.822,-251.164,-61.5678)--跳进树状
        jumpToRoof()
        moveA(663.822,-251.164,-61.5678)--跳出树状--需要写跳功能
        jumpOutOfRoof()

        moveA(670.561,-237.287,-64.3912)
        moveA(670.034,-217.936,-64.3912)
        moveA(652.906,-215.909,-64.3912)
        moveA(658.304,-204.331,-64.3911)
        moveA(672.609,-210.862,-59.9547)
        moveA(678.299,-229.399,-58.6553)
        moveA(682.993,-247.394,-54.4263)
        moveA(686.386,-255.668,-53.0724)
        moveA(692.152,-256.344,-53.0522)
        moveA(692.917,-245.03,-50.6985)
        castSpellB("闪现术")
        moveA(692.948,-217.107,-47.2734)
        moveA(693.489,-193.723,-47.3674)
        moveA(693.796,-181.201,-48.2032)
        moveA(675.826,-168.931,-48.607)
        moveA(666.208,-164.496,-50.2338)
        moveA(648.736,-142.498,-51.2425)
        moveA(637.908,-148.888,-52.2114)
        moveA(616.186,-152.68,-55.0384)
        moveA(613.331,-145.961,-54.7729)
        drink()
        sleep(1000)
        castSpellA("寒冰护体(等级 6)")
    
        --开始拉怪
        moveA(623.581,-128.318,-55.0712)
        castSpellB("魔爆术(等级 1)")
        moveA(629.351,-110.456,-55.8588)
        moveA(639.728,-105.574,-56.3244)
        moveA(655.715,-108.508,-56.3868)
        moveA(673.29,-111.579,-56.0673)
        castSpellB("魔爆术(等级 1)")
        moveA(688.726,-106.921,-56.3194)
        moveA(710.253,-99.9785,-56.172)
        moveA(725.49,-99.503,-56.4771)
        moveA(749.734,-95.6281,-57.4667)
        moveA(759.19,-97.6381,-56.4076)
        castSpellB("法力护盾(等级 7)")
        moveA(776.323,-87.0245,-57.008)
        castSpellB("寒冰护体(等级 6)")
        
        moveA(783.177,-84.505,-57.1724)
        moveA(785.5,-83.9169,-57.1166)--跳悬崖
        jumpCliff()
        moveA(825.049,-49.5479,-88.2676)--暴风雪最里面软泥
        sleep(8000)--等待闪现CD
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(830.5,-18.5,-87.0)
        sleep(1400)
        moveA(825.049,-49.5479,-88.2676)--冰枪旁边大怪1
        useIceLance(813.9,-37.7)
        sleep(100)
        moveA(832.91,-67.2618,-87.3565)--冰枪大怪2
        useIceLance(830.3,-99)
        moveA(841.87,-84.1939,-87.3714)--闪现
        castSpellB("闪现术")
        moveA(860.082,-122.639,-88.4306)--冰环
        castSpellB("冰霜新星(等级 1)")
        moveA(858.232,-142.909,-88.2912)--冰枪大怪3
        useIceLance(841.8,-143.4)
        moveA(859.692,-163.132,-86.8345)--冰枪大怪4
        useIceLance(840,-177.2)
        moveA(860.89,-175.798,-86.6028)--开始向上走
        castSpellB("寒冰护体(等级 6)")
        moveA(858.654,-188.322,-82.8178)
        castSpellB("法力护盾(等级 7)")
        moveA(848.386,-194.911,-77.2909)
        castSpellB("寒冰护体(等级 6)")
        moveA(821.74,-207,-77.1483)--路过一波软泥，拉一波软泥
        useIceLance(815,-231.9)
        moveA(794.545,-189.607,-76.8009)
        sheildAndAttact()
        moveA(784.75,-187.257,-72.8342)
        sheildAndAttact()
        moveA(771.136,-211.279,-65.2178)--冰环软泥
        castSpellB("冰霜新星(等级 1)")
        moveA(764.8,-192.369,-60.9019)
        sheildAndAttact()
        moveA(771.546,-175.597,-57.3276)
        sheildAndAttact()
        moveA(776.7,-169.075,-56.4945)
        moveA(776,-160.402,-56.2427)--闪现
        castSpellB("闪现术")
        moveA(769.705,-129.117,-56.4918)
        castSpellB("寒冰护体(等级 6)")
        moveA(761.883,-115.367,-57.5583)--奥爆拉右边单只大怪
        sheildAndAttact()
        moveA(753.443,-98.0904,-57.4589)--反制左边的怪群
        silence("腐烂欺骗者",736.478,-102.708)
        moveA(743.993,-90.8413,-57.4886 )--奥爆拉右边单只大怪
        sheildAndAttact()
        moveA(736.154,-85.0157,-57.4987)--冰枪右边的怪群
        useIceLance(742.673,-54.7007)
        moveA(721.895,-86.0367,-57.3896 )--冰环
        castSpellB("冰霜新星(等级 1)")
        moveA( 691.054,-93.5874,-57.4999 )
        sheildAndAttact()
        moveA( 678.527,-94.955,-57.4999 )
        moveA( 673.348,-93.8668,-57.4999 )
        castSpellB("闪现术")
        moveA( 652.662,-90.1613,-57.5 )
        sheildAndAttact()
        moveA( 640.951,-93.1431,-57.5 )
        sheildAndAttact()
        moveA( 630.754,-98.6693,-57.5 )--拉最后一个大怪
        useIceLance(599.141,-97.2168)
        moveA( 621.781,-125.973,-55.3767 )
        castSpellB("闪现术")
        moveA( 619.455,-148.199,-54.1899 )
        sheildAndAttact()
        moveA( 622.765,-165.128,-54.3625 )
        sheildAndAttact()
        moveA( 626.057,-181.039,-53.6834 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 625.273,-185.368,-53.5531 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 625.346,-197.517,-64.6238 )
        castSpellB("寒冰护体(等级 6)")
        moveA(641.827,-229.465,-58.639)
        moveA(641.827,-229.465,-58.639)--等待怪物到位置并暴风雪聚怪
        ifMnionsUnderFloor(673.507,-229.911,-58.4701 )
        moveA( 639.272,-240.605,-54.6394 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 643.182,-272.101,-53.0335 )
        castSpellB("冰霜新星(等级 1)")
        moveA( 645.91,-293.822,-52.2885 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 649.741,-308.451,-52.065 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 656.812,-329.865,-52.0193 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 681.028,-324.901,-52.0826 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 704.996,-325.403,-52.0193 )
        castSpellA("冰霜新星(等级 1)")
        --sleep(4500)--稍微等待一会后面的怪
        moveA( 725.189,-336.197,-50.89 )
        moveA( 754.778,-347.795,-50.6642 )--准呗跳进水池
        --castSpellB("冰霜新星(等级 1)")
        moveA( 765.858,-362.168,-61.6051 )
        moveA( 778.281,-363.594,-61.26 )
        moveA( 784.168,-373.137,-58.8658 )--闪现
        castSpellB("闪现术")
        moveA( 801.011,-400.901,-58.5811 )
        moveA( 802.577,-416.652,-54.0869 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 803.105,-432.26,-54.0057 )
        moveA( 813.381,-442.953,-55.8821 )
        moveA( 824.436,-460.669,-56.3285 )
        moveA( 818.593,-474.918,-55.5525 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 814.184,-485.161,-54.9225 )
        moveA( 808.707,-490.535,-54.4575 )--再次闪现
        castSpellB("闪现术")
        moveA( 780.103,-514.917,-52.7517 )
        moveA( 777.814,-519.964,-52.0938 )
        moveA( 783.307,-526.224,-48.7376 )--开始上楼
        moveA( 786.844,-530.203,-47.3358 )
        moveA( 804.177,-514.334,-41.5158 )
        moveA( 803.296,-505.85,-40.8348 )
        moveA( 797.714,-496.423,-39.8921 )
        moveA( 786.592,-492.281,-39.9295 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 784.072,-491.122,-40.0587 ) --等待怪物到达下雪聚怪
        sleep(100)--站定
        ifMnionsInposition2(784.153,-523.619,-49.8221)
        --prints("第一波结束")
        firstLevelStorm(793.425,-521.604,-46.3805)--开始下雪拉第一波
        --prints("第二波结束")
        moveA(782.117,-490.628,-40.1348) --开始下雪拉第二波
        sleep(100)--站定
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(808.046,-494.3,-39.8185)
        sleep(1400)
        --prints("第三波结束")
        moveA(767.287,-472.172,-41.0156)--冰环 拉转交
        castSpellB("冰霜新星(等级 1)")
        moveA(741.764,-471.454,-39.2254)
        castSpellB("魔爆术(等级 1)")
        moveA(719.241,-485.206,-39.285)
        castSpellB("魔爆术(等级 1)")
        moveA(722.436,-499.037,-37.0019)--魔爆拉台子上的怪
        castSpellB("魔爆术(等级 1)")
        moveA(735.659,-518.188,-41.3001)
        moveA(736.892,-520.391,-41.0172)--闪现
        castSpellB("闪现术")
        moveA(753.194,-542.314,-32.4506)
        moveA(767.323,-538.553,-37.0245)--上盾
        castSpellB("寒冰护体(等级 6)")
        moveA(776.547,-534.835,-37.2068)--下雪聚怪1
        sleep(100)--站定
        firstLevelStormGathered(754.832,-551.524,-32.945)
        moveA(776.547,-534.835,-37.2068)--下雪聚怪2
        sleep(100)--站定
        firstLevelStormGathered(760.533,-549.265,-34.8131)
        moveA(778.142,-525.02,-50.483)--跳下去   阶段一结束
        moveA(792.853,-507.129,-53.0403)
        castSpellB("闪现术")
        moveA(812.225,-479.004,-55.0021)
        moveA(821.538,-452.924,-56.337)
        castSpellB("魔爆术(等级 1)")
        moveA(798.955,-419.685,-53.7322)
        castSpellB("寒冰护体(等级 6)")
        moveA(802.515,-400.032,-58.6444)
        moveA(787.139,-377.238,-59.1098)--开始拉水池4个树人 第一个
        useIceLance(771.501,-351.257)
        moveA(804.305,-389.964,-59.0486)
        moveA(825.202,-389.742,-59.2684)--第二个树人
        useIceLance(857.463,-383.13)
        moveA(812.014,-393.333,-59.0163)
        moveA(812.569,-389.407,-59.0676)--转头
        moveA(812.569,-389.407,-59.0676)--第四个树人
        useIceLance(813.441,-380.424) 
        moveA(796.75,-421.218,-53.6791)--转角冰环
        castSpellB("冰霜新星(等级 1)")
        moveA(798.488,-439.827,-53.6355)--瞄准闪现位置
        moveA(803.303,-439.802,-54.4097)--闪现出池子--第二阶段结束
        castSpellB("闪现术")
        moveA(836.503,-437.471,-55.996)--预留 拉巡逻的树人
        silence("深腐践踏者",841.768,-439.631)
        moveA(867.206,-409.006,-52.2189)--拉右边靠边的怪群
        useIceLance(892.859,-406.672)
        moveA(874.502,-394.766,-52.0473)
        castSpellB("魔爆术(等级 1)")
        moveA(877.021,-384.893,-52.0495)
        castSpellB("寒冰护体(等级 6)")
        moveA(871.591,-363.741,-52.0495)
        moveA(858.472,-331.439,-51.2743)--冰环准备回头闪现
        castSpellB("冰霜新星(等级 1)")
        moveA(850.015,-330.53,-51.6793)--瞄准闪现点
        moveA(844.359,-332.608,-51.6555)--闪现
        castSpellB("闪现术")
        moveA(817.67,-344.514,-51.6009)
        castSpellB("寒冰护体(等级 6)")
        moveA(768.905,-332.863,-50.6498)

        castSpellB("寒冰护体(等级 6)")
        moveA(759.263,-329.948,-51.4271)
        castSpellB("寒冰护体(等级 6)")
        moveA(735.878,-335.948,-50.795 )
        castSpellB("寒冰护体(等级 6)")
        --moveA(729.465,-331.519,-50.8566)--通过中间的守门怪
        --castSpellB("寒冰护体(等级 6)")
        moveA(714.104,-329.912,-51.7039)--闪现
        castSpellB("闪现术")
        moveA(664.93,-325.324,-52.0982)
        castSpellB("寒冰护体(等级 6)")
        moveA(654.922,-324.14,-52.0206)
        castSpellB("寒冰护体(等级 6)")
        moveA(649.427,-308.906,-52.0568)
        castSpellB("寒冰护体(等级 6)")
        moveA(645.282,-283.686,-52.749)
        castSpellB("寒冰护体(等级 6)")
        moveA(649.613,-256.917,-53.1355)
        castSpellB("寒冰护体(等级 6)")
        moveA(652.066,-242.901,-64.3912)--跳下去
        moveA(652.077,-239.998,-64.3912)--闪现
        castSpellB("闪现术")
        moveA(656.428,-205.56,-64.3912)--开始上楼梯
        castSpellB("寒冰护体(等级 6)")--上盾
        moveA(666.893,-206.992,-62.0006)
        moveA(673.21,-210.906,-59.9417)--聚怪暴风雪1
        sleep(100)--站定
        firstLevelStormGathered(642.881,-215.817,-62.823)
        moveA(673.21,-210.906,-59.9417)--聚怪暴风雪2
        sleep(100)--站定
        firstLevelStormGathered(650.208,-209.687,-64.3911)
        moveA(678.056,-217.342,-60.3896)--拉楼梯第一波怪
        silence("腐烂欺骗者",681.145,-197.491)
        moveA(677.268,-222.061,-60.246)--冰枪拉楼梯下面的树人
        useIceLance(661.249,-239.234)
        moveA(685.938,-250.545,-53.6692)--冰枪拉楼梯中间的树人
        useIceLance(694.761,-263.327)
        moveA(688.937,-257.203,-53.0614)
        moveA(694.959,-253.06,-53.0483)
        castSpellB("寒冰护体(等级 6)")
        moveA(702.9,-230.672,-47.2944)
        moveA(711.079,-213.505,-47.2549)--冰环
        castSpellB("冰霜新星(等级 1)")
        moveA(703.631,-202.34,-47.263)--闪现
        castSpellB("闪现术")
        moveA(689.246,-177.685,-48.7797)--开始拉路上的树人一
        useIceLance(688.793,-168.918)
        moveA(660.534,-159.642,-51.1787)--树人二
        castSpellB("魔爆术(等级 1)")
        moveA(647.676,-162.747,-52.517)--树人三
        useIceLance(641.854,-160.727)
        moveA(631.603,-168.926,-53.7333)--拉通往瀑布口最里面的萨特
        useIceLance(606.295,-157.426)
        moveA(625.025,-182.839,-53.6634)--走到悬崖边
        moveA(627.478,-199.195,-64.569)
        moveA(628.846,-201.469,-64.5882)--闪现
        castSpellB("闪现术")
        moveA(641.827,-229.465,-58.639)--套盾
        castSpellB("寒冰护体(等级 6)")
        moveA(641.827,-229.465,-58.639)
        moveA(641.827,-229.465,-58.639)
        moveA(638.609,-241.109,-54.4201)
        moveA(640.68,-263.291,-52.8539)
        moveA(641.435,-270.427,-53.0548)--闪现
        castSpellB("闪现术")
        moveA(647.938,-300.566,-52.2961)
        moveA(653.984,-324.36,-52.0354)
        moveA(655.942,-332.851,-52.0354)
        moveA(626.167,-354.295,-52.0354)
        moveA(613.903,-365.727,-52.0354)--开始拉里面的两拨萨特一
        sleep(100)--站定
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(607.193,-398.257,-52.0194)
        sleep(1400)
        moveA(612.845,-367.745,-52.0193)--萨特二
        sleep(100)--站定
        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(586.075,-385.67,-52.0193)
        sleep(1400)
        moveA(622.279,-354.574,-52.0193)
        castSpellB("魔爆术(等级 1)")
        moveA(631.482,-354.39,-52.0193)--闪现
        castSpellB("闪现术")
        sleep(400)
        moveA( 675.554,-358.788,-51.6527 )--拉右边的树人
        useIceLance(679.262,-373.467)
        moveA( 688.797,-350.001,-51.4984 )--冰环
        castSpellB("冰霜新星(等级 1)")
        moveA( 725.189,-336.197,-50.89 )
        --sleep(500)
        moveA( 754.778,-347.795,-50.6642 )--跳进水池
        moveA( 768.612,-356.793,-61.6126 )--闪现
        castSpellB("闪现术")
        moveA( 794.636,-385.743,-59.0356 )
        moveA( 801.067,-419.93,-53.6133 )
        moveA( 803.727,-435.677,-54.2975 )
        castSpellB("法师护甲(等级 4)")
        moveA( 818.87,-447.867,-56.251 )
        moveA( 822.923,-460.974,-56.2987 )
        moveA( 816.962,-474.017,-55.551 )--闪现
        castSpellB("闪现术")
        moveA( 783.925,-511.539,-52.9447 )
        moveA( 777.5,-517.775,-52.7455 )
        castSpellB("魔法抑制(等级 6)")
        moveA( 783.952,-526.325,-48.5291 )
        moveA( 798.981,-523.246,-43.9313 )
        moveA( 804.008,-508.463,-41.094 )
        castSpellB("寒冰护体(等级 6)")
        moveA( 796.865,-496.747,-39.9199 )
        useItem("自然防护药水")
        moveA( 784.901,-489.862,-40.0656 )--准备开始A怪，检测血量并判断怪物是否到达位置
        sleep(100)
        ifMnionsInposition(784.153,-523.619,-49.8221)--到位
        maxLevelStorm(793.425,-521.604,-46.3805)--满级雪1
        sleep(100)
        maxLevelStorm(801.128,-513.809,-41.952)--满级雪2

        for i = 1, 30,1 do
            flag1 = getRoleflag1()
            if  flag1 == 0x08 then --在战斗中就循环战斗
                battle()
            elseif flag1 == 0 then --脱战了就跳出
                sleep(1000)
                flag1 = getRoleflag1()
                if  flag1 == 0 then --在战斗中就循环战斗\

                    break
                end
            end
        end





        unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        headDuration = getEquipementDurationBySlotNum(1)
        if unusedBag >= 20 and headDuration >= 20 then --如果装备不红，背包没满，就出本继续
            -- 4. 出本流程(加延迟等待读条)
            -- 5. 重置副本
            -- 6. 这样构成一个循环
            
            moveA(779.865,-514.355,-52.7574) --1
            --pickUp(779.865,-514.355,-52.7574)
            moveA(779.865,-514.355,-52.7574) --1
            moveA(774.363,-519.403,-52.8338)
            moveA(780.323,-528.965,-48.4174)

            moveA(782.35,-527.813,-48.3971)
            --pickUp(782.35,-527.813,-48.3971)--6
            moveA(782.35,-527.813,-48.3971)

            moveA(788.932,-529.318,-47.2997) --2
            --(788.932,-529.318,-47.2997)
            moveA(788.932,-529.318,-47.2997) --2

            moveA(794.455,-528.677,-46.6925) --5
            --pickUp(794.455,-528.677,-46.6925)
            moveA(794.455,-528.677,-46.6925) --5

            moveA(793.896,-529.632,-47.0232)
            moveA(799.677,-527.035,-44.8881) --6
            --pickUp(799.677,-527.035,-44.8881)
            moveA(799.677,-527.035,-44.8881) --6

            moveA(804.114,-519.253,-42.1569)-- 3
            --(804.114,-519.253,-42.1569)
            moveA(804.114,-519.253,-42.1569)-- 3

            moveA(808.08,-505.252,-40.9589)
            moveA(806.339,-505.818,-40.9462)--4
            --pickUp(806.339,-505.818,-40.9462)   
            moveA(806.339,-505.818,-40.9462)--4
            useLua("/click AceGUI30Button11") --销毁垃圾
            useLua("/click AceGUI30Button1") --销毁垃圾
            moveA(801.572,-494.447,-39.7554)
            moveA(784.643,-490.146,-40.0709)
            moveA(767.381,-470.598,-41.0766)
            moveA(740.779,-469.176,-39.2228)
            moveA(733.329,-475.261,-40.795)
            moveA(734.655,-489.248,-41.1003)
            castSpellB("闪现术")
            moveA(741.051,-527.271,-37.03)
            moveA(753.944,-552.429,-32.987)
            moveA(780.982,-571.218,-32.9624)
            moveA(798.754,-596.429,-32.4338)
            moveA(791.282,-599.179,-32.5302)
            moveA(779.969,-601.641,-32.4332)
            castSpellB("闪现术")
            moveA(754.719,-610.007,-32.9982)
            useLua("/party follow2") --让小号出本
            moveB(754.893,-628.817,-32.774)
            waitForLoading()
            useLua("/run ResetInstances()") --重置


        elseif unusedBag <= 19 or headDuration <= 20 then --如果装备红了或者背包满了回城修理
            if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
                -- 4. 炉石(加延迟等待读条与蓝条加载20s左右)
                -- 5. 重置副本
                -- 6. 前往邮箱寄信过程
                -- 7. 前往修理商人修理过程
                -- 8. 回去副本门口过程
                -- 9. 重置副本
                -- 10. 这样构成一个循环

                moveA(779.865,-514.355,-52.7574) --1
                --pickUp(779.865,-514.355,-52.7574)
                moveA(779.865,-514.355,-52.7574) --1
                moveA(774.363,-519.403,-52.8338)
                moveA(780.323,-528.965,-48.4174)
               
                moveA(782.35,-527.813,-48.3971)
                --pickUp(782.35,-527.813,-48.3971)--6
                moveA(782.35,-527.813,-48.3971)
               
                moveA(788.932,-529.318,-47.2997) --2
                --pickUp(788.932,-529.318,-47.2997)
                moveA(788.932,-529.318,-47.2997) --2
               
                moveA(794.455,-528.677,-46.6925) --5
                --pickUp(794.455,-528.677,-46.6925)
                moveA(794.455,-528.677,-46.6925) --5
               
                moveA(793.896,-529.632,-47.0232)
                moveA(799.677,-527.035,-44.8881) --6
                --pickUp(799.677,-527.035,-44.8881)
                moveA(799.677,-527.035,-44.8881) --6
               
                moveA(804.114,-519.253,-42.1569)-- 3
                --pickUp(804.114,-519.253,-42.1569)
                moveA(804.114,-519.253,-42.1569)-- 3
               
                moveA(808.08,-505.252,-40.9589)
                moveA(806.339,-505.818,-40.9462)--4
                --pickUp(806.339,-505.818,-40.9462)   
                moveA(806.339,-505.818,-40.9462)--4
                useLua("/click AceGUI30Button11") --销毁垃圾
                useLua("/click AceGUI30Button1") --销毁垃圾
                sleep(3000)
                useItem("炉石")
                waitForLoading()--等待读条 和 加载蓝条结束
                moveA(-1593.53,3149.39,46.4945)
                moveA(-1598.5,3141.34,46.4945)
                moveA(-1612.78,3119.97,45.1597)
                moveA(-1629.44,3102.8,36.7935)
                moveA(-1649.47,3092.34,30.6122)
                moveA(-1662.24,3086.35,30.4154)
                moveA(-1674.99,3079.01,34.38)
                moveA(-1676.36,3076.9,34.5379)
                ID1,ID2 = getClosetTargetIDFilterName("海维拉尼",3,8)
                contactTarget(ID1,ID2)
                sleep(1000) --等待打开修理界面
                useLua("/run RepairAllItems()")
                sleep(11000)
                useLua("/click MerchantFrameCloseButton")
                moveA(-1668.36,3085.98,30.6245)
                useItem("霜狼嗥叫者的号角")
                useItem("紫色陆行鸟")
                sleep(3500)
                moveA(-1624.11,3102.93,37.9205)
                moveB(-1609.94,3118.17,44.7236)
                mail()
                moveA(-1616.9,3113.95,42.8356)
                moveA(-1640.17,3089.57,31.9638)
                moveA(-1728.46,3092.6,34.8786)
                moveA(-1769.99,3070.85,20.6514)
                moveA(-1801.31,3037.54,7.60516)
                moveA(-1825.67,3010.58,12.8264)
                moveA(-1795.92,2944.74,38.9812)
                moveA(-1765.55,2879.67,59.0841)
                moveA(-1701.92,2873.39,79.3667)
                moveA(-1636.1,2877.08,95.519)
                moveA(-1598.36,2882.43,105.554)
                moveA(-1574.12,2898.42,111.414)
                moveA(-1559.1,2894.61,113.274)
                moveA(-1530.54,2884.51,115.712)
                moveA(-1515.29,2860.24,110.477)
                moveA(-1500.9,2838.57,109.018)
                moveA(-1498.35,2809.36,112.491)
                moveA(-1519.53,2777.86,111.941)
                moveA(-1528.62,2753.11,111.941)
                moveA(-1516.14,2732.57,111.954)
                moveA(-1483.91,2710.63,111.942)
                moveA(-1463.64,2720.43,112.744)
                moveA(-1438.59,2740.69,112.907)
                moveA(-1427.72,2757.01,113.114)
                moveA(-1424.52,2784.75,112.162)
                moveA(-1401.91,2819.58,112.914)
                moveA(-1415.44,2843.4,119.443)
                moveA(-1416.69,2863.6,127.153)
                moveA(-1423.07,2911.94,137.043)
                moveA(-1422.35,2924.9,136.31)--开门
                openGate()
                moveA(-1424.27,2944.92,134.548)
                castSpellB("寒冰护体(等级 6)")
                moveA(-1432.14,2948.61,134.625)
                moveA(-1440.11,2953.03,124.195)
                moveA(-1454.04,2960.03,123.408)
                moveA(-1471.38,2958.23,121.63)
                moveA(-1474.12,2970.78,122.613)
                moveA(-1471.22,2979.11,116.647)
                moveA(-1444.57,2995,115.205)
                moveA(-1432.17,2999.81,115.382)
                moveA(-1430.46,2982.86,115.737)
                moveA(-1431.61,2973.07,99.9977)
                moveA(-1426.44,2939.17,94.3915)
                castSpellB("寒冰护体(等级 6)")
                moveA(-1384.9,2918.55,92.6443)
                moveA(-1377.68,2885.07,89.279)
                moveA(-1368.45,2857.39,89.1626)
                moveA(-1344.26,2847.42,87.6364)
                moveA(-1318.76,2891.4,88.7209)
                moveA(-1305.63,2897.74,88.7486)
                moveA(-1293.39,2929.78,88.2552)
                castSpellB("寒冰护体(等级 6)")
                moveA(-1279.51,2920.76,87.9473)
                moveA(-1273.6,2903.67,87.7759)
                moveA(-1209.8,2904.93,86.4382)
                useLua("/party follow2") --让小号出本
                moveA(-1185.54,2881.45,85.9243)
                useLua("/run ResetInstances()") --重置
            end
        end      
    else -- 如果身上带着灵魂状态的Debuff(人物死亡)
        -- 副本外跑尸流程
        -- 1.跑尸进本
        -- 2.出本
        -- 这样，脚本会自动循环到上面的刷怪流程，构成一个循环
        moveA(-1448.83,1969.32,85.3652)
        moveA(-1461.65,1964.45,85.4928)
        moveA(-1461.74,2004.58,78.4378)
        moveA(-1456.19,2044.81,62.9153)
        moveA(-1430.25,2071.56,61.8717)
        moveA(-1400.61,2099.59,62.2277)
        moveA(-1386.8,2133.61,63.5551)
        moveA(-1369.37,2184.81,74.7841)
        moveA(-1366.51,2193.16,78.6483)
        moveA(-1372.83,2206.46,90.5535)
        moveA(-1378.93,2224.39,91.9583)
        moveA(-1378.98,2254.42,92.2183)
        moveA(-1380.71,2297.76,92.9063)
        moveA(-1382.08,2319.59,92.3365)
        moveA(-1382.03,2342.32,92.3293)
        moveA(-1383.39,2436.21,88.8606)
        moveA(-1383.87,2460.71,88.7515)
        moveA(-1383.15,2484.72,88.8319)
        moveA(-1380.11,2507.87,92.5092)
        moveA(-1372.47,2535.79,102.419)
        moveA(-1368.51,2548.84,106.787)
        moveA(-1383.55,2570.12,111.462)
        moveA(-1384.65,2588.21,111.556)
        moveA(-1383.55,2638.62,111.556)
        moveA(-1356.46,2660.94,111.671)
        moveA(-1346,2668.36,111.622)
        moveA(-1305.79,2675.79,111.578)
        moveA(-1277.31,2680.53,111.829)
        moveA(-1248.17,2686.1,111.556)
        moveA(-1227.3,2701.33,111.306)
        moveA(-1215.88,2720.24,111.557)
        moveA(-1211.31,2740.11,113.632)
        moveA(-1207.84,2754.33,112.23)
        moveA(-1210.83,2763.48,112.79)
        moveA(-1217.61,2780.88,111.557)
        moveA(-1216.8,2805.53,114.024)
        moveA(-1256.52,2839.25,114.789)
        moveA(-1302.74,2848.72,112.926)
        moveA(-1366.85,2856.59,116.773)
        moveA(-1389.23,2871.09,126.809)
        moveA(-1419.01,2893.07,133.496)
        moveA(-1422.63,2911.45,137.154)
        moveA(-1424.98,2938.99,135.023)
        moveA(-1425.54,2946.21,134.537)
        moveA(-1431.77,2948.26,134.633)
        moveA(-1445.6,2954.82,124.173)
        moveA(-1453.98,2958.87,123.452)
        moveA(-1471.62,2958.02,121.615)
        moveA(-1473.46,2971.85,122.632)
        moveA(-1459.66,2986.5,114.7)
        moveA(-1437.76,2999.9,115.29)
        moveA(-1431.11,2983.35,115.727)
        moveA(-1428.88,2973.92,100.158)
        moveA(-1427.36,2940.88,94.3915)
        moveA(-1398,2926.51,94.4299)
        moveA(-1383.67,2920.28,92.658)
        moveA(-1374.42,2867.49,90.2239)
        moveA(-1349.34,2848.07,87.3526)
        moveA(-1322.74,2882.6,88.6376)
        moveA(-1304.55,2904.08,88.4738)
        moveA(-1294.6,2929.16,88.2477)
        moveA(-1280.73,2924.28,87.8265)
        moveA(-1271.1,2902.91,87.7575)
        moveA(-1237.14,2904.95,87.0087)
        moveA(-1198.37,2896.79,85.9949)
        moveA(-1186.97,2880.6,85.8574)
        moveB(-1183.42,2869.79,85.6598)
        waitForLoading()
        moveB(754.893,-628.817,-32.774)--出本
        waitForLoading()
    end
end


main()
