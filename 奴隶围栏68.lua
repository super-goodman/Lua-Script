shieldState = 0
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
    je1Bag, je1Slot = getBelongBagAndSlotByID(8008)
    if je1Slot == 0 then
        standBy()
        castSpellA("制造魔法红宝石")
        sleep(3500)
    end
    je1Bag, je1Slot = getBelongBagAndSlotByID(8007)
    if je1Slot == 0 then
        standBy()
        castSpellA("制造魔法黄水晶")
        sleep(3500)
    end
    je1Bag, je1Slot = getBelongBagAndSlotByID(5513)
    if je1Slot == 0 then
        standBy()
        castSpellA("制造魔法翡翠")
        sleep(3500)
    end
    if getRoleCurrentHP() < 95 and getRoleCurrentMP() < 95 and getRoleCurrentHP() >= 0 and getRoleCurrentMP() >= 0 then
        useItem("魔法肉桂面包")
        useItem("魔法山泉水")
    end
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04 do
        if IsBuffExist(29073) == 0 or IsBuffExist(34291) == 0 then
            useItem("魔法肉桂面包")
            useItem("魔法山泉水")
        end
        if getRoleCurrentHP() >= 95 and getRoleCurrentMP() >= 95 then
            break
        end
        sleep(1000)
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
                sleep(10)
            end
            sendMail()--发送邮件
            useLua("/click MailFrameCloseButton")
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
    putMailMoney(100)--放入1G
    setMailTargetName()--填写名字，名字在脚本界面填写
    sendMail()--发送邮件
    useLua("/click MailFrameCloseButton")
    sleep(500) -- 略微延迟，防止发邮件卡住
end

function silence(name,x,y) --反制
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,x,y,3,8)
    --prints(name)
    chooseTarget(ID1,ID2)
    castSpellA("法术反制")
end

function watchLobster() --观察龙虾人走位
    local ID1,ID2,ID3,ID4,n,distance = 0,0,0,0,0,0
    local x,y,z,x1,y1,z1 = 0,0,0,0,0,0

    while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
     
        ID1,ID2 = getClosetTargetIDFilterName("大型泥沼龙虾人",3,8)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        sleep(300)
        n = n + 1
        if n >= 500 then
            prints("长时间无法检测到龙虾人")
            moveB(120.223,-138.426,-0.821922)
            prints("a:长时间无法检测到龙虾人，出本")
            waitForLoadingPosition(120.223,-138.426,-0.821922)
            useLua("/run ResetInstances()") --重置
            sleep(1000)
            moveB(743.192,7014.06,-72.7946)
            prints("a:长时间无法检测到龙虾人，再进本")
            waitForLoadingPosition(743.192,7014.06,-72.7946)
            n = 0
        end
        ID3,ID4 = getClosetTargetIDFilterName("大型泥沼龙虾人",3,8)
        
        x1,y1,z1 = getTargetPositionByID(ID3,ID4,3)
        distance = getDistanceBetween(x1,y1,57.4392,-101.923)
   
        if x1 < x  then
           --printf(distance)
            if distance <= 11 and distance >= 0 then
                return 0
            else
            end
        end
    end
end

