maxStormLevel = 5  --��ǰ��󱩷�ѩ�ȼ�
maxStormID = 0xCA  --��ǰ��󱩷�ѩ�ļ���ID 16���Ƶĺ�2λ
maxShieldID = 13032  --��ǰ��󺮱����巨��ID
maxWaterLevel = 6 --���ˮ����ȼ�
maxBreadLevel = 6 --�����������ȼ�
maxLevelWaterName = "ħ���մ�ˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ�������" --ʹ���������
maxLevelWaterCreatorID = 8078   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 8076   --ʹ�������ƷID
maxLevelWaterBUFFID = 1137      --ʹ��ˮBUFFID
maxLevelBreadBUFFID = 1131      --ʹ�����BUFFID
waitTime = 14 --����ʱ������


--����������ƷID
doNotSellItems = {[1705]=true,[4500]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--�����ʼĵ���ƷID
doNotMailItems = {[17031]=true,[17032]=true,[13446]=true}
--��Ҫ���ٵ���������
mustDestroyItemNum = 1
--��Ҫ���ٵ���Ʒ��ID
mustDestroyItem = {[1] = 22044}

--¯ʯ��������
function stoneToDugeon()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-12428.6,218.179)--�����¯ʯ
    if mapDistance <= 100 and mapDistance > 0 then 
        prints("��ʼ��¯ʯ��������")
        --��¯ʯ
        ID1,ID2 = getClosetTargetIDFilterName("�õ��ϰ�",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ����������
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/click StaticPopup1Button1")
        sleep(1000)
        moveA(-12428.6,218.179,2.36575)
        moveA(-12425.6,226.895,1.25534)
        moveA(-12370.4,207.93,3.36099)
        moveA(-12358.7,158.073,4.03919)
        --��ʼ����
        sellJunks()
        moveA(-12365.4,159.226,3.06746)
        --��ʼ������
        mountUp()
        moveA(-12391.5,146.954,2.72069)
        --��ʼ�ʼ�
        mail()
        --������ǽ
        enableClimb()
        moveA(-12390,121.953,3.57576)
        moveA(-12375,64.3304,6.10298)
        moveA(-12359.4,1.52937,10.0466)
        moveA(-12348.8,-37.4149,20.6962)
        moveA(-12343,-59.986,18.2207)
        moveA(-12339,-96.8092,17.9493)
        moveA(-12327.3,-126.819,17.4878)
        moveA(-12322.3,-144.943,18.0244)
        moveA(-12324.5,-182.768,19.9949)
        moveA(-12319.1,-244.308,15.5882)
        moveA(-12314.6,-275.026,12.1335)
        moveA(-12306.1,-327.332,10.7378)
        --�ٴ�������
        --mountUp()
        moveA(-12294.2,-354.7,15.9582)
        --������ǽ
        enableClimb()
        moveA(-12273.9,-414.408,18.1859)
        moveA(-12263.6,-444.678,18.7317)
        moveA(-12255,-468.902,17.1024)
        moveA(-12249.3,-509.22,26.9673)
        moveA(-12242.9,-548.852,29.9986)
        moveA(-12245,-577.147,30.5882)
        moveA(-12252.1,-600.386,30.3518)
        moveA(-12229.3,-661.459,12.6439)
        moveA(-12209.2,-732.32,13.6918)
        moveA(-12198.4,-780.84,18.4627)
        --������ǽ
        enableClimb()
        moveA(-12191.5,-840.175,42.0541)
        moveA(-12188.4,-866.612,40.0694)
        moveA(-12159.1,-965.826,32.9224)
        moveA(-12152,-994.84,35.1348)
        moveA(-12149.2,-1014.62,64.4694)
        moveA(-12146.5,-1081.76,101.217)
        moveA(-12135.9,-1130.12,112.459)
        moveA(-12133,-1175.94,186.753)
        moveA(-12115.2,-1192.18,196.39)
        moveA(-12093.5,-1211.3,212.224)
        moveF(-12090.1,-1210.61,217.484,1)
        moveF(-12090.1,-1210.61,217.484,1)
        moveA(-12013.9,-1191.39,216.316)
        moveA(-11916.2,-1262.75,214.316)
        moveF(-11916.2,-1262.75,98.127,1)
        --���ֲ��رշ���
        unableFly()
        unableWallThrough()
        unableClimb()
        sleep(1000)
        castSpellA("������")
        moveA(-11916.4,-1274.29,85.1067)
        prints("���������������ʼ")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("��������������ɹ�")
    end
end

function dugeonToStone()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-11916.7,-1246.61)--����ڸ�������ſ�
    if mapDistance <= 10 and mapDistance > 0 and getStoneCoolDown(6948) == 0 then--���¯ʯû��CD,��ʹ��¯ʯ
        local headDuration = getEquipementDurationBySlotNum(1)
        local unusedBag = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        if headDuration <= 30 or unusedBag <= 3 then
            sleep(2000)
            useItem("¯ʯ")
            sleep(9000)
            waitForLoading()
            sleep(2000)
        end
    end
end

--�Ӹ����ſڽ���
function dugeonOutToIn()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-11916.2,-1207.7)--����ڸ����ſ�
    if mapDistance <= 10 and mapDistance > 0 then 
        prints("��ʼ�Ӹ����ſڵ�������")
        moveA(-11916.2,-1207.7,92.2612)
        moveA(-11916.4,-1219.35,92.2612)
        openGate("�������������")
        prints("���������������ʼ")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("��������������ɹ�")
    end
end

function sellJunks()
    ID1,ID2 = getClosetTargetIDFilterName("ά����",3,8)
    contactTarget(ID1,ID2)
    sleep(1000)
    useLua("/run RepairAllItems()")
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
    useLua("/click MerchantFrameCloseButton")
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

function pickUp() 
    if getGlobalFlag() ~= 1 then
        return 0
    end
    printd("��ʼʰȡ��%d",getNumOfCanBeLootUnit())
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 do -- ѭ��n�Σ�mld�����кܶ�֣�
        local n = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        if(n > 0) then --�����������4���Ӿ�ʰȡ
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --�������Ŀ��Ա�ʰȡ�Ĺ���
            if ID1 ~= 0 and ID1 ~= -1 then --֤���������˹���
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --���Ŀ������ҵľ���
                if distance < 20 and distance >= 0 then -- �����8�뷶Χ�ڣ���ֹȥʰȡ̫Զ��Ŀ�꣬Ȼ�󱻿�ס
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
    putMailMoney(500)
    sendMail()--�����ʼ�
    useLua("/click MailFrameCloseButton")
    sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
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

--���취����ʯ
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("����ħ����ʯ")
    if isItemExist(5513) == 0 then
        castSpellA("����ħ�����")
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
        return 0
    end
    prints("��BUFf")
    sleep(1500)
    castSpellA("�����ǻ�")
    sleep(1500)
    castSpellA("������")
    sleep(1000)
end

--��������
function openGate(name)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��������:"..name)
    local ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
    standBy()
    local time = getThreadTime()
    --�ж����Ƿ�Ϊ����״̬
    while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
        ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
        contactTarget(ID1,ID2)
        sleep(1000)
    end
end


--��������Ŀ��
function silenceTarget(name,target_x,target_y)
    prints("��������:%s",name)
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    chooseTarget(ID1,ID2)
    castSpellA("��������")
    sleep(100)
end

