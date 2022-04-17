function battle()
    local n,cooldown,targetHP,x ,y,z,distance,ID3,ID4 = 0,0,0,0,0,0,0,0,0
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local name,chat = getChatInfoByType(7)
    if name ~= "" and name ~= 0 and name ~= -1 then
        --useLua("/reply 没有")
    end
    while ID1 ~= 0 and ID1 ~= -1 do
        if getRoleCurrentMP() == -1 then
            break
        end
        n = n + 1
        sleep(180)
        if getRoleCurrentMP() <= 10 and getRoleCurrentMP() >= 0 then
            useItem("法力刚玉")
        end

        if getRoleCurrentHP() <= 15 and getRoleCurrentHP() >= 0 then
            useItem("特效治疗药水")
        end

        cooldown = getSpellCoolDown(33405)
        ID1,ID2 = getHighestHPTargetIDInBattle(3)
        targetHP = getTargetHPByID(ID1,ID2,3)

        if cooldown == 1 and n >= 1 and IsBuffExist(33405) == 0 and targetHP > 30 then
            castSpellB("寒冰护体(等级 6)")
            sleep(1400)
            goto continue

        elseif cooldown == 1 and n >= 1 and IsBuffExist(33405) == 0 and getRoleCurrentHP() <= 15 then
            castSpellB("寒冰护体(等级 6)")
            sleep(1400)
            goto continue

        end
        --[[
        cooldown = getSpellCoolDown(12043)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if cooldown == 1 and  distance <= 10 and  distance >= 0 and n >= 4 and targetHP > 30 then
            castSpellA("气定神闲")
            castSpellA("烈焰风暴(等级 7)")
            x,y,z = getRolePosition()
            castSpellPosition(x,y,z)
            sleep(1400)
        end
        --]]
        ID1,ID2 = getClosetTargetIDInBattle(3)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if ID1 ~= 0 and ID1 ~= -1 and distance < 13 and distance >= 0 then
            castSpellB("魔爆术(等级 8)")
            sleep(1400)
        end
        if n >= 140 then
            sleep(1000)
            ID3,ID4 = getClosetTargetIDInBattle(3)
            chooseTarget(ID3,ID4)
            castSpellA("法术反制")
        end
        
        ::continue::
    end

end

function openGate()
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("礼拜堂大门",1054.38, 1395.07,6,8)
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
            sleep(4200)
        else
            return 0
        end
    end

end

function openOutGate()
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("大教堂的门",2908.93,-819.313,6,8)
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
            sleep(4200)
        else
            return 0
        end
    end
end

function drink()
    local drinkBag, drinkSlot = getBelongBagAndSlotByID(30703)
    local breadBag, breadSlot = getBelongBagAndSlotByID(22895)
    sleep(1000)
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
        drinkBag, drinkSlot = getBelongBagAndSlotByID(30703)
        breadBag, breadSlot = getBelongBagAndSlotByID(22895)
        if drinkSlot == 0 or breadSlot == 0 then
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