function stormLobster1() --暴风雪龙虾人1
    local ID1,ID2,distance1,distance2 = 0,0,0,0
    local x,y,z = 0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
        sleep(100)
        ID1,ID2 = getClosetTargetIDFilterName("大型泥沼龙虾人",3,8)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        distance1 = getDistanceBetween(x,y,68.309, -99.5403)
        distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance1 <= 70 and distance1 >= 0 then
            if distance2 <= 32 and distance2 >= 0 then
                chooseTarget(ID1,ID2)
                castSpellA("法术反制")
                ID1,ID2 = getClosetTargetIDFilterName("大型泥沼龙虾人",3,8)
                x,y,z = getTargetPositionByID(ID1,ID2,3)
                castSpellA("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)
                sleep(1500)
                return 0
            end
        else
            return 0 -- 或许可以删掉
        end
    end
end

function stormLobster2() --暴风雪龙虾人2
    local ID1,ID2 = getClosetTargetIDFilterName("大型泥沼龙虾人",3,8)
    local x,y,z = getTargetPositionByID(ID1,ID2,3)
    local distance = getDistanceBetween(x,y,9.88542, -24.4741)
    if distance <= 50 and distance >= 0 then
        local distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance2 <= 35 and distance2 >= 12 then
            castSpellA("暴风雪(等级 1)")
            sleep(5)
            castSpellPosition(x,y,z)
            sleep(1200)
            chooseTarget(ID1,ID2)
            castSpellA("冰枪术(等级 1)")
        elseif distance2 <= 4 and distance2 >= 0 then
            castSpellB("冰霜新星(等级 1)")
        end
    else
        return 0
    end
end

function attackTechnicianNotUnderBridge()--拉非桥下巡逻盘牙技师
    local ID1,ID2 = getClosetTargetIDFilterName("盘牙技师",3,8)
    local x,y,z = getTargetPositionByID(ID1,ID2,3)
    local distance1 = getDistanceBetween(x,y,77.796, -356.878)
    local distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance1 > 8 and distance2 <= 35 and distance2 >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("法术反制")
    else
        return 0
    end
end

function attackTechnician()--拉巡逻盘牙技师
    local ID1,ID2 = getClosetTargetIDFilterName("盘牙技师",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance <= 35 and distance >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("法术反制")
    else
        return 0
    end
end

function iceBlock() -- 寒冰屏障
    moveB(71.1643,-338.1,6.0474)
    sleep(50)
    useLua("/cancelAura 冰甲术(等级 4)")
    local ID1,ID2,distance,hp = 0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        sleep(100)
        ID1,ID2 = getClosetTargetIDInBattleFilterName("盘牙卫士",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        hp = getRoleCurrentHP()
        if distance <= 15 and distance >= 0 then
            castSpellA("寒冰屏障")
            return 0
        end
        if hp <= 45 and hp >= 0 then
            castSpellA("寒冰屏障")
            return 0
        end
    end
end

function patrolBraveStop() --巡逻勇士冰环判断
    local ID1,ID2 = getClosetTargetIDFilterName("盘牙勇士",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance <= 13 and distance >= 0 then
        castSpellB("冰霜新星(等级 1)")
    end
end

function patrolBraveSlience() --巡逻勇士反制判断
    local ID1,ID2 = getClosetTargetIDFilterName("盘牙勇士",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    level = getRoleLevel()
    if distance <= 35 and level == 70 and distance >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("法术反制")
    end
end

function summonStopMinion1(x,y,z)--水元素冻住怪
    castSpellA("召唤水元素")
    sleep(5)
    castSpellB("急速冷却")
    sleep(5)
    castSpellA("冰霜新星(等级 1)")
    sleep(5)
    castSpellB("冰冻术")
    sleep(5)
    castSpellPosition(x,y,z)
    sleep(5)
    useLua("/run PetDismiss()")  
end

function summonStopMinion2()--水元素冻住怪
    castSpellA("召唤水元素")
    sleep(600)
    castSpellB("冰冻术")
    sleep(20)
    --castSpellPosition(42.5877,-315.003,3.03932)
    castSpellPosition(35.2655,-312.797,3.03607)
    sleep(5)
    castSpellA("闪现术")
end

function firstLevelStormGathered(x,y,z) --一级暴风雪聚怪判断
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local spellID,hp = 0,0
    --printf(distance)
    if distance <= 8 and distance >=0 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
       if IsBuffExist(12536) == 1 then
            castSpellA("暴风雪(等级 7)")
            sleep(5)
            castSpellPosition(x,y,z)
       else
            castSpellA("暴风雪(等级 1)")
            sleep(5)
            castSpellPosition(x,y,z)
       end
       for i = 1, 20,1 do
           sleep(205)
           spellID = getRoleCurrentSpellID()
           if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 15 and spellID ~= 0x0a then
               if IsBuffExist(12536) == 1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("暴风雪(等级 1)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               end
           end
           
           ID1,ID2 = getClosetTargetIDInBattle(3)
           distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
           hp = getRoleCurrentHP()
           if distance <= 8 and hp <= 60 and distance >= 0 and hp >= 0 then
               return
           end
       end
    end
end

function firstLevelStormGathered1(x,y,z) --一级暴风雪聚怪判断1
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local spellID,hp = 0,0
    --printf(distance)
    if distance <= 8 and distance >=0 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
       if IsBuffExist(12536) == 1 then
            castSpellA("暴风雪(等级 7)")
            sleep(5)
            castSpellPosition(x,y,z)
       else
            castSpellA("暴风雪(等级 1)")
            sleep(5)
            castSpellPosition(x,y,z)
       end
       for i = 1, 20,1 do
           sleep(245)
           spellID = getRoleCurrentSpellID()
           if spellID ~= 0xCB and spellID ~= 0xCD  and i >= 5 and i<= 15 and spellID ~= 0x0a then
               if IsBuffExist(12536) == 1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("暴风雪(等级 1)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               end
           end
     
           ID1,ID2 = getClosetTargetIDInBattle(3)
           distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
           hp = getRoleCurrentHP()
           if distance <= 8 and hp <= 60 and distance >= 0 and hp >= 0 then
               return
           end
       end
    end
end

function checkDistanceBetweenMinion1() --检测怪群是否到足够的距离
    local ID1,ID2 = getHighestHPTargetIDInBattle(3)
    local targetHP = getTargetHPByID(ID1,ID2,3)
    local hp = getRoleCurrentHP()
    local distance,distance1,distance2 = 0,0,0
    local x,y,z,n = 0,0,0,0
    local name,chat = getChatInfoByType(7)
    if name ~= "" and name ~= 0 and name ~= -1 then
        useLua("/reply [大脚自动回复]我不是会长,我先邀请你进入公会,先进会,会长叫女权或者全能冠军，会m你，或者你m她")
        useLua("/tell 女权 ".. name.. "  申请加入公会")
        useLua("/tell 全能冠军 ".. name.. "  申请加入公会")
        useLua("/guildinvite "..name)
    end
    if hp < 70 and hp > 0 then
        useItem("灵纹布绷带")
        sleep(2000)
    end
    local coolDown = getSpellCoolDown(12051)
    local mp = getRoleCurrentMP()
    if coolDown == 0 and mp < 43 and mp > 0 and targetHP >= 35 then
        useItem("法力刚玉")
        useItem("法力红宝石")
        useItem("法力黄水晶")
        useItem("法力翡翠")
    end
    if mp < 35 and mp > 0 and targetHP >= 35 then
        --prints("唤醒1")
        castSpellA("唤醒")
    end
    if targetHP < 35 and mp < 57 and targetHP >= 0 and mp > 0 then
        --prints("唤醒2")
        useItem("法力刚玉")
        useItem("法力红宝石")
        useItem("法力黄水晶")
        useItem("法力翡翠")
        sleep(100)
        castSpellA("唤醒")
    end
    ID1,ID2 = getClosetTargetIDInBattleFilterName("背叛者门努",3,8)
    if ID1 ~= 0 and ID1 ~= -1 then
        local flag2 = getTargetFlag2ByID(ID1,ID2,3)
        if flag2 == 0x08 then
            moveA(82.684,-348.453,3.03567)
        end
    end

    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        flag1 = getRoleflag1()
        if  flag1 == 0x00 and flag1 ~= 0x08 then 
            break
        end
        ID1,ID2 = getClosetTargetIDInBattleFilterName("盘牙技师",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance <= 30 and distance > 0 then
            chooseTarget(ID1,ID2)
            castSpellA("法术反制")
        end
        hp = getRoleCurrentHP()
        if hp <= 14 then
            useItem("特效治疗药水")
            castSpellA("寒冰护体(等级 5)")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        distance =  getTargetAndPositionDistanceByID(ID1,ID2,49.5638, -414.071,3)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        if distance >= 0 then --距离判断
            distance1 = getDistanceBetween(x,y,-15.7392, -392.649)
            ID1,ID2 = getHighestHPTargetIDInBattle(3)
            targetHP = getTargetHPByID(ID1,ID2,3)
            if targetHP >= 30 then
                if distance1 <= 18 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 30 and targetHP >= 20  then
                if distance1 <= 32 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 20 and targetHP >= 10 then
                if distance1 <= 42 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 10 and targetHP >= 0 then
                if distance1 <= 47 then --检测怪物是否到目的地
                    return 0
                end
            end
        end
        if n >= 60 then
            ID1,ID2 = getClosetTargetIDInBattle(3) --判断是否在台子上行走
            x,y,z = getTargetPositionByID(ID1,ID2,3)
            distance = getDistanceBetween(x,y,43.6467, -344.865)
            distance1 = getDistanceBetween(x,y,55.39, -346.972)
            distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
            if distance2 < 30  and distance2 >= 0 then
                if distance <= 10 and distance >= 0 and distance1 <= 3 and distance1>= 0 then
                    return 0
                end
            end
        end
        sleep(100)
        n = n + 1
    end
end

function checkDistanceBetweenMinion2() --检测怪群是否到足够的距离2
    local ID1,ID2 = getHighestHPTargetIDInBattle(3)
    local targetHP = getTargetHPByID(ID1,ID2,3)
    local hp = getRoleCurrentHP()
    local distance,distance1,distance2 = 0,0,0
    local x,y,z = 0,0,0
    if hp < 70 and hp > 0 then
        useItem("灵纹布绷带")
        sleep(2000)
    end
    local coolDown = getSpellCoolDown(12051)
    local mp = getRoleCurrentMP()
    if coolDown == 0 and mp < 43 and mp > 0 and targetHP >= 35 then
        useItem("法力刚玉")
        useItem("法力红宝石")
        useItem("法力黄水晶")
        useItem("法力翡翠")
    end
    if mp < 43 and mp > 0 and targetHP >= 35 then
        castSpellA("唤醒")
    end
    if targetHP < 35 and mp < 57 and targetHP >= 0 and mp > 0 then
        useItem("法力刚玉")
        useItem("法力红宝石")
        useItem("法力黄水晶")
        useItem("法力翡翠")
        sleep(100)
        castSpellA("唤醒")
    end
    ID1,ID2 = getClosetTargetIDFilterName("背叛者门努",3,8)
    if ID1 ~= 0 and ID1 ~= -1 then
        local flag2 = getTargetFlag2ByID(ID1,ID2,3)
        if flag2 == 0x08 then
            moveA(82.684,-348.453,3.03567)
        end
    end

    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        ID1,ID2 = getClosetTargetIDInBattleFilterName("盘牙技师",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance <= 30 and distance > 0 then
            chooseTarget(ID1,ID2)
            castSpellA("法术反制")
        end
        hp = getRoleCurrentHP()
        if hp <= 14 then
            useItem("特效治疗药水")
            castSpellA("寒冰护体(等级 5)")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        distance =  getTargetAndRoleDistanceByID(ID1,ID2,3)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        if distance >= 0 then --距离判断
            distance1 = getDistanceBetween(x,y,-15.7392, -392.649)
            ID1,ID2 = getHighestHPTargetIDInBattle(3)
            targetHP = getTargetHPByID(ID1,ID2,3)
            if targetHP >= 30 then
                if distance1 <= 4 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 30 and targetHP >= 20  then
                if distance1 <= 32 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 20 and targetHP >= 10 then
                if distance1 <= 42 then --检测怪物是否到目的地
                    return 0
                end
            elseif targetHP <= 10 and targetHP >= 0 then
                if distance1 <= 57 then --检测怪物是否到目的地
                    return 0
                end
            end
        end
        ID1,ID2 = getClosetTargetIDInBattle(3) --判断是否在台子上行走
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        distance = getDistanceBetween(x,y,43.6467, -344.865)
        distance1 = getDistanceBetween(x,y,55.39, -346.972)
        distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance2 < 30  and distance2 >= 0 then
            if distance <= 10 and distance >= 0 and distance1 <= 3 and distance1>= 0 then
                return 0
            end
        end
        sleep(100)
    end
end

function shield() --是否上寒冰护体
    local ID1,ID2 = getClosetTargetIDInBattleFilterName("盘牙魔法师",3,8)
    if shieldState == 1 then
        castSpellA("寒冰护体(等级 5)")
        --[[
        if IsBuffExist(33944) == 0 then
            castSpellA("魔法抑制(等级 6)")
        end
        --]]
        return 0 
    end
    if ID1 ~= 0 and ID1 ~= -1 then
        shieldState = 1
        castSpellA("寒冰护体(等级 5)")
    end
end

function silenceTechnician()--打断技师读条
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local name = getTargetNameByID(ID1,ID2,3)
    if name == "盘牙技师" then
        chooseTarget(ID1,ID2)
        castSpellA("法术反制")
    end
end

function skipStorm(x,y,z) --是否跳过房间内左边一波
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance < 15 and distance >= 0 then
        return
    else
        castSpellA("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(x,y,z)
    end
end

function isMinionInPosition(x,y,z) --检测怪群是否到一级暴风雪位置
    local ID1,ID2,distance,coolDown = 0,0,0,0
    local mp,level,spellID,distance1 = 0,0,0,0
    ID1,ID2 = getClosetTargetIDInBattleFilterName("盘牙魔法师",3,8)
    if ID1 ~= 0 and ID1 ~= -1 then
        shieldState = 1
    end
    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        sleep(5)

        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 then
            --prints("脱战了")
            return 0
        end
        distance = getTargetAndPositionDistanceByID(ID1,ID2,49.5638, -414.071,3)
        ID1,ID2 = getClosetTargetIDInBattle(3)
        distance1 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance1 <= 12 and distance1 >= 0 then
            return 0
        end
        if distance >= 0 and distance <= 11 then
            coolDown = getSpellCoolDown(12051)
            mp = getRoleCurrentMP()
            level = getRoleLevel()
            if mp >= 69 or coolDown == 1 then
                if level >= 68 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)           
                end
            else
                castSpellA("暴风雪(等级 1)")
                sleep(5)
                castSpellPosition(x,y,z)    
            end
            for i = 1, 20,1 do
               
                spellID = getRoleCurrentSpellID()
                if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 15 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                    if IsBuffExist(12536) == 1 then
                        castSpellA("暴风雪(等级 7)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                   else
                        castSpellA("暴风雪(等级 1)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                   end
                end
                sleep(350)
                ID1,ID2 = getClosetTargetIDInBattle(3)
                distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                --printf(distance)
                if distance <= 12  and distance >= 0 then
                    return 0
                end
            end
            return 0
        end
        
    end
end

function secondTimeMaxLevelStorm(x,y,z) --第二次下满级暴风雪
    local spellID,targetHP = 0,0
    --moveB(92.9172,-391.322,3.03429)
    --sleep(100)
    --standBy()
    sleep(100)
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local mp = getRoleCurrentMP()
    if distance <= 8 and distance >= 0 then
        return
    elseif mp <= 10 and mp >= 0 then
        return
    else
        castSpellB("冰冷血脉")
        castSpellA("暴风雪(等级 7)")
        sleep(5)
        castSpellPosition(x,y,z)
        for i = 1, 20,1 do
            sleep(410)
            spellID = getRoleCurrentSpellID()
            if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 13 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                if IsBuffExist(12536) == 1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("暴风雪(等级 1)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               end
            end
            
            ID1,ID2 = getClosetTargetIDInBattle(3)
            distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
            if distance <= 11  and distance >= 0 then
                return
            end
        end
        
        ID1,ID2 = getHighestHPTargetIDInBattle(3) --第二次下雪
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 32 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i<= 13 and i >= 5 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("暴风雪(等级 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("暴风雪(等级 1)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           end
                        end
                        
                        ID1,ID2 = getClosetTargetIDInBattle(3)
                        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                        if distance <= 11  and distance >= 0 then
                            return
                        end
                    end
                end
            end
        end

        ID1,ID2 = getHighestHPTargetIDInBattle(3) --第三次下雪
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 28 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("召唤水元素")
                    sleep(600)
                    castSpellB("冰冻术")
                    sleep(50)
                    castSpellPosition(80.5394,-410.023,3.03428)
                    sleep(5)
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 13 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("暴风雪(等级 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("暴风雪(等级 1)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           end
                        end
                        
                        ID1,ID2 = getClosetTargetIDInBattle(3)
                        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                        if distance <= 11  and distance >= 0 then
                            return
                        end
                    end
                    useLua("/run PetDismiss()")
                end
            end
        end

        ID1,ID2 = getHighestHPTargetIDInBattle(3) --第二次下雪
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 22 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("暴风雪(等级 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i<= 13 and i >= 5 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("暴风雪(等级 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("暴风雪(等级 1)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           end
                        end
                        
                        ID1,ID2 = getClosetTargetIDInBattle(3)
                        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
                        if distance <= 11  and distance >= 0 then
                            return
                        end
                    end
                end
            end
        end
    end
end

function removeDebuff() --解除减速
    if IsBuffExist(33787) == 1 or IsBuffExist(32173) == 1 or IsBuffExist(15655) == 1 then
        castSpellA("寒冰屏障")
        castSpellA("寒冰屏障")
        return 0
    end
end

function ore()--采矿
    local ID1,ID2 = getClosetTargetIDToAPosition(-0.633171, -187.404,6)
    local distance = getTargetAndPositionDistanceByID(ID1,ID2,-0.633171, -187.404,6)
    local bag,slot = getBelongBagAndSlotByID(2901)
    if ID1 ~= 0 and  ID1 ~= -1 and distance < 3 and distance >= 0 then
        if slot ~= 0 and slot ~= -1 then
            moveA(-0.633171,-187.404,3.92642)
            for i = 1, 10 do
                ID1,ID2 = getClosetTargetIDToAPosition(-0.633171, -187.404,6)
                distance = getTargetAndRoleDistanceByID(ID1,ID2,6)
                if distance >= 5 or ID1 == -1 or ID1 == 0 then
                    return 0
                end
                if ID1 ~= -1 and ID1 ~= 0 and distance <3 and distance >= 0 then
                    contactTarget(ID1,ID2)
                    sleep(4000)
                end
               
            end
        end
    else
        return 0
    end
end

function ore2()
    local distance,distance1,ID1,ID2,ID3,ID4 = 0,0,0,0,0,0
    local bag,slot = getBelongBagAndSlotByID(2901)
    if slot ~= 0 and slot ~= -1 then
        ID1,ID2 = getClosetTargetIDToAPosition(-71.3,-282.7,6)
        distance = getTargetAndPositionDistanceByID(ID1,ID2,-71.3,-282.7,6)
        if ID1 == 0x00 or ID1 == -1 or distance > 3 then
            return 0
        end
        --moveA(-4.86042,-298.799,3.09008)
        moveA(-21.7479,-320.88,-1.56099)
        moveA(-35.2042,-329.91,-1.58472)
        moveA(-66.6533,-325.588,-1.55384)
        moveA(-71.4008,-324.82,-1.54375)
        moveA(-69.4244,-314.8,-1.48558)
        moveA(-68.8859,-312.301,-1.46888)
        jumpA(-67.7743,-308.589,0.261339)
        moveA(-66.87,-302.939,3.10082)
        moveA(-65.8234,-296.592,6.32306)
        moveA(-65.6004,-294.233,6.74325)
        moveA(-67.029,-284.551,0.415388)
        moveA(-67.6531,-280.928,-1.44535)

        while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04 do
            ID1,ID2 = getClosetTargetIDToAPosition(-71.3,-282.7,6)
            distance = getTargetAndPositionDistanceByID(ID1,ID2,-71.3,-282.7,6)
            if ID1 == 0x00 or ID1 == -1 or distance > 3 then
                break
            end
            if ID1 ~= 0 and ID1 ~= -1 and distance <= 3 then
                ID3,ID4 = getClosetTargetIDToAPositionFilterName("盘牙监工",-88.31,-287.80,3,8)
                distance = getTargetAndRoleDistanceByID(ID3,ID4,3)
                sleep(500)
                distance1 = getTargetAndRoleDistanceByID(ID3,ID4,3)
                if distance1 > distance then
                    if distance1 >= 20 then
                        contactTarget(ID1,ID2)
                        sleep(4000)
                    end
                end
            end
            sleep(100)
        end
        jumpA(-66.8095,-285.953,1.34168)
        moveA(-66.2879,-289.209,3.50759)
        moveA(-65.4655,-294.184,6.83918)
        moveA(-65.977,-300.946,4.69806)
        moveA(-67.1226,-308.533,0.956081)
        moveA(-69.8644,-322.87,-1.53156)
        moveA(-47.8093,-326.903,-1.58046)
        moveA(-34.8098,-328.486,-1.57912)
        moveA(-15.5618,-312.066,2.49895)
        moveA(-11.1842,-297.08,2.60984)
    end  
end

function treasure1() --开宝箱
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("坚固的魔铁宝箱",133.155, -305.886,6,8)
    local distance = getTargetAndPositionDistanceByID(ID1,ID2,133.155, -305.886,6)
    if ID1 ~= 0 and ID1 ~= -1 and distance < 10 then
        moveA(133.155,-305.886,3.03572)
        sleep(500)
        contactTarget(ID1,ID2)
        sleep(7000)
    else
        return 0
    end
end

function treasure2() --开宝箱2
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("坚固的魔铁宝箱",134.05, -446.654,6,8)
    local distance = getTargetAndPositionDistanceByID(ID1,ID2,134.05, -446.654,6)
    if ID1 ~= 0 and ID1 ~= -1 and distance < 10 then
        moveA(134.05,-446.654,3.92642)
        sleep(500)
        contactTarget(ID1,ID2)
        sleep(7000)
    else
        return 0
    end
end

function move(x,y,z) --改写过的移动
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
        moveB(x,y,z)
        if getRoleCurrentHP() <= 15 and getRoleCurrentHP() >= 1 then
            useItem("特效治疗药水")
        end
        if getRoleCurrentMP() <= 14 and getRoleCurrentHP() >= 1 then
            useItem("特效法力药水")
        end
        sleep(40)
        n = n + 1
        if n >= 750 then
            moveB(x+1,y+1,z)
            sleep(100)
            jumpB()
            sleep(650)
            jumpB()
            n = 0
        end
        x1,y1,z1 = getRolePosition()
    end
end

function skip() --跳过下台子坐标
    local ID1,ID2 = getClosetTargetIDFilterName("盘牙卫士",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    castSpellB("寒冰护体(等级 4)")
    castSpellB("法力护盾(等级 7)")
    if distance >= 0 then
        if distance > 4 then
            return 0
        end
        if distance <= 4 then
            move(83.4119,-341.425,3.03572)
            move(75.408,-338.806,3.03572)
            move(73.3535,-337.869,3.03572)
            jump(72.3069,-337.145,6.05351)
        end
    end
end

function jump(x,y,z)
    local x1,y1,z1 = getRolePosition()
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04 do
        moveB(x,y,z)
        jumpB()
        if getRoleCurrentHP() < 15 then
            useItem("特效治疗药水")
        end
        for i = 1, 15, 1 do
            moveB(x,y,z)
            sleep(40)
        end
     
        x1,y1,z1 = getRolePosition()
    end
end

function pickUp() --拾取
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04 do -- 循环n次（mld可能有很多怪）
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

--主程序开始
--从本外开始

useLua("/removefriend 炒鸡感激")
--useLua("/ignore 炒鸡感激")
sleep(2000)
useLua("/friend 炒鸡感激")
if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
    -- 副本内刷怪流程
    -- 1.从副本门口跑进副本(加延迟等待读条)
    -- 2.吃喝-上buff-吃喝
    -- 3.开始正常流程-刷完整个本
    roleX,roleY,roleZ = getRolePosition() --如果在墓地
    mapDistance1 = getDistanceBetween(roleX,roleY,338.382,7624.41)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --如果在炉石 then
        prints("a:活着从墓地开始")
        useItem("紫色陆行鸟")
        useItem("霜狼嗥叫者的号角")    
        sleep(3500)
        moveA(338.382,7624.41,22.713)
        moveA(346.334,7640.03,22.9739)
        moveA(316.23,7708.44,18.1392)
        moveA(279.15,7749.8,21.2241)
        moveA(257.286,7773.47,17.9196)
        moveA(251.546,7788.84,17.4883)
        moveA(250.98,7795.08,17.491)
        moveA(242.871,7803.87,17.4988)
        moveA(224.806,7828.86,22.8992)
        moveA(256.636,7859.21,23.4724)
        moveA(231.894,7926.83,25.0783)
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,234.317,7920.04)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --如果在炉石 then
        moveA(234.317,7920.04,25.0776)
        moveA(240.032,7906,25.7801)
        moveA(240.032,7906,25.7801)
        useItem("霜狼嗥叫者的号角")
        useItem("紫色陆行鸟")
        sleep(3500)
        moveA(257.147,7864.96,23.12)
        moveA(277.048,7861.91,24.5074)
        moveA(287.956,7851.34,22.3817)
        moveA(321.68,7850.33,22.7926)
        moveA(323.501,7843.37,22.3667)
        ID1,ID2 = getClosetTargetIDFilterName("被俘虏的侏儒",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --等待打开修理界面
        useLua("/run RepairAllItems()")
        sleep(11000)
        useLua("/click MerchantFrameCloseButton")
  
       
        moveA(323.593,7841.64,22.2002)
        moveA(320.136,7850.66,22.8244)
        moveA(279.189,7853.6,23.9565)
        moveA(259.729,7868.01,23.3538)
        mail()
        moveA(254.64,7864.97,23.0008)
        moveA(257.602,7818.61,23.3814)
        moveA(248.261,7760.65,23.0866)
        moveA(268.799,7628.81,21.9605)
        moveA(450.072,7375.96,16.3277)
        
        moveA(471.387,7302.45,14.0366)
        castSpellB("闪现术")
        moveA(488.224,7244.35,16.7861)
        castSpellB("闪现术")
        moveA(522.165,7055.7,16.8074)
        castSpellB("闪现术")
        moveA(544.161,6961.94,16.7637)
        castSpellB("闪现术")
        moveA(550.472,6957.96,9.62258)
        castSpellB("闪现术")
        moveA(570.18,6939.38,-21.9679)
        castSpellB("闪现术")
        moveA(581.349,6938.73,-39.9977)
        castSpellB("闪现术")
        moveA(608.24,6908.64,-47.6687)
        castSpellB("闪现术")
        moveA(608.09,6908.6,-47.6738)
        moveA(614.375,6890.87,-56.2252)
        moveA(627.688,6878.41,-71.2822)
        moveA(641.199,6868.34,-80.1888)
        moveA(665.759,6866.15,-78.4772)
        moveA(665.759,6866.15,-72.2003)
        moveA(709.469,6914.38,-67.8285)
        castSpellB("闪现术")
        moveA(720.006,6950.8,-68.0424)
        castSpellB("闪现术")
        moveA(717.492,6990.01,-73.0739)
        castSpellB("闪现术")
        moveA(733.508,7012.31,-72.6895)
    end
  
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,743.192,7014.06)--如果在炉石
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --如果在炉石 then
         prints("a:从副本门口开始")
        moveB(743.192,7014.06,-72.7946)
        waitForLoadingPosition(743.192,7014.06,-72.7946)

    end
    sleep(1000)
    drink()
    sleep(1000)

    useLua("/party follow2") --让小号出本
    castSpellA("奥术智慧(等级 5)")
    castSpellA("冰甲术(等级 4)")
    castSpellA("魔法抑制(等级 6)")
    --useLua("/5.寻求组队 炽蓝仙野 固/定/今/团/公会/P1稳定FARM!欢迎各路爆炸治疗!输出SS/LR/元素/咕咕!欢迎小团体大团体加入做大做强再创辉煌!备战P2固定团来稳定选手")

    drink()
    --开始拉怪
    move(124.939,-116.089,-0.8645)--观察怪物走位
    watchLobster()

    move(124.939,-116.089,-0.8645)
    castSpellA("寒冰护体(等级 5)")
    move(122.52,-110.033,-0.794826 )
    move(94.2386,-89.2036,-2.71253)
    move(65.7763,-73.9397,-3.93717)--第一次下雪
    sleep(100)
    stormLobster1()
    move(63.1481,-71.8084,-3.96471 )--闪现
    castSpellA("闪现术")
    move(36.4872, -53.8166, -3.20747 )
    move(21.9444,-43.8772, -3.90103 )--第二次下雪
    sleep(100)
    stormLobster2()

    move(23.2283,-32.6406,-1.02073 )
    castSpellA("冰霜新星(等级 1)")
    move(13.8081,-6.57001,-1.54462)--跳跃就为点
    jumpA(8.13143,-1.20081,-0.887246) --跳过树状
    move(-0.645283,10.2394,2.96381)
    move(-26.6161,27.4639,2.2147)
    castSpellA("寒冰护体(等级 5)")
    move(-45.59,21.923,-1.10631) --勇士冰环判断
    patrolBraveStop()
    move(-78.1637,6.80497,-4.54459)--勇士反制判断
    patrolBraveSlience()
    move(-91.819,-5.91063,-8.01405)--勇士冰环判断
    patrolBraveStop()
    move(-105.891,-15.4141,-7.78536)--勇士冰环判断
    patrolBraveStop()
    move(-108.334, -28.7902, -4.02367)--勇士冰环判断
    patrolBraveStop()
       
    move(-106.595,-34.6006,-3.58998)--第一次巡逻怪冰环
    patrolBraveStop()
    move(-105.378,-42.5621,-3.27367)--闪现
    castSpellA("闪现术")
    move(-102.409,-65.0945,-2.90705 )--下雪
    sleep(100)
    firstLevelStormGathered(-104.997,-44.8355,-3.19386)
    move(-100.835,-81.7564,-3.71117 )--盾
    castSpellA("寒冰护体(等级 5)")
    move(-98.6018,-125.2,-125.2)
    move(-84.7412,-124.506,-1.53335)--转交
    move(-80.7025,-130.196,-1.5812)
    move(-64.5776,-132.752,-1.58873)
    move(-51.9185,-144.911,-1.57472)
    move(-40.774,-161.321,-1.57441) --进本
    move(-25.7016,-189.866,-2.3059)--闪现
    castSpellA("闪现术")

    move(-14.2572,-217.355,-1.58922)--冰环
    move(-12.3031,-235.201,-1.60556)
    castSpellA("法力护盾(等级 7)")
    move(-8.54631,-274.631,-0.534612)--选中目标反制
    silence("大型泥沼龙虾人",5.4219, -257.777)
    move(-9.11416,-285.24,-1.08062)
    castSpellA("寒冰护体(等级 5)")
    move(-6.72458,-296.899,3.02885)
    useItem("法力黄水晶")
    move(-3.74734,-301.4,3.03803)--冰环
    castSpellA("冰霜新星(等级 1)")
    move(9.16583,-305.124,3.03621)--闪现
    castSpellA("闪现术")
    move(30.3688,-312.673,3.03559)--下雪1
    sleep(100)
    firstLevelStormGathered1(6.67683,-306.907,3.03559)
    move(36.6403,-313.956,3.03727)--下雪2
    sleep(100)
 
    firstLevelStormGathered(14.3523,-309.649,3.03683)
    move(42.5877,-315.003,3.03932)--下雪
    sleep(100)
    firstLevelStormGathered(23.3329,-312.295,3.03683)
    move(44.1911,-315.269,3.03945)--水元素
    summonStopMinion1(23.3329,-312.295,3.03683)
    move(50.7804,-317.205,3.03951)--水元素并闪现
    summonStopMinion2()
    move(89.9651,-323.008,3.03548)--下雪拉左边怪
    sleep(100)
    skipStorm(118.274,-304.224,3.03571)
    sleep(1400)
    move(75.408,-338.806,3.03572)
    castSpellA("寒冰护体(等级 5)")
    move(73.3535,-337.869,3.03572)--跳前找好位置
    jump(72.3069,-337.145,6.05351) --跳上去
    move(72.1468,-337.443,6.07123 )--向右边跑一点
    attackTechnicianNotUnderBridge()--拉非桥下巡逻盘牙技师
    useLua("/run PetDismiss()")
    move(71.3389,-338.800,6.07123)--冰箱
    if getRoleflag1() == 0x08 then
        iceBlock()
        sleep(11000)
        attackTechnician()--拉盘牙技师
        jumpB()
        skip() --如果被刺，跳下来再回去
        sleep(4000)
        moveB(71.3389,-338.800,6.07123)--判断怪物位置
        sleep(400)
        checkDistanceBetweenMinion1()
        move(81.3059,-353.019,3.03577)--打断技师读条
        silenceTechnician()

        move(92.6425,-371.707,3.03568)--从台子上下来跑到中间
        castSpellA("寒冰护体(等级 5)")
        move(88.8848,-392.935,3.03572)--下雪一级
        sleep(100)
        isMinionInPosition(67.0139,-413.785,3.03564)
        --sleep(7000)
        move(93.6898,-388.816,3.03572)--下雪满级
        sleep(100)
        secondTimeMaxLevelStorm(74.0525,-418.013,3.03562)
        move(92.3513,-383.009,3.03567)--闪现
        castSpellA("闪现术")
        move(76.6604,-340.2,3.03572)--跳前找好位置
        castSpellB("法师护甲(等级 3)")
        move(73.0281,-338.579,3.03572)
        jump(71.868,-338.043,6.07048)-- --跳上去
        move(71.7322,-338.334,6.07123)
        move(71.7322,-338.334,6.07123)
        moveB(72.1468,-337.443,6.07123)--等待怪物到位
        sleep(400)
        checkDistanceBetweenMinion1()
        moveA(81.3059,-353.019,3.03577)--打断技师读条
        silenceTechnician()
        moveA(89.8669,-368.355,3.03565 )
        castSpellA("闪现术")
        moveA(117.651,-418.639,3.03501)--下雪
        sleep(100)

        castSpellB("暴风雪(等级 1)")
        sleep(5)
        castSpellPosition(127.208,-448.286,3.03409)
        sleep(1200)
        moveA(109.518,-400.424,3.03563)
        castSpellA("寒冰护体(等级 5)")
        moveA(88.1915,-360.504,3.03563)--闪现
        castSpellA("闪现术")
        moveA(76.6604,-340.2,3.03572)--跳前找好位置
        moveA(73.0281,-338.579,3.03572)
        jump(71.868,-338.043,6.07048)--跳跃点
        move(71.7322,-338.334,6.07123)
        moveB(72.1468,-337.443,6.07123 ) --判断位置
        sleep(400)
        checkDistanceBetweenMinion1()
    end           
    for i = 1, 50, 1 do
        flag1 = getRoleflag1()
        if  flag1 == 0x08 then --在战斗中就循环战斗
            
            move(81.3059,-353.019,3.03577)--打断技师读条
            silenceTechnician()
            move(92.6425,-371.707,3.03568)--从台子上下来跑到中间
            shield()
            move(88.8848,-392.935,3.03572)--下雪一级
            sleep(100)
            useLua("/party follow1") --让小号进本
            isMinionInPosition(67.0139,-413.785,3.03564)
            --sleep(7000)
            flag1 = getRoleflag1()
            if flag1 == 0x00 then
                break
            end
            move(92.9172,-391.322,3.03429)--下雪满级
            sleep(100)
            secondTimeMaxLevelStorm(74.0525,-418.013,3.03562)
            flag1 = getRoleflag1()
            if flag1 == 0x00 then
                break
            end
            move(92.3513,-383.009,3.03567)--闪现
            castSpellA("闪现术")
            moveB(76.6604,-340.2,3.03572)--跳前找好位置
            --removeDebuff()
            move(76.6604,-340.2,3.03572)--跳前找好位置
            move(73.0281,-338.579,3.03572)
            jump(71.868,-338.043,6.07048)-- --跳上去
            move(71.7322,-338.334,6.07123)
            sleep(100)
            moveB(72.0574,-336.379,6.11707)--等待怪物到位
            sleep(800)
            jumpB()
            sleep(1000)
            checkDistanceBetweenMinion1()
            useLua("/party follow3") --让小号进本
        elseif flag1 == 0 or flag1 == 0x04 then --脱战了就跳出
            break
        end
    end










        -- 4. 拾取
        useLua("/party follow2") --让小号出本
        moveA(92.6425,-371.707,3.03568)
        moveA(77.8577,-417.692,3.03567)
        pickUp()
        moveA(73.118,-411.031,3.03567)
        treasure2()
        moveA(99.6179,-384.6,3.03567)
        moveA(92.966,-353.43,3.03567)
        -- 5. 出本流程(加延迟等待读条)
        -- 6. 重置副本
        -- 9. 这样构成一个循环
        move(90.1411,-346.429,3.03587)
        treasure1()
        move(69.9503,-325.795,3.03587)
        move(61.2938,-323.035,3.03675)
        castSpellA("闪现术")
        useLua("/party follow2") --让小号出本  
        move(-4.86042,-298.799,3.09008)
        move(-15.6062,-294.427,2.05401)
        ore2()
        move(-17.175,-264.773,-1.54152)
        move(-19.7396,-238.948,-2.09964)
        castSpellA("闪现术")
        move(-23.0183,-200.569,-1.8485)
        ore()
        useItem("法力刚玉")
        unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
        headDuration = getEquipementDurationBySlotNum(1)
        if unusedBag > 11 and headDuration >= 20 then --如果装备不红，背包没满，就出本继续
        move(-24.7437,-188.624,-2.29001)
        castSpellA("寒冰护体(等级 5)")
        move(-34.3342,-173.13,-1.99026)
        move(-48.1653,-154.69,-1.50054)
        move(-56.5378,-142.109,-1.50338)
        move(-64.6081,-132.587,-1.58817)
        move(-79.2262,-128.238,-1.58817)
        move(-84.7866,-126.296,-1.4106)--转交
        move(-84.693,-122.035,-1.6431)
        move(-100.381,-114.026,-3.1505)--火焰节火炬点
        --move(-92.919,-104.732,-4.66746)
        move(-99.8795,-75.2492,-3.17315)
        castSpellA("闪现术")
        move(-112.841,-27.5825,-5.12581)
        move(-101.386,-1.84192,-8.18317)
        move(-81.3684,5.08273,-5.30549)
        castSpellA("寒冰护体(等级 5)")
        move(-67.7587,16.005,-1.64567)
        move(-51.5569,19.9881,-1.59056)
        move(-35.0662,26.2707,0.81196)
        move(-24.2441,25.6233,2.4764)
        move(-15.1319,18.4538,3.47812)
        move(-2.79508,7.07245,0.243307)
        move(2.12491,-8.60073,-1.33743)
        move(1.78749,-19.1488,-1.66041)
        move(10.5015,-26.6059,-1.45648)
        castSpellA("闪现术")
        move(35.2148,-39.596,-1.04909)
        castSpellA("冰霜新星(等级 1)")
        move(45.9989,-47.0182,-1.37307)
        move(67.9588,-63.0631,-2.12291)
        move(80.6393,-74.993,-3.21888)
        move(92.69,-85.6395,-3.00291)
        move(106.908,-97.9534,-1.59057)
        move(117.858,-107.4,-1.59057)
        move(125.212,-122.238,-0.992671)
        moveB(120.223,-138.426,-0.821922)
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        useLua("/run ResetInstances()") --重置
        sleep(1000)
    
    elseif unusedBag <= 11 or headDuration < 20 then --如果装备红了或者背包满了回城修理
        if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
        
        -- 5. 炉石(加延迟等待读条与蓝条加载20s左右)
        sleep(3000)
        useItem("炉石")
        waitForLoading()--等待读条 和 加载蓝条结束
        -- 6. 重置副本
        --useLua("/run ResetInstances()") --重置
        sleep(1000)   
        -- 8. 前往修理商人修理过程
        moveA(234.317,7920.04,25.0776)
        moveA(240.032,7906,25.7801)
        moveA(240.032,7906,25.7801)
        useItem("紫色陆行鸟")
        useItem("霜狼嗥叫者的号角")    
        sleep(3500)
        moveA(257.147,7864.96,23.12)
        moveA(277.048,7861.91,24.5074)
        moveA(287.956,7851.34,22.3817)
        moveA(321.68,7850.33,22.7926)
        moveA(323.501,7843.37,22.3667)
        ID1,ID2 = getClosetTargetIDFilterName("被俘虏的侏儒",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --等待打开修理界面
        useLua("/run RepairAllItems()")
        sleep(11000)
        useLua("/click MerchantFrameCloseButton")

        moveA(323.593,7841.64,22.2002)
        moveA(320.136,7850.66,22.8244)
        moveA(279.189,7853.6,23.9565)
        moveA(259.729,7868.01,23.3538)
        mail()

        moveA(254.64,7864.97,23.0008)
        moveA(257.602,7818.61,23.3814)
        moveA(248.261,7760.65,23.0866)
        moveA(268.799,7628.81,21.9605)
        moveA(450.072,7375.96,16.3277)
        
            
        moveA(471.387,7302.45,14.0366)
        castSpellB("闪现术")
        moveA(488.224,7244.35,16.7861)
        castSpellB("闪现术")
        moveA(522.165,7055.7,16.8074)
        castSpellB("闪现术")
        moveA(544.161,6961.94,16.7637)
        castSpellB("闪现术")
        moveA(550.472,6957.96,9.62258)
        castSpellB("闪现术")
        moveA(570.18,6939.38,-21.9679)
        castSpellB("闪现术")
        moveA(581.349,6938.73,-39.9977)
        castSpellB("闪现术")
        moveA(608.24,6908.64,-47.6687)
        castSpellB("闪现术")
        moveA(608.09,6908.6,-47.6738)
        moveA(614.375,6890.87,-56.2252)
        moveA(627.688,6878.41,-71.2822)
        moveA(641.199,6868.34,-80.1888)
        moveA(665.759,6866.15,-78.4772)
        moveA(665.759,6866.15,-72.2003)
        moveA(709.469,6914.38,-67.8285)
        castSpellB("闪现术")
        moveA(720.006,6950.8,-68.0424)
        castSpellB("闪现术")
        moveA(717.492,6990.01,-73.0739)
        castSpellB("闪现术")
        moveA(733.508,7012.31,-72.6895)
        useLua("/run ResetInstances()") --重置
        sleep(1000)
             -- 7. 前往邮箱寄信过程
             -- 9. 回去副本门口过程
             -- 10. 重置副本
             -- 11. 这样构成一个循环
        end
    end   
 
else -- 如果身上带着灵魂状态的Debuff(人物死亡)
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,248.645,7084.57)--如果在炉石
    if mapDistance1 <= 40 and mapDistance1 >= 0 then --如果在炉石 then
        moveA(248.339,7084.93,36.4931)
        moveA(250.472,7070.83,36.4321)
        moveA(289.945,7058.72,35.8072)
        moveA(335.873,7041.86,18.2696)
        moveA(392.145,7017.98,18.2689)
        moveA(422.403,7005.16,18.2691)
        prints("a:开始准备灵魂状态潜水")
        useLua("/run MouselookStart()")
        useLua("/run MoveViewUpStart(1)")
        moveA(429.783,7002.05,18.2691)
        useLua("/run MouselookStop()")
        useLua("/run MoveViewUpStop(1)")
        moveA(461.02,6989.17,18.2678)
        useLua("/run MouselookStop()")
        useLua("/run MoveViewUpStop(1)")
        moveA(498.351,6972.13,18.2678)
        useLua("/run MouselookStart()")
        useLua("/run MoveViewUpStart(1)")
        moveA(543.308,6947.77,18.2678)
        useLua("/run MouselookStop()")
        useLua("/run MoveViewUpStop(1)") 
        moveA(558.874,6947.32,3.42938)
        moveA(564.622,6941.72,-8.59854)
        moveA(575.166,6943.31,-36.0657)
        moveA(601.757,6916.48,-46.8129)
        moveA(611.872,6892.78,-53.1743)
        sleep(1000) --等待打开修理界面
        moveA(625.733,6880.79,-70.6405)
        moveA(633.662,6868.47,-77.6463)
        moveA(658.132,6865.01,-83.3429)
        moveA(683.197,6879.15,-70.5428)
        moveA(707.939,6914.73,-67.9848)
        moveA(724.224,6953.45,-67.0945)
        moveA(718.469,6987.9,-73.0748)
        moveA(728.51,7011.19,-72.2453)
        moveB(743.192,7014.06,-72.7946)
        prints("a:灵魂状态进本")
        waitForLoadingPosition(743.192,7014.06,-72.7946)
        moveB(120.223,-138.426,-0.821922)
        prints("a:灵魂状态出本")
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        sleep(2000)
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,335.886,7625.12)--如果在炉石
    if mapDistance1 <= 40 and mapDistance1 >= 0 then --如果在炉石 then
        sleep(2000)
        moveA(335.886,7625.12,22.7486)
    -- contactTarget(IDa,IDb)
        moveA(383.34,7567.48,22.0386)
        moveA(388.64,7535.66,17.9626 )
        moveA(404.517,7449.27,18.2695)
    -- contactTarget(IDa,IDb)
        moveA(451.463,7345.63,18.2695)
        moveA(466.562,7235.69,18.2695)
        --moveA(466.562,7235.69,18.2695)
        moveA(479.393,7160.4,18.2695)
        moveA(514.855,7038.24,18.2695)
        moveA(532.394,6999.08,18.2695)
        moveA(534.142,6995.37,18.2677)
        useLua("/run MouselookStart()")
        useLua("/run MoveViewUpStart(1)")
        moveA(538.018,6990.32,18.2677)
        useLua("/run MouselookStop()")
        useLua("/run MoveViewUpStop(1)")
        moveA(540.961,6983.18,18.2677)
        useLua("/run MouselookStart()")
        useLua("/run MoveViewUpStart(1)")
        moveA(544.079,6975.99,18.2677)
        useLua("/run MouselookStop()")
        useLua("/run MoveViewUpStop(1)")
        --moveA(546.394,6970.8,18.2677)
        moveA(549.393,6964.16,18.2677)
        moveA(564.622,6941.72,-8.59854)
        moveA(575.166,6943.31,-36.0657)
        moveA(601.757,6916.48,-46.8129)
        moveA(611.872,6892.78,-53.1743)
        moveA(625.733,6880.79,-70.6405)
        moveA(633.662,6868.47,-77.6463)
        moveA(658.132,6865.01,-83.3429)
        moveA(683.197,6879.15,-70.5428)
        moveA(707.939,6914.73,-67.9848)
        moveA(724.224,6953.45,-67.0945)
        moveA(718.469,6987.9,-73.0748)
        moveA(728.51,7011.19,-72.2453)
        moveB(743.192,7014.06,-72.7946)
        prints("a:灵魂状态进本")
        waitForLoadingPosition(743.192,7014.06,-72.7946)
        moveB(120.223,-138.426,-0.821922)
        prints("a:灵魂状态出本")
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        sleep(2000)
    end

end