--����ѩ����
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    standBy()
    printf("����ѩ:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("����ѩ".."(�ȼ� "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end


--�ͷŶ�
function castShilds()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    -- ��û��CDʱ�ͷŶ�
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        prints("û�ж�,�϶�")
        castSpellA("��������")
        return
    end
    --��û�У��ͼ��亮������
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        prints("û�жܲ���CD��,�����϶�")
        castSpellA("������ȴ")
        sleep(50)
        castSpellA("��������")
    end
end

--������
function battleDistanceCheck(time,state)
    for i = 1, 40, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 15 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z-r_z) < 10 then
                prints("%s ���ڽӽ����ر�",name)
                printf("1����z����� = %f",math.abs(z-r_z))
                return
            elseif state == 0 and math.abs(z-r_z) > 17 then
                prints("%s ���ڽӽ����ر�",name)
                printf("0����z����� = %f",math.abs(z-r_z))
                return
            end
        end
        sleep(time/4)
    end
end


--����ԭ��FLy�޸�
function battleFly(x,y,z,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local _,_,r_z = getRolePosition()
    if math.abs(z-r_z) > 2 then
        moveF(x,y,z,state)
        unableWallThrough()
    else
        moveA(x,y,z)
    end
end


function battle()
    prints("��ʼ��ʽս��")
    moveF(-11710.1,-1501.17,43.2902,1)
    --���������һ��
    storm(1,-11743.4,-1497.48,40.6609)
    battleDistanceCheck(600,1)
    storm(1,-11738.5,-1493.95,43.606)
    battleDistanceCheck(800,1)
    storm(1,-11733.8,-1490.8,40.4841)
    battleDistanceCheck(200,1)
    battleFly(-11710.4,-1505.82,43.2284,0)
    storm(1,-11743.4,-1497.48,40.6609,350)
    battleDistanceCheck(800,0)
    local flag = getRoleflag1()
    printp("��ǰս��״̬��%p",flag)
    while getNumOfInBattleUnit() ~= 0 and flag == 0x08 and flag ~= 0x04  and getGlobalFlag() == 1 do

        useLua("/use 13")
        useLua("/use 14")
        battleFly(-11710.1,-1501.17,43.2902,0)
        stormWhenInbattle(-11738.5,-1493.95,43.606,400,1)
        battleFly(-11710.4,-1505.82,43.2284,0)
        if getRoleCurrentMP() <= 40 and getSpellCoolDown(12051) == 1 then
            castSpellA("����")
            battleDistanceCheck(600,0)
        else
            stormWhenInbattle(-11743.4,-1497.48,40.6609,400,0)
        end
        if getRoleCurrentHP() <= 50  then
            castShilds()
        end
        flag = getRoleflag1()
        flag = getRoleflag1()
    end
    printp("��ǰս��״̬��%p",flag)
end



--��ս������ѩ(��Ŀ�꿿��ʱ�Ż������ѩ)state = ���ڻ������� 1 = ����
function stormWhenInbattle(x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --��Ѫ���
    if  getRoleCurrentHP() <= 70 then
        useItem("��Ч����ҩˮ")
    end
    --�����������xx%��ʹ����������ѩ,������ҵĵ�ǰ�ȼ�
    local stormLevelCheck = 0
    if getRoleLevel() == 57 and getRoleCurrentMP() >= 50 then
        stormLevelCheck = 1
    elseif getRoleLevel() > 57  and getRoleCurrentMP() >= 25  then
        stormLevelCheck = 1
    end
    if stormLevelCheck == 1 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --ѭ�������ӳ��жϣ�������ܱ���ϣ����ͷ�һ������ѩ����
    local stormTime = getThreadTime()
    for i = 1, 40, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - stormTime) > 8 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= maxStormID and spellID ~= 0xCD and spellID ~= 0x0A and i > 10 and i < 30 then
            storm(1,x,y,z)
        else
            sleep(time/2)
        end
        local _,_,_,_,z1,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 15 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z1-r_z) < 10 then
                prints("%s ���ڽӽ����ر�",name)
                printf("1����z����� = %f",math.abs(z1-r_z))
                return
            elseif state == 0 and math.abs(z1-r_z) > 17 then
                prints("%s ���ڽӽ����ر�",name)
                printf("0����z����� = %f",math.abs(z1-r_z))
                return
            end
        end
    end
    printd("����ѩʱ��:%d",getThreadTime() - stormTime)
    --�Ա�ʯ

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
    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�������")
        useItem("���ʷ���ҩˮ")
        return
    end

end

--�ȴ���15���ӣ���ֹ����
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end

    prints("��ʼ�ȴ���ֹ������15����,���ڣ�%ss",getThreadTime())
    --��ʼ����ʱ�䣬����ˢ��15���ӣ���Ȼ����
    while getThreadTime() < waitTime*60 and getGlobalFlag() == 1  do
        sleep(5000)
        prints("ʣ��ȴ�:%ss",waitTime*60-getThreadTime())
    end
    prints("�������ȴ�����")
end

function main()
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
        prints("\n��Ҫ�ȼ�:59\n��ʼ�ص�:�����ȸ���ķ���õ�,��������\n¯ʯ�ص�:�����ȸ���ķ��\n��׼ˢ���츳\n ��Ҫ�̹�\n��ҪЬ���ƶ��ٶȸ�ħ\n��Ҫ������������װ��(�÷�,ҹ��)")
        stoneToDugeon()
        dugeonOutToIn()
        dugeonToStone()
        stoneToDugeon()
        --�ű���ʽ��ʼ
        prints("�ű���ʽ��ʼ")
        destroyJunks()
        drink()
        magicStone()      
        drink()
        castBuffs()
        drink()
        enableClimb()
        moveA(-11916.7,-1246.61,92.5351)
        moveA(-11916.7,-1256.58,92.5416)
        moveA(-11899.7,-1257.65,85.3841)
        moveA(-11904.6,-1258.16,85.3841)
        moveA(-11905.3,-1246.27,109.433)
        mountUp()
        moveF(-11904.4,-1246.46,111.069,1)
        unableClimb()
        moveA(-11870.4,-1281.58,110.55)
        moveA(-11834,-1332.94,109.88)
        moveA(-11815.6,-1365.01,109.494)
        moveA(-11803.4,-1388.78,109.206) 
        moveA(-11789.5,-1417.06,108.871)   
        moveF(-11796.1,-1427.59,33.3976,0)
        castShilds()
        sleep(1500)
        --��ѩ��һ������
        storm(1,-11785.1,-1408.72,12.5907)
        sleep(1000)
        moveF(-11855.5,-1496.81,32.2118,0)
        --��ѩ��2������
        sleep(200)
        storm(1,-11828.2,-1496.68,11.2276)
        sleep(1000)
        moveF(-11876.5,-1508.44,32.132,1)
        --��3��������
        silenceTarget("����",-11894.5,-1495.56)
        moveA(-11913,-1565.53,32.0221)
        moveF(-11913,-1565.53,43.2782,0)
        moveF(-11873.7,-1629.34,46.4913,1)
        moveF(-11877.3,-1673.88,46.0136,1)
        moveF(-11877.3,-1673.88,63.8584,1)
        moveA(-11874.6,-1695.31,46.2955)
        moveF(-11905.2,-1744.63,63.0842,1)
        moveF(-11901.2,-1771.43,63.8239,1)
        moveA(-11832.2,-1768.32,63.1088)
        moveF(-11753,-1784.1,63.2719,1)
        moveA(-11699.4,-1770.21,63.273)
        moveA(-11720.8,-1729.43,60.9604)
        moveA(-11698.5,-1715.04,63.5538)
        moveA(-11698.2,-1650.77,63.5366)
        sleep(1000)
        moveA(-11699,-1642.9,63.7982,1)
        moveA(-11702.7,-1576.3,63.9725,1)
        castSpellA("��ʦ����")
        moveA(-11702.4,-1537.09,63.1255)
        moveA(-11729.3,-1503.37,40.4667)
        castSpellA("��������")
        sleep(500)

        battle()
        moveF(-11741.7,-1491.11,42.8837)
        pickUp()
        mountUp()
        moveA(-11757.4,-1475.93,42.0385)
        moveA(-11827.7,-1379.15,40.7903)
        moveF(-11827.7,-1379.15,109.581,1)
        moveA(-11916.8,-1269.74,108.042)
        moveA(-11917,-1258.01,107.906)
        sleep(1000)
        --�رշ�����һ��
        unableFly()
        unableWallThrough()
        jumpB()
        moveA(-11916.8,-1234.53,92.5338)
        wait()
        prints("�����������ʼ����")
        moveB(-11916.6,-1228.12,92.5353)
        moveB(-11916.6,-1228.12,92.5353)
        waitForLoadingPosition(-11916.6,-1228.12,92.5353)
        prints("��������������ɹ�")
        sleep(2000)
        useLua("/run ResetInstances()") --����
        sleep(1000)
        prints("�������óɹ�")   
    else
        --������ǽ
        unableFly()
        unableWallThrough()
        enableClimb()
        moveA(-11517.7,-243.994,30.8086)
        moveA(-11519.5,-305.782,38.3364)
        moveA(-11560.7,-344.725,39.9673)
        moveA(-11606.9,-396.388,18.6466)
        moveA(-11650.1,-453.555,21.1574)
        moveA(-11675.8,-490.45,21.1338)
        moveA(-11698.2,-522.538,24.9601)
        moveA(-11717.7,-550.556,47.1129)
        moveA(-11740.8,-564.99,42.6027)
        moveA(-11757.1,-623.674,37.0155)
        moveA(-11772.9,-684.938,36.9134)
        moveA(-11788,-740.26,38.0435)
        moveA(-11829.2,-782.46,36.1628)
        moveA(-11860.9,-827.802,33.3895)
        moveA(-11888,-861.42,35.6195)
        moveA(-11910.3,-889.012,33.2024)
        moveA(-11916.4,-946.946,53.7693)
        moveA(-11912.5,-982.787,66.1638)
        moveA(-11911.5,-1048.73,69.8083)
        moveA(-11912.5,-1080.53,77.2801)
        moveA(-11913.6,-1117.16,77.2801)
        moveA(-11915.3,-1169.84,85.0092)
        moveA(-11916.4,-1203.77,92.2888)
        unableClimb()
        prints("��ʬ���������������ʼ")
        moveB(-11916.4,-1237.24,92.2888)
        waitForLoadingPosition(-11916.4,-1237.24,92.2888)
        prints("��ʬ��������������ɹ�")
    end
end



main()