--主程序开始
--从本外开始
if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
    --进本
   
    moveA(2911.63,-825.198,160.327)
    moveA(2913.34,-824.399,160.327)
    moveA(2917.79,-822.329,160.327)
    moveB(2919.92,-822.062,160.327)
    waitForLoading()

    -- 进本 后
    drink()
    sleep(1000)
    castSpellA("奥术智慧(等级 6)")
    castSpellA("冰甲术(等级 5)")
    castSpellA("魔法抑制(等级 6)")
    castSpellA("寒冰护体(等级 6)")
    drink()

    --准备阶段结束
    moveA(855.86,1322.17,18.6729)
    useLua("/party follow1") --让小号进本
    moveA(870.513,1323.24,18.0061)
    castSpellB("魔爆术(等级 1)")
    moveA(870.578,1334.98,18.0061)
    castSpellB("闪现术")
    moveA(870.465,1363.59,18.0062)
    castSpellB("魔爆术(等级 1)")
    moveA(870.358,1390.81,18.0062)
    castSpellB("魔爆术(等级 1)")
    moveA(870.314,1401.99,18.0062)
    battle()
    sleep(1000)
    drink()
    sleep(1000)
    castSpellB("寒冰护体(等级 6)")
    sleep(1000)
    --进门波次结束

    moveA(881.488,1399.04,18.6766)
    castSpellB("防护冰霜结界(等级 6)")
    moveA(886.74,1398.07,18.6779)--出门
    castSpellB("魔爆术(等级 1)")
    moveA(890.706,1390.19,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(891.941,1374.51,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(892.002,1362.38,18.6779)--第一个转弯口
    castSpellB("魔爆术(等级 1)")
    moveA(894.834,1361.81,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(918.382,1360.04,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(932.598,1360.38,18.6766)
    castSpellB("闪现术")
    moveA(952.379,1361.03,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(963.534,1363.19,18.6766)
    castSpellB("魔爆术(等级 1)")
    moveA(958.612,1376.26,18.0233)
    castSpellB("魔爆术(等级 1)")
    moveA(944.456,1384.74,19.7316)
    castSpellB("魔爆术(等级 1)")
    moveA(934.34,1388.89,18.3432)
    castSpellB("闪现术")
    moveA(912.41,1395.9,18.0245)
    castSpellB("魔爆术(等级 1)")
    moveA(897.297,1398.22,18.5015)
    castSpellB("魔爆术(等级 1)")
    moveA(875.509,1400.51,18.0064)
    moveA(875.227,1406.25,18.0061)
    battle()
    sleep(1000)
    drink()
    sleep(1000)


    --第二波开始
    moveA(874.621,1404.83,18.0062)
    castSpellB("寒冰护体(等级 6)")
    moveA(875.678,1399.01,18.0062)
    moveA(890.411,1399.01,18.6766)
    moveA(922.954,1399.76,19.673)
    moveA(962.26,1400.16,18.3361)
    castSpellB("防护冰霜结界(等级 6)")
    moveA(959.16,1424.46,18.0232)
    castSpellB("魔爆术(等级 1)")
    moveA(964.294,1434.5,18.678)
    castSpellB("魔爆术(等级 1)")
    moveA(959.019,1437.62,18.678)
    castSpellB("魔爆术(等级 1)")
    moveA(946.431,1436.42,18.678)
    castSpellB("魔爆术(等级 1)")
    moveA(932.189,1436.5,18.678)
    castSpellB("魔爆术(等级 1)")
    moveA(921.772,1436.99,18.678)
    castSpellB("闪现术")
    moveA(892.754,1436.07,18.6778)
    castSpellB("魔爆术(等级 1)")
    moveA(889.587,1428.01,18.6778)
    castSpellB("魔爆术(等级 1)")
    moveA(890.448,1410.38,18.6778)
    castSpellB("魔爆术(等级 1)")
    moveA(884.508,1399.23,18.6778)
    castSpellB("魔爆术(等级 1)")
    moveA(873.849,1399.85,18.0061)
    castSpellB("魔爆术(等级 1)")
    moveA(875.227,1406.25,18.0061)
    battle()
    sleep(1000)
    drink()
    sleep(1000)

    --第三波开始
    moveA(875.47,1398.95,18.006)
    moveA(890.96,1398.7,18.6765)
    moveA(915.821,1387.66,18.0233)
    castSpellB("魔爆术(等级 1)")
    moveA(918.74,1376.34,18.0105)
    castSpellB("魔爆术(等级 1)")
    moveA(951.656,1378.6,18.0219)
    moveA(966.586,1379.35,18.678)
    castSpellB("寒冰护体(等级 6)")
    moveA(985.711,1379.22,24.2955)
    castSpellB("魔爆术(等级 1)")
    moveA(987.416,1362.71,27.2986)
    castSpellB("防护冰霜结界(等级 6)")
    moveA(987.1,1344.95,29.1331)
    castSpellB("魔爆术(等级 1)")
    moveA(1015.81,1344.11,29.1331)
    castSpellB("魔爆术(等级 1)")
    moveA(1022.86,1344.06,29.1331)
    castSpellB("闪现术")
    moveA(1045.05,1345.89,29.1466)
    castSpellB("魔爆术(等级 1)")
    moveA(1042.81,1359.94,27.2991)
    castSpellB("魔爆术(等级 1)")
    moveA(1029.13,1368.51,27.3031)
    castSpellB("魔爆术(等级 1)")
    moveA(1038.64,1386.43,27.3071)
    castSpellB("魔爆术(等级 1)")
    moveA(1058.29,1389.98,28.3367)
    castSpellB("魔爆术(等级 1)")
    moveA(1045.77,1395.73,27.304)
    castSpellB("魔爆术(等级 1)")
    moveA(1035.46,1395.16,27.3075)
    castSpellB("闪现术")
    moveA(1010.74,1393.23,28.0628)
    castSpellB("寒冰护体(等级 6)")
    moveA(1002.72,1392.02,27.1365)
    castSpellB("魔爆术(等级 1)")
    moveA(976.522,1394.47,27.1365)
    castSpellB("魔爆术(等级 1)")
    moveA(966.588,1384.97,18.6779)
    castSpellB("法力护盾(等级 7)")
    moveA(967.27,1388.25,18.6779)
    castSpellB("法力护盾(等级 7)")
    battle()
    sleep(1000)
    drink()
    sleep(1000)

    --第四波开始
    moveA(966.747,1386.43,18.678)
    moveA(966.93,1379.74,18.678)
    moveA(985.837,1379.05,24.2953)
    moveA(987.621,1364.74,27.2988)
    moveA(1007.13,1364.92,27.3097)
    moveA(1016.81,1371.22,27.3104)
    moveA(1035.83,1382.51,27.3078)
    castSpellB("寒冰护体(等级 6)")
    moveA(1052.24,1394.45,27.302)
    castSpellB("防护冰霜结界(等级 6)")
    moveA(1059.04,1407.41,28.584)
    castSpellB("魔爆术(等级 1)")
    moveA(1042.77,1409.57,27.3021)
    castSpellB("魔爆术(等级 1)")
    moveA(1040.75,1428.91,27.3026)
    castSpellB("魔爆术(等级 1)")
    moveA(1043.25,1451.87,29.1468)
    castSpellB("魔爆术(等级 1)")
    moveA(1031.73,1454.52,29.1468)
    moveA(1004.66,1454.2,29.1469)
    castSpellB("魔爆术(等级 1)")
    moveA(988.155,1454.2,29.1469)
    castSpellB("魔爆术(等级 1)")
    moveA(989.288,1437.93,27.2985)
    --选中目标并反制
    targetID1,targetID2 = getClosetTargetIDToAPosition(1012.48, 1432.78,3)
    chooseTarget(targetID1,targetID2)
    castSpellA("法术反制")
    moveA(986.984,1425.98,26.3751)
    castSpellB("魔爆术(等级 1)")
    moveA(980.621,1417.34,24.2955)
    castSpellB("魔爆术(等级 1)")
    moveA(972.791,1416.44,20.9934)
    castSpellB("魔爆术(等级 1)")
    moveA(963.535,1415.97,18.678)
    castSpellB("魔爆术(等级 1)")
    moveA(965.56,1412.73,18.6778)
    castSpellB("法力护盾(等级 7)")
    moveA(967.27,1409.97,18.6778)
    castSpellB("法力护盾(等级 7)")
    battle()
    sleep(1000)
    drink()
    sleep(1000)

    --开门
    moveA(967.27,1409.98,18.6779)
    moveA(965.7,1418.87,18.6779)
    moveA(984.828,1419.63,24.2953)
    moveA(987.343,1433.51,27.2986)
    moveA(1008.29,1431.74,27.3094)
    moveA(1022.7,1424.51,27.497)
    moveA(1047.71,1406.66,27.3034)
    castSpellB("寒冰护体(等级 6)")
    moveA(1066.84,1398.89,30.7637)
    openGate()

    --第五波
    moveA( 1076.1,1398.82,30.3024 )
    moveA( 1085.87,1399.21,30.3037 )
    moveA( 1086.51,1399.21,30.304 )
    castSpellB("寒冰护体(等级 6)")
    moveA( 1118.89,1398.97,30.3063 )
    moveA( 1123.72,1399.37,30.3062 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1109.87,1398.62,30.3063 )
    castSpellB("闪现术")
    moveA( 1056.73,1399.88,27.299 )
    moveA( 1037.49,1404.79,27.306 )
    moveA( 1021.65,1407.93,27.7674 )
    moveA( 1001.88,1407.47,27.1363 )
    moveA( 981.741,1406.75,27.1363 )
    moveA( 972.816,1407.07,27.1363 )
    castSpellB("法力护盾(等级 7)")
    moveA( 964.163,1407.59,18.9575 )
    castSpellB("法力护盾(等级 7)")
    moveA( 966.852,1410.85,18.6782 )
    battle()
    sleep(1000)
    drink()
    sleep(1000)

    --第六波
    moveA( 965.62,1414.92,18.678 )
    moveA( 968.433,1418.95,18.8719 )
    moveA( 985.289,1419.4,24.2954 )
    moveA( 988.149,1433.56,27.2986 )
    moveA( 1000.31,1433.88,27.3029 )
    moveA( 1003,1433.15,27.3056 )
    castSpellB("闪现术")
    moveA( 1034.68,1423.25,27.3061 )
    moveA( 1053.49,1401.14,27.3016 )
    moveA( 1076.4,1398.77,30.3024 )
    moveA( 1101.45,1398.74,30.3058 )
    moveA( 1122.86,1398.94,30.3062 )
    moveA( 1137.83,1396.87,30.6008 )
    castSpellB("寒冰护体(等级 6)")
    moveA( 1141.27,1350.01,30.3059 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1137.81,1366.3,30.3059 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1135.63,1379.01,30.3062 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1115.37,1380.32,30.3065 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1099.64,1379.83,30.3065 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1085.15,1382.68,30.3038 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1075.5,1397.27,30.3038 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1063.81,1399.69,30.3187 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1052.1,1401.43,27.301 )
    castSpellB("闪现术")
    moveA( 1016.27,1407.08,27.1364 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1004.45,1407.25,27.1364 )
    castSpellB("寒冰护体(等级 6)")
    moveA( 974.876,1406.78,27.1364 )
    castSpellB("魔爆术(等级 1)")
    moveA( 964.981,1408.19,19.8212 )
    castSpellB("魔爆术(等级 1)")
    moveA( 967.004,1410.47,18.6777 )
    battle()
    sleep(1000)
    drink()
    sleep(1000)

    --最后一波
    moveA( 964.987,1417.67,18.6778 )
    moveA( 984.879,1419.21,24.2954 )
    moveA( 987.341,1432.36,27.2986 )
    moveA( 997.77,1434.09,27.3014 )
    moveA( 1011.03,1431.79,27.3091 )
    moveA( 1025.7,1423.86,27.3079 )
    castSpellB("闪现术")
    moveA( 1061.77,1399.09,29.294 )
    moveA( 1092.9,1400.08,30.3054 )
    moveA( 1115.15,1401.62,30.3063 )
    moveA( 1134.22,1404.14,30.3047 )
    moveA( 1144.14,1416.56,31.4696 )
    moveA( 1145.01,1430.62,31.7216 )
    castSpellB("寒冰护体(等级 6)")
    moveA( 1142.36,1449.59,30.3067 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1139.26,1441.08,30.3067 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1135.92,1420.98,30.3067 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1111.73,1417.75,30.3065 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1084.77,1418.05,30.3038 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1077.58,1401.19,30.3018 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1066.51,1398.66,30.764 )
    castSpellB("闪现术")
    moveA( 1021.61,1405.63,27.6669 )
    castSpellB("魔爆术(等级 1)")
    moveA( 1001.29,1406.99,27.1363 )
    castSpellB("寒冰护体(等级 6)")
    moveA( 975.076,1407.03,27.1362 )
    moveA( 967.257,1410.99,18.6782 )
    battle()
    sleep(1000)
    drink()
    sleep(1000)
 

    unusedBag = getUnusedAllBagSlotNum()--获得背包剩余的格子数目
    headDuration = getEquipementDurationBySlotNum(1)
    if unusedBag >= 10 and headDuration >= 10 then --如果装备不红，背包没满，就出本继续
        moveA(967.056,1410.88,18.678)
        moveA(961.577,1420.91,18.678)
        moveA(948.132,1421.67,18.0234)
        moveA(940.701,1421.47,18.0234)
        castSpellB("闪现术")
        moveA(912.756,1416.26,18.0122)
        moveA(898.781,1401.07,18.022)
        moveA(872.937,1397.73,18.0062)
        moveA(871.246,1377.96,18.0062)
        moveA(870.804,1353.01,18.0062)
        moveA(871.508,1333.6,18.0062)
        moveA(870.833,1321.2,18.0062)
        moveA(852.641,1321.35,18.6721)
        moveA(852.937,1316.32,18.6721)
        moveA(853.65,1315.96,18.6723)
        useLua("/party follow2")
        moveB(852.499,1312.79,18.6714)
        waitForLoading()
        useLua("/run ResetInstances()") --重置
    elseif unusedBag <= 10 or headDuration <= 10 then --如果装备红了或者背包满了回城修理
        if unusedBag ~= -1 and headDuration ~= -1 then  --再次验证数据是否成功
            useItem("炉石")
            waitForLoading()
            moveA(2269.6,243.257,34.257)
            moveA(2269.03,240.603,34.257)
            moveA(2247.02,242.901,34.2605)
            moveA(2247.34,249.769,34.2438)
            moveA(2230.65,253.067,33.5294)
            moveA(2244.68,287.455,35.0045)
            moveA(2248.22,306.152,35.1795)
            ID1,ID2 = getClosetTargetIDFilterName("伊莉莎·考伦",3,8)
            contactTarget(ID1,ID2)
            sleep(1000) --等待打开修理界面
            useLua("/run RepairAllItems()")
            sleep(3000)
            useLua("/click MerchantFrameCloseButton")
            useItem("霜狼嗥叫者的号角")
            useItem("紫色陆行鸟")
            sleep(3500)
            moveA(2248.22,306.152,35.1795)
            moveA(2244.68,287.455,35.0045)
            moveA(2230.65,253.067,33.5294)
            moveA(2230.24,229.87,32.0838)
            moveA(2224.42,216.127,31.7858)
            moveA(2215.49,215.318,35.9582)
            moveA(2207.71,206.208,41.4913)
            moveA(2203.6,178.282,49.0163)
            moveA(2193.64,150.918,53.2722)
            moveA(2188.26,135.188,49.1687)
            moveA(2165.4,61.522,34.5465)
            moveA(2168.14,-26.5264,38.8127)
            moveA(2174.44,-113.404,40.4416)
            moveA(2183.88,-201.623,46.0829)
            moveA(2242.17,-265.544,59.9107)
            moveA(2274.88,-277.262,61.2637)
            moveA(2343.79,-320.157,63.8473)
            moveA(2364.54,-355.787,64.7551)
            moveA(2350.8,-420.987,70.2877)
            moveA(2361.13,-460.718,73.3612)
            moveA(2414.25,-523.418,72.6887)
            moveA(2461.78,-584.806,70.2846)
            moveA(2494.45,-623.877,72.4359)
            moveA(2511.55,-642.755,74.1684)
            moveA(2584.01,-645.977,88.1108)
            moveA(2647.57,-642.758,107.962)
            moveA(2675.8,-676.679,113.082)
            moveA(2724.36,-691.809,120.304)
            moveA(2768.81,-705.064,126.752)
            moveA(2811.7,-702.026,136.257)
            moveA(2840.57,-693.946,139.331)
            moveA(2847.3,-699.697,139.331)
            moveA(2860.85,-734.704,157.264)
            moveA(2872.88,-763.729,160.332)
            moveA(2881.47,-768.173,160.332)
            useLua("/party follow2")
            moveA(2887.5,-769.991,160.332)
            castSpellB("寒冰护体(等级 6)")
            moveA(2907.39,-816.117,160.332)
            openOutGate()
            moveA(2907.39,-816.117,160.332)
            openOutGate()
            moveA(2910.92,-824.89,160.329)
            moveA(2911.63,-825.198,160.327)
            useLua("/run ResetInstances()") --重置

        end
    end      
else -- 如果身上带着灵魂状态的Debuff(人物死亡)
    -- 副本外跑尸流程
    -- 1.跑尸进本
    -- 2.出本
    -- 这样，脚本会自动循环到上面的刷怪流程，构成一个循环
    moveA(2608.49,-538.961,89.0597)
    moveA(2612.7,-548.789,88.9998)
    moveA(2608.08,-561.564,88.9998)
    moveA(2601.75,-571.432,93.1976)
    moveA(2606.13,-585.436,97.3144)
    moveA(2637.45,-619.977,106.352)
    moveA(2677.12,-673.247,112.926)
    moveA(2737.85,-696.099,122.365)
    moveA(2779.37,-702.497,128.638)
    moveA(2815.21,-699.775,136.947)
    moveA(2843.22,-694.372,139.332)
    moveA(2851.85,-712.866,145.512)
    moveA(2862.56,-739.497,159.818)
    moveA(2873.24,-764.218,160.332)
    moveA(2886.26,-767.951,160.332)
    moveA(2903.85,-807.124,160.332)
    moveA(2911.1,-824.627,160.329)
    moveA(2916.64,-822.8,160.327)
    moveA(2918.2,-822.134,160.327)
    moveA(2917.79,-822.329,160.327)
    moveB(2919.92,-822.062,160.327)
    waitForLoading()
    moveB(852.499,1312.79,18.6714)
    waitForLoading()
end