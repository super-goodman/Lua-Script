


maxStormLevel = 7  --��ǰ��󱩷�ѩ�ȼ�
maxStormID = 0xCD
maxShieldID = 33405  --��ǰ��󺮱����巨��ID
maxFireShieldID = 27128  --��ǰ�����������編��ID
maxWaterLevel = 8 --���ˮ����ȼ�
maxBreadLevel = 7 --�����������ȼ�
maxLevelWaterName = "ħ��ɽȪˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ��������" --ʹ���������
maxLevelWaterCreatorID = 30703   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 22895   --ʹ�������ƷID
maxLevelWaterBUFFID = 34291      --ʹ��ˮBUFFID
maxLevelBreadBUFFID = 29073      --ʹ�����BUFFID

--����������ƷID
doNotSellItems = {[17031] = true,[23883] = true,[31329] = true,[31878] = true,[17032] = true,[21990] = true,[13446] = true,[30668] = true,[22832] = true,[22829] = true,[31952] = true,[27498] = true,[31883] = true}
--�����ʼĵ���ƷID
doNotMailItems = {[17031]=true,[17032]=true,[13446]=true,[22829]=true}
--��Ҫ���ٵ���������
mustDestroyItemNum = 1
--�������ٵ���Ʒ
mustDestroyItem = {[1] = 22044}

--�ű�����(��)
initialMoney = 0

--˹ͨ�ɵµ�������
function StoneToDugeon()

    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-10468.5,-3330.76)--����ڴ��͵�
    if mapDistance <= 20 and mapDistance > 0 then    
        prints("��ʼ˹ͨ�ɵ´��͵㵽������") 
        moveA(-10468.5,-3330.76,25.4716)
        moveA(-10446.3,-3297.47,20.1779)
        mountUp()
        moveA(-10440.8,-3284,20.1779)
        moveA(-10459.7,-3226.84,20.1783)
    end 
    roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    mapDistance = getDistanceBetween(roleX,roleY,-10482,-3258.08)--����ڴ��͵�
    if mapDistance <= 20 and mapDistance > 0 then 
        prints("��ʼ˹ͨ�ɵ�¯ʯ�㵽������") 
        --��¯ʯ
        ID1,ID2 = getClosetTargetIDFilterName("����",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ����������
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/click StaticPopup1Button1")
        sleep(1000)
        moveA(-10482,-3258.08,21.0343)
        moveA(-10459,-3262.06,20.1793)
        moveA(-10424.9,-3261.75,20.1793)
        moveA(-10408.2,-3265.15,21.7433)
        --��װ��
        ID1,ID2 = getClosetTargetIDFilterName("������",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ����������
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton5")
        useLua("/click GossipTitleButton3")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(3000)
        useLua("/click MerchantFrameCloseButton")
        moveA(-10416.2,-3262.4,20.1785)
        --������
        mountUp()
        moveA(-10461.5,-3265.31,20.179)
        --�ʼ�
        mail()
        moveA(-10449.1,-3258.32,20.1783)
        moveA(-10463.3,-3222.34,20.1789)
    end
    roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    mapDistance = getDistanceBetween(roleX,roleY,-10462.8,-3217.05)--����ڴ��͵�
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
        prints("¯ʯ������������")
        moveB(-11094.1,-1997.29,42.4755)
        waitForLoadingPosition(-11094.1,-1997.29,42.4755)
        prints("¯ʯ�����������ɹ�")    
    end
end

function dugeonToStone()
    if getMoney() >= 300 and getStoneCoolDown(6948) == 0 then
        sleep(2000)
        useItem("¯ʯ")
        sleep(9000)
        waitForLoading()
        sleep(2000)  
    end
end


function mail()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ�ʼ�")
    for i=0,4,1 do --ѭ�������и���������Ʒ������,ֱ�������ʼ�
        bagNum = getBagSlotNum(i) --��ñ����Ĵ�С
        unUsedSLot = getUnusedBagSlotNum(i)--������б���ʣ��Ŀո���
        if bagNum-unUsedSLot > 0 then --����������ж���
            contactClosetMailObjec()--�����以��(������)
            clickSendMailFrame()--�򿪷���ҳ��
            setMailTargetName()--��д���֣������ڽű�������д
            for k = 1,bagNum,1 do --���Խ������е�ÿ�����Ӷ��������䣬û�оͲ��ţ��оͻ�Ž�ȥ
                ID1,ID2,GUID,num,bag,slot = getItemInfoBySlot(i,k)
                if doNotMailItems[GUID] ~= true then
                    putMailItem(i,k) --����
                    sleep(10)
                end
                sleep(10)
            end
            sendMail()--�����ʼ�
            useLua("/click MailFrameCloseButton")
            sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
        end
    end
    contactClosetMailObjec()--�����以��
    clickSendMailFrame()--�򿪷���ҳ��
    sleep(200)
    setMailTargetName()--��д���֣������ڽű�������д
    putMailMoney(500)--����500G
    sendMail()--�����ʼ�
    useLua("/click MailFrameCloseButton")
    sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
end

--��װ��
function repaire(name)
    ID1,ID2 = getClosetTargetIDFilterName(name,3,8)
    contactTarget(ID1,ID2)
    sleep(2000) --�ȴ����������
    contactTarget(ID1,ID2)
    useLua("/click GossipTitleButton1")
    sleep(1000)
    useLua("/run RepairAllItems()")
    sleep(2000)
end



--�ӿ�������
function jumpDown()
    standBy()
    sleep(500)
    unableFly()
    unableWallThrough()
    jumpB()
    sleep(2000)  
end

--��������
function destroyJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    for i = 1, mustDestroyItemNum, 1 do
        if isItemExist(mustDestroyItem[i]) == 1 then
            prints("��������:%s",mustDestroyItem[i])
            destroyItemByID(mustDestroyItem[i])
        end
    end
end

function sellJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --��ʼ����
    --����2��
    for i = 1, 1, 1 do
        for i=0,4,1 do --ѭ�������и���������Ʒ������,ֱ�������ʼ�
            bagNum = getBagSlotNum(i) --��ñ����Ĵ�С
            unUsedSLot = getUnusedBagSlotNum(i)--������б���ʣ��Ŀո���
            if bagNum-unUsedSLot > 0 then --����������ж���
                for k = 1,bagNum,1 do --���Խ������е�ÿ�����Ӷ��������䣬û�оͲ��ţ��оͻ�Ž�ȥ
                    ID1,ID2,GUID,num,bag,slot = getItemInfoBySlot(i,k)
                    if doNotSellItems[GUID] ~= true then
                        putMailItem(i,k) --����
                        sleep(10)
                    end
                end
            end  
        end
    end
    useLua("/click MerchantFrameCloseButton")
end

--ǰ������
function goToRepaire()
    --���ͷ�����;ö�
    local headDuration = getEquipementDurationBySlotNum(5)
    --��ñ���ʣ��ĸ�����Ŀ
    local unusedBag = getUnusedAllBagSlotNum()
    if unusedBag <= 10 or headDuration <= 20  then
        prints("ǰ������")
        moveF(-10898.1,-1796.37,238.9649)
        moveF(-10934.9,-1804.33,236.921)
        moveF(-11011,-1819.05,234.388)
        moveF(-11110.7,-1838.33,231.69)
        moveF(-11153.8,-1846.68,248.298)
        jumpDown()
        repaire("������")
        sellJunks()
        moveA(-11170.4,-1829,239.47)
        sleep(10000)
    end
end

--�Ժ�
function drink()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ�Ժ�")
    --ˮ
    if isItemExist(maxLevelWaterCreatorID) == 0 then
        castSpellA("��ˮ��".."(�ȼ� "..maxWaterLevel..")")
        sleep(3500)
    end
    --���
    if isItemExist(maxLevelBreadCreatorID) == 0 then
        castSpellA("��ʳ��".."(�ȼ� "..maxBreadLevel..")")
        sleep(3500)
    end
    --��ʼ�Ժ�

    if getRoleCurrentHP() < 95 then
        useItem(maxLevelBreadName)
    end
    if getRoleCurrentMP() < 95 then
        useItem(maxLevelWaterName)
    end
    local time = getThreadTime()
    --ѭ�����Ѫ��
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
    printd("��ʼʰȡ��%d",getNumOfCanBeLootUnit())
    --�����������10�������ø�����������ս��
    if getNumOfCanBeLootUnit() < 20 then
        resetFlag = 1
    end
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 do -- ѭ��n�Σ�mld�����кܶ�֣�
        local n = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        if(n > 0) then --�����������4���Ӿ�ʰȡ
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --�������Ŀ��Ա�ʰȡ�Ĺ���
            if ID1 ~= 0 and ID1 ~= -1 then --֤���������˹���
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --���Ŀ������ҵľ���
                if distance < 40 and distance >= 0 then -- �����8�뷶Χ�ڣ���ֹȥʰȡ̫Զ��Ŀ�꣬Ȼ�󱻿�ס
                    moveB(x,y,z)
                    contactTarget(ID1,ID2) --ʰȡĿ��
                    quickPickUp()
                    sleep(10)
                    useLua("/click StaticPopup1Button1")
                    
                end
            else --����û�п���ʰȡ��Ŀ���ˣ�����ѭ��
                break
            end
        else
            break
        end
        if getRoleflag1() ~= 0x00 and getRoleflag1() ~= 0x04 then
            castSpellA("ħ����")
        end
        sleep(10)
    end
end

--���취����ʯ
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("����ħ����ʯ")
    if isItemExist(22044) == 0 and getRoleLevel() >= 68 then
        castSpellA("����ħ����ʯ")
        sleep(3500)
    end
    if isItemExist(8008) == 0 then
        castSpellA("����ħ���챦ʯ")
        sleep(3500)
    end
    if isItemExist(8007) == 0 then
        castSpellA("����ħ����ˮ��")
        sleep(3500)
    end
end

--��BUFF
function castBuffs()
    if getGlobalFlag() ~= 1 then
        return 
    end
    prints("��BUFf")
    sleep(500)
    castSpellA("�����ǻ�")
    sleep(1500)
    castSpellA("��ʦ����")
    sleep(1000)
end


--��ǹ��Ŀ��
function iceLenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ǹ��Ŀ��:%s",name)
    local ID1,ID2,x,y = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    standBy()
    sleep(100)
    rotateA(x,y)
    rotateA(x,y)
    chooseTarget(ID1,ID2)
    castSpellA("��ǹ��")
    sleep(100)
end

--��������Ŀ��
function silenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��������Ŀ��:%s",name)
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    chooseTarget(ID1,ID2)
    castSpellA("��������")
    sleep(100)
end


--����ԭ��FLy�޸�
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

--����ѩ����
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 
    end
    standBy()
    sleep(10)
    printf("����ѩ:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        castSpellA("����ѩ")
    else
        castSpellA("����ѩ".."(�ȼ� "..stormLevel..")")
    end

    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end

--������
function battleDistanceCheck(time,distance)
    for i = 1, 40, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance1 = getClosetTargetIDInBattle(3)
        if distance1 >= 0 and distance1 < distance then
                prints("%s ���ڽӽ����ر�",name)
                return true
        end
        sleep(time/40)
    end
    return false
end


--��ս������ѩ level = 1����������,������1��
function stormWhenInbattle(level,x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 
    end
    --��Ѫ���
    if getRoleCurrentHP() <= 70 then
        useItem("��Ч����ҩˮ")
        useItem("��������ҩˮ")
    end
    if getRoleCurrentMP() >= 15 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --ѭ�������ӳ��жϣ�������ܱ���ϣ����ͷ�һ������ѩ����
    local stormTime = getThreadTime()
    for i = 1, 36, 1 do
        local flag = getRoleflag1()
        if flag ~= 0x08 and flag == 0x00 or flag == 0x04 or (getThreadTime() - stormTime) > 8 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= maxStormID and spellID ~= 0x0A and i > 10 and i < 30 then
            storm(1,x,y,z)
        else
            sleep(time/40)
        end
        if state == 1 then
            local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance >= 0 and distance < 13 then
                prints("%s ���ڽӽ����ر�",name)
                return
            end
        end
    end
    printd("����ѩʱ��:%d",getThreadTime() - stormTime)
    --�Ա�ʯ
    if isItemExist(22044) == 1 and getRoleCurrentMP() <= 65 then
        useItem("��������")
        useItem("���ʷ���ҩˮ")
        return
    end
    if isItemExist(8008) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�����챦ʯ")
        useItem("���ʷ���ҩˮ")
        return
    end
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("������ˮ��")
        useItem("���ʷ���ҩˮ")
        return
    end
end



function battle()
    prints("��ʼ��ʽս��")
    
    while getRoleflag1() == 0x08 and getRoleflag1() ~= 0x04 and  getGlobalFlag() == 1 do
        --��ѩ�ſ�1������������
        stormWhenInbattle(1,-10868.4,-1794.89,78.3937,8000,1)
        --�ߵ����
        battleFly(-10898.7,-1799,98.0319)
        if getRoleCurrentMP() <= 20 and getSpellCoolDown(12051) == 1 then
            standBy()
            sleep(100)
            castSpellA("����")
            sleep(7000)
        else
            useLua("/use 13")
            useLua("/use 14")
            stormWhenInbattle(1,-10869.5,-1791.61,78.3937,8500,0)
        end
        sleep(500)
        --�ߵ��ڲ�
        battleFly(-10898.6,-1795.39,97.1787)
    end
end


function main()
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
        prints("\n��Ҫ�ȼ�:68\n��ʼ�ص�:˹ͨ�ɵ´��͵��¯ʯ���븱���ڲ��ſ� \n������Ҫ:��׼ˢ���츳,��Ҫ�̹ǣ�����\n��ҪЬ���ƶ��ٶȸ�ħ\n��Ҫ������������װ��(�÷�,ҹ��)")
        dugeonToStone()
        StoneToDugeon()
        initialMoney = getMoney()
        --ǰ��ˢ�ֵ�
        castBuffs()
        moveF(-11102,-1998.29,154.8921,1)
        moveF(-11116.9,-1935.44,153.788)
        moveF(-11054.9,-1897.62,152.241)
        moveF(-10913.7,-1837.96,154.520,1) 
        --׼������
        local headDuration = getEquipementDurationBySlotNum(5)
        if headDuration < 10 then
            goToRepaire() 
        end  
        --���գ�׼������ 
        moveF(-10891.8,-1789.75,118.502)
        sleep(1000)
        drink()
        magicStone()
        drink()
        moveA(-10898.2,-1817.81,118.516)
        iceLenceTarget("����",-10914,-1838.06)
        moveA(-10887.6,-1816.71,116.252)
        silenceTarget("����",-10889,-1836.21)
        moveA(-10886.3,-1805.74,116.443)
        iceLenceTarget("����",-10904.3,-1812.87)
        --��ʼ�ùֵ�¥��
        moveA(-10884.6,-1791.51,117.972)
        moveF(-10858.4,-1792.93,116.763)
        --moveF(-10856.7,-1794.8,106.574)
        sleep(4000)
        moveA(-10889,-1795.06,110.797)
        --ǰ���۹ֱ���ѩ
        moveA(-10894,-1802.65,110.417)
        moveF(-10894,-1802.65,104.7723)
        --��ѩ�۹�
        storm(1,-10867.5,-1820.38,91.7319)
        local distanceState = battleDistanceCheck(7000,21)
        --�ߵ��ڲ�
        moveF(-10898.6,-1795.39,97.1787)
        --�ȴ����ﵽ��,�ȴ���ʱ����ݾ۹ֵ�ʱ������仯
        if distanceState == true then
            sleep(3000)
        else
            sleep(5000)
        end
    
        --��ʽ��ʼս��
        battle()
        prints("��ʽս������")
        --��ʼ��ʬ��
        moveA(-10895.8,-1791.68,95.9627)
        moveF(-10895.8,-1791.68,78.8996,1)
        moveA(-10874.8,-1793.73,78.5277)
        pickUp() 
        destroyJunks()

        goToRepaire()
        setGlobleVairable(1,1)
        moveF(-10871.7,-1794.14,97.3941)
        jumpDown()
        printd("�����ܼ�����G:%d",getMoney()-initialMoney+1)
        printd("�����ܼ�����G:%d",getMoney()-initialMoney+1)
        sleep(100000)
    else
        --����������ñ�־λΪ1,������ʬ״̬�����ø���
        printd("GlobleVairabl = %d",getGlobleVairable(1,1))
        if getGlobleVairable(1) == 1 then
            sleep(2000)
            useLua("/run ResetInstances()") --����
            sleep(1000)
            prints("�������óɹ�")   
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
        prints("��ʬ��ʼ����")
        moveB(-11096,-1990.53,47.0757)
        waitForLoadingPosition(-11096,-1990.53,47.0757)
        prints("��ʬ�����ɹ�")
    end
end

main()
