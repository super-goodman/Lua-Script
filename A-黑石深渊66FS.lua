maxStormLevel = 7  --��ǰ��󱩷�ѩ�ȼ�
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
waitTime = 15 --����ʱ������

--����������ƷID
doNotSellItems = {[1705]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--�����ʼĵ���ƷID
doNotMailItems = {[17031]=true,[17032]=true}
--��Ҫ���ٵ���������
mustDestroyItemNum = 6
--��Ҫ���ٵ���Ʒ��ID
mustDestroyItem = {[1]=11734,[2]=11732,[3] = 11754,[4] = 11737,[5] = 22044,[6] = 11733}





--�ű�����(��)
initialMoney = 0

--��д���ƶ����������ڽ������״̬
function moveT(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end   
    local roleX,roleY,roleZ = getRolePosition()
    local time = getThreadTime()
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getThreadTime() - time) < 50 and getDistanceBetween(roleX,roleY,x,y) > 2  do
        moveB(x,y,z)
        sleep(40)
        if IsBuffExist(14030) == 1 then
            castSpellA("������")
        end
        roleX,roleY,roleZ = getRolePosition()
    end
end

function mount()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    mountUp()
end

--˹ͨ�ɵµ�����
function wildToRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-10468.2,-3331.48)--���������
    if mapDistance <= 100 and mapDistance > 0 then 
        prints("��˹ͨ�ɵ·ɻ�����")
        moveA(-10468.2,-3330.39,25.4716)
        moveA(-10457.4,-3313.91,20.9642)
        moveA(-10441.6,-3289.82,20.1791)
        moveA(-10457,-3280.39,21.3375)
        --����ɻ�
        ID1,ID2 = getClosetTargetIDFilterName("����",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ��򿪷ɻ�����
        useLua("/click GossipTitleButton1")
        sleep(3000) --�ȴ��򿪷ɻ�����
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        prints("���ֶ����һ��ɪ������,���û��,��رպ�����ǰ��")
        while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 do
            roleX,roleY,roleZ = getRolePosition()
            mapDistance = getDistanceBetween(roleX,roleY,-6554.93,-1100.05)--���������
            printd("�����У�����Ŀ�ĵأ�%d",mapDistance)
            if mapDistance <= 10  then
                printd("����Ŀ�ĵص���")
                break
            end
            sleep(20000)
        end
        sleep(3000)
        mountUp()
        moveA(-6522.97,-1107.71,311.083)
        moveA(-6496.83,-1141.24,307.127)
        moveA(-6518.54,-1180.41,309.334)

    end
end

--���������
function dugeonOutToIn()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-7178.58,-921.016)--����ڸ�����
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("�����⿪ʼ���븱��")
        moveB(-7178.26,-927.956,166.845)
        waitForLoadingPosition(-7178.26,-927.956,166.845)
        prints("������ɹ����븱��")
    end
end

--����������
function repaireToDugeon()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-6521.95,-1183.29)--���������
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("��ʼ����������")
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
        rotateB(1.04)
        sleep(100)
        enableClimb()
        moveA( -6513.33,-1176.57,309.24)
        moveA(-6490.37,-1129.02,306.218)
        moveA(-6482.99,-1101.47,301.293)
        moveA(-6502.37,-1075.77,292.338)
        moveA(-6586.24,-1055.31,262.785)
        moveA(-6752.46,-1036.49,240.226)
        moveA(-6861.56,-1030.84,242.625)
        moveA(-6944.64,-1024.49,241.668)
        moveA(-7057.29,-965.264,260.145)
        moveA(-7179.91,-922.851,266.327)
        unableClimb()
        moveF(-7179.91,-922.851,170.225,0)
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(1000)
        prints("��ʼ���븱��")
        moveB(-7178.26,-927.956,166.845)
        waitForLoadingPosition(-7178.26,-927.956,166.845)
        prints("�ɹ����븱��")

    end
end

--�����⵽����
function dugeonToRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,456.929,34.0923)--����ڸ������ſ�
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --���װ�����˻��߱������˻س�����
            prints("����ʼ����")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("��������ɹ�")
        end
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,-7178.26,-927.956)--����ڸ������ſ�
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --���װ�����˻��߱������˻س�����
            prints("��ʼ�Ӹ����⵽����")
            moveF(-7178.36,-923.692,280.92,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(3000)
            mount()
            enableClimb()
            moveA(-7020.08,-986.74,246.984)
            moveA(-6871.69,-1059.63,246.24)
            moveA(-6808.48,-1107.05,243.419)
            moveA(-6661.69,-1184.71,242.928)
    
            moveA(-6583.4,-1153.13,278.42)
            moveA(-6538.25,-1167.97,309.28)
            moveA(-6515.8,-1178.61,309.305)
            moveA(-6521.79,-1186.61,309.256)
            unableClimb()

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





--������ʥ��ǰ���ʼ�
function dugeonToMail()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,456.929,34.0923)--����ڸ������ſ�
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        headDuration = getEquipementDurationBySlotNum(1)
        if  headDuration <= 30 then --���װ�����˻��߱������˻س�����
            prints("���俪ʼ����")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("��������ɹ�")
        end
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,-7178.26,-927.956)--����ڸ������ſ�
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        if isItemExist(11736) == 1 or getMoney() >= 300 then
            prints("��ʼ�Ӹ����⵽����")
            moveF(-7178.36,-923.692,280.92,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(3000)
            mount()
            enableClimb()
            moveA(-7177.17,-1080.68,241.574)
            moveA(-7179.58,-1242.7,246.795)
            moveA(-7120.82,-1371.16,241.615)
            moveA(-7013.84,-1516.53,244.19)
            moveA(-6938.31,-1743.29,240.744)
            moveA(-6901.41,-1840.05,246.067)
            moveA(-6935.02,-1983.83,282.478)
            moveA(-6946.59,-2068.46,282.478)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6854.62,-2198.92,252.99)
            moveA(-6785.02,-2201.08,244.127)
            moveA(-6696.81,-2171.4,244.144)
            moveA(-6675.58,-2152.91,244.195)
            --����
            ID1,ID2 = getClosetTargetIDFilterName("˹����",3,8)
            contactTarget(ID1,ID2)
            sleep(2000) --�ȴ����������
            contactTarget(ID1,ID2)
            useLua("/click GossipTitleButton3")
            sleep(1000)
            useLua("/run RepairAllItems()")
            sleep(3000)
            useLua("/click MerchantFrameCloseButton")
            sleep(100)
            moveA(-6687.29,-2171.95,244.144)
            moveA(-6675.77,-2175.45,244.157)
            --�ʼ�
            mail()
            moveA(-6687.29,-2171.95,244.144)
            moveA(-6696.81,-2171.4,244.144)
            moveA(-6785.02,-2201.08,244.127)
            moveA(-6854.62,-2198.92,252.99)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6906.67,-2180.37,259.503)
            moveA(-6946.59,-2068.46,282.478)
            moveA(-6935.02,-1983.83,282.478)
            moveA(-6901.41,-1840.05,246.067)
            moveA(-6938.31,-1743.29,240.744)
            moveA(-7013.84,-1516.53,244.19)
            moveA(-7120.82,-1371.16,241.615)
            moveA(-7179.58,-1242.7,246.795)
            moveA(-7177.17,-1080.68,241.574)
            moveA(-7178.36,-923.692,280.92)
            unableClimb()
            moveF(-7179.91,-922.851,170.225,0)
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(1000)
            prints("���俪ʼ���븱��")
            moveB(-7178.26,-927.956,166.845)
            waitForLoadingPosition(-7178.26,-927.956,166.845)
            prints("����ɹ����븱��")  
        end
    end
end
--dugeonToMail()


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


--��������

function  sellJunks()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ����")
    ID1,ID2,x,y,z = getClosetTargetIDFilterName("������",3,8)
    moveA(x,y,z)
    contactTarget(ID1,ID2)
    sleep(2000) 
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
        return 0
    end
    prints("��BUFf")
    sleep(1000)
    castSpellA("�����ǻ�")
    sleep(1500)
    castSpellA("������")
    sleep(1000)
end


--��ǹ��Ŀ��
function iceLenceTarget(name,target_x,target_y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ǹ��Ŀ��:%s",name)
    local ID1,ID2,x,y = getClosetTargetIDToAPositionFilterName(name,target_x,target_y,3)
    --local player_x,player_y = getRolePosition()
    --local rotation = getface(x,y,player_x,player_y)
    chooseTarget(ID1,ID2)
    sleep(200)
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

--����ѩ����
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    standBy()
    printf("����ѩ����:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("����ѩ".."(�ȼ� "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end

--����ѩ�۹�
function keepTargetTogether(target_x,target_y,target_z)
    printf("��ʼ�ſڱ���ѩ�۹�:%f,%f,%f",target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --���㳡�ļ๤
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("���",470.643,-92.9271,3)
    chooseTarget(ID1,ID2)
    castSpellA("�ٻ�ˮԪ��")
    sleep(600)
    useLua("/petattack")
    sleep(2000)
    storm(1,target_x,target_y,target_z)
    for i = 1, 20, 1 do
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(380)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 7 then
            prints("%s ���ڽӽ����ر�",name)
            break
        end
    end
    storm(1,  545.317,-65.4708,-62.4661)
    for i = 1, 10, 1 do
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(200)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 7 then
            prints("%s ���ڽӽ����ر�",name)
            break
        end
    end
    useLua("/run PetDismiss()")
end

--����ԭ��FLy�޸�
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


--��һ�ξ۹�ս��
function battle1()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ��һ��ѭ���۹�ս��")
    battleFly(627.993,-66.9434,-43.4235,0)
    storm(1,596.665,-62.4957,-52.0746)
    sleep(5000) 
    for i = 1, 2, 1 do
        if getGlobalFlag() ~= 1 then
            return 0
        end
        rotateB(4.79076)
        battleFly(632.091,-74.9228,-41.9433,0)
        storm(maxStormLevel,601.185,-79.9312,-44.0048)
        for i = 1, 20, 1 do
            local spellID = getRoleCurrentSpellID()
            --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
            if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
                storm(1,x,y,z)
            else
                sleep(320)
            end
            local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance > 0 and distance < 7 then
                prints("%s ���ڽӽ����ر�",name)
                break
            end
        end
        rotateB(1.59811)
        battleFly(631.327,-66.9412,-42.8821,1)
        for i = 1, 6, 1 do
            castShilds()
            sleep(1000)
        end

    end
    rotateB(4.79076)
    battleFly(632.091,-74.9228,-41.9433,0)
    storm(maxStormLevel,601.185,-79.9312,-44.0048)
    sleep(6000) 
    castShilds()

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
    --û�ж��ñ���Ѫ��
    if (getSpellCoolDown(12472) == 0 and IsBuffExist(maxShieldID) == 0) or (getSpellCoolDown(maxFireShieldID) == 0 and IsBuffExist(maxFireShieldID) == 0) == 0 then
        castSpellB("����Ѫ��")
    end 
    --�����������50%��ʹ����������ѩ
    if getRoleCurrentMP() >= 20 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --ѭ�������ӳ��жϣ�������ܱ���ϣ����ͷ�һ������ѩ����
    local time = getThreadTime()
    for i = 1, 20, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - time) > 7.5 then
            break
        end
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 5 and i < 15 then
            storm(1,x,y,z)
        else
            sleep(time)
        end
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 14 then
            local r_x,r_y,r_z = getRolePosition()
            if state == 1 and math.abs(z-r_z) < 6 then
                prints("%s ���ڽӽ����ر�",name)
                printf("z����� = %f",math.abs(z-r_z))
                break
            elseif state == 0 and math.abs(z-r_z) > 10 then
                prints("%s ���ڽӽ����ر�",name)
                printf("z����� = %f",math.abs(z-r_z))
                break
            end
        end
    end
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

--�ͷŶ�
function castShilds()
    local count = 0
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    local fireShiledBuffState = IsBuffExist(maxFireShieldID)
    local fireShiledCoolDownState = getSpellCoolDown(maxFireShieldID)
    -- ��û��CDʱ�ͷŶ�
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        castSpellA("��������")
        return
    end
    -- ���û��CDʱ�ͷŶ�
    if fireShiledBuffState == 0 and  fireShiledCoolDownState == 1 and getRoleCurrentMP() >45 then
        castSpellA("����������")
    end
    --��û�У��ͼ��亮������
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        castSpellA("������ȴ")
        sleep(50)
        castSpellA("��������")
    end
end

--�ȴ���ս
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if getRoleflag1() ~= 0x00 and getRoleflag1() ~= 0x04 then
        --ǰ����ս��
        moveA(644.319,-62.2487,-42.43)
        moveF(642.47,-78.6685,-45.6846,1)
        local time = getThreadTime()
        prints("��ʼ�ȴ���ս")
        while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
            sleep(1000)
        end
        prints("��ս�ɹ�,�ȴ�������ʧ")
    end
end

--��ʽս��
function battle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    for i = 1, 8, 1 do
        castShilds()
        sleep(1000)
    end
    prints("��ʼ��ʽս��")
    printd("ʣ����%d",getNumOfInBattleUnit())
    printd("��ʰȡ��%d",getNumOfCanBeLootUnit())
    rotateB(4.79076)
    castShilds()
    battleFly(605.81,-67.2953,-43.16,0)
    castSpellB("����Ѫ��")
    stormWhenInbattle(629.034,-59.8755,-45.9641,350,1)
    stormWhenInbattle(632.186,-67.4766,-45.9368,200,1)
    --�ܵ���
    rotateB(1.59811)
    battleFly(606.028,-62.129,-43.2694,0)
    --�ȴ�
    for i = 1, 9, 1 do
        castShilds()
        sleep(1000)
    end
    --�����ս��
    printd("flag1 = %d",getRoleflag1())
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and  getGlobalFlag() == 1 do
        --�ܵ���
        --����Ʒ
        castShilds()
        sleep(1000)
        castShilds()  
        rotateB(4.79076)
        battleFly(605.81,-67.2953,-43.16,0)
        useLua("/use 13")
        useLua("/use 14")
        stormWhenInbattle(629.034,-59.8755,-45.9641,300,1)
        stormWhenInbattle(632.186,-67.4766,-45.9368,350,1)
        local numOfInBattleUnits =  getNumOfInDistanceInBattleUnit(632.186,-67.4766,20)
        printd("��Ŀ��㿿�������� = %d",numOfInBattleUnits)
        if numOfInBattleUnits <= 0 and numOfInBattleUnits ~= -1 then
            break
        end

        --�ܵ���
        rotateB(1.59811)
        battleFly(606.028,-62.129,-43.2694,0)
        if getRoleCurrentHP() < 70 then
            castShilds()
        end
        --���ѻ���
        if getRoleCurrentMP() <= 30 and getSpellCoolDown(12051) == 1 then
            castSpellB("����Ѫ��")
            sleep(50)
            castSpellA("����")
            sleep(7800)
        else
            stormWhenInbattle(624.817,-51.9445,-45.4766,350,0)
        end 
        printd("ʣ����%d",getNumOfInBattleUnit())
        printd("��ʰȡ��%d",getNumOfCanBeLootUnit())
    end    
    printd("flag1 = %d",getRoleflag1())
    prints("��ʽս������") 
end

--�ȴ���13���ӣ���ֹ����
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
    prints("�ű����ȴ�����")
end

--��Ŀ�껥��
function contact(name,x,y)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��������:"..name)
    if x == 0 then
        local ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
        standBy()
        local time = getThreadTime()
        --�ж����Ƿ�Ϊ����״̬
        while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
            sleep(200)
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
            contactTarget(ID1,ID2)
        end
    else
        ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDToAPositionFilterName(name,x,y,6)
        standBy()
        time = getThreadTime()
        --�ж����Ƿ�Ϊ����״̬
        while flag1 == 1 and getGlobalFlag() == 1 and (getThreadTime() - time) < 50 do
            sleep(200)
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDToAPositionFilterName(name,x,y,6)
            contactTarget(ID1,ID2)
        end
    end

end

--�����������
function OpenTreasure(x,y,z,x1,y1)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if isItemExist(11078) == 0 then
        prints("Կ�ײ���")
        return
    end
    moveA(x,y,z)
    standBy()
    contact("�������",x1,y1)
    sleep(10)
    contact("���ﱦ��",x1,y1)
    sleep(100)
    useLua("/click StaticPopup1Button1")
    sleep(100)
    useItem("һС��Ǯ��")
    useItem("һ����ʯ")
    useItem("һ���Ǯ��")
    sleep(500)
    useItem("һС��Ǯ��")
    useItem("һ����ʯ")
    useItem("һ���Ǯ��")
end

--�����б���
function OpenTreasures()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ�������б���:")
    OpenTreasure(812.893,-333.221,-46.1247,809.755,-330.136)
    OpenTreasure(807.132,-336.698,-50.1911,805.925,-334.683)
    OpenTreasure(802.904,-340.635,-50.1939,801.213,-338.7)
    OpenTreasure(798.181,-345.348,-50.1969,796.685,-343.078)
    OpenTreasure(799.29,-348.606,-50.1969,796.192,-350.051)
    OpenTreasure(803.493,-353.352,-50.1983,800.483,-354.597)
    OpenTreasure(808.515,-358.651,-50.1983,806.057,-359.328)
    OpenTreasure(812.387,-362.61,-50.1983,810.36,-363.677)
    OpenTreasure(816.498,-362.112,-50.1914,817.078,-364.37)
    OpenTreasure(820.76,-357.835,-50.1835,821.335,-360.367)
    OpenTreasure(825.415,-353.586,-50.1741,826.046,-356.051)
    for i = 1, 5, 1 do
        useItem("һС��Ǯ��")
        useItem("һ���Ǯ��")
        useItem("һ����ʯ")
        sleep(500)
    end
end

--С�Ž�����
function tellOtherInOrOut(state)
    if isInPartyOrGroup() == 1 then
        useLua("/party follow"..state) --��С�ų���
    end
end


function main()
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
        prints("\n��Ҫ�ȼ�:66\n��ʼ�ص�:˹ͨ�ɵ�(��Ҫ������ʾ�ֶ�����ɻ�����ͨɪ�����ڷɻ�),ɪ����������,�������� \n������Ҫ:��׼ˢ���츳,��Ҫ���,�������ˮ����,��Ҫ�̹�\n��ҪЬ���ƶ��ٶȸ�ħ\n��Ҫ������������װ��(�÷�,ҹ��)")
        --��ʼ׼������
        prints("��ʼ׼������")
        wildToRepaire()
        dugeonToMail()
        dugeonToRepaire()
        dugeonOutToIn()
        repaireToDugeon()
        --����
        tellOtherInOrOut(1)
        initialMoney = getMoney()
        castSpellA("��������")
        destroyJunks()
        drink()
        magicStone()      
        drink()
        prints("�ű���ʼ")
        moveF(457.943,28.7849,-26.3027,0)
        --���￪ʼ�ص�
        moveA(496.657,-2.78235,-26.3027)
        moveA(556.776,-51.7217,-26.9178)
        moveA(614.427,-98.652,-26.3027)
        moveA(675.796,-148.608,-26.3027)
        moveF(680.877,-152.746,-42.5316)
        --��ʼ�Ժȣ���buff
        drink()
        --��BUFF
        castBuffs()
        drink()
        --����
        tellOtherInOrOut(1)
        castSpellA("��������")
        moveA(677.806,-146.413,-42.5316)
        --����ѩ����һ����(��¯����)
        storm(1,690.92,-137.15,-44.4085)
        sleep(1000)
        moveA(659.351,-129.041,-43.2007)
        --����ѩ���ڶ�����(��¯���������ܿ��Ժ���)
        storm(1,665.305,-137.18,-45.4541)
        sleep(1000)
        moveF(656.652,-93.2556,-39.0511,0)
        moveA(625.258,-90.2843,-39.7489)
        --����ѩ�����ֱ�����2ֻ��
        storm(1,622.965,-115.167,-46.1644)
        sleep(1000)
        --����ѩ�����ֱ�˫��Ԫ�ع�
        storm(1,632.025,-78.5422,-45.7834)
        sleep(1200)

        moveA(597.777,-83.8746,-38.5254)
        --����ѩ������ſڹ�(���ܿ��Ժ���)
        --storm(1,609.101,-95.7069,-45.8012)
        --sleep(1000)
        moveA(575.002,-71.8757,-38.8411)
        --�����������������
        silenceTarget("��ŭ��ʿ|��ŭ����",572.232,-100.672)
        --��ʼ��Ȧ���۹�
        moveF(559.516,-60.6503,-43.9753,0)
        --�رշ���
        unableFly() 
        unableWallThrough()
        moveA(574.873,-33.6352,-45.4673)
        moveA(614.986,-33.7919,-45.4673)
        moveA(627.328,-55.0291,-45.4814)
        castSpellA("��������")
        --�ȴ�0.5S
        --sleep(500)

        moveF(605.139,-60.5101,-44.8312,1)
        --��ʼ��ǹ����3����
        rotateB(2.17556)
        iceLenceTarget("��ŭ����|��ŭ��ʿ",591.911,-41.1126)
        sleep(100)
        rotateB(1.19382)
        iceLenceTarget("��ŭ����|��ŭ��ʿ",609.192,-44.7214)
        sleep(100)
        rotateB(0.12568)
        iceLenceTarget("��ŭ����|��ŭ��ʿ|������ʿ",626.792,-54.6729)
        sleep(200)
        rotateB(5.17556)
        --ǰ��������
        moveA(601.319,-159.027,-46.4656)
        castSpellA("��������")
        moveA(592.099,-171.647,-46.9109)
        --���ֵ����Ϻ��ӳ�100ms
        castSpellA("������")
        sleep(100)
        moveA(575.186,-184.311,-53.4699)
        moveF(533.923,-176.894,-52.8194,0)
        moveA(526.608,-228.654,-52.3738)
        --��Ԫ�أ��������������һ����
        storm(1,513.177,-209.735,-58.7221)
        sleep(1000)
        moveF(534.936,-229.718,-63.0521,0)
        moveA(537.541,-257.264,-63.8809)
        --����ѩ�����С��(���ܿ��Ժ���)
        storm(1,522.584,-244.441,-66.0279)
        sleep(1000)
        castSpellA("��������")
        moveF(536.255,-274.634,-75.8316,0)
        moveA(570.046,-295.46,-75.2908)
        moveA(596.649,-301.813,-74.7322)
        moveA(592.169,-285.044,-75.0575)
        --����ѩ����ǰ��С��(���ܿ��Ժ���)
        storm(1,598.679,-268.29,-82.6645)
        sleep(1000)
        castSpellA("��˪����")
        moveF(630.244,-300.706,-76.0419,0)
        moveA(642.197,-254.764,-76.7668)
        --����������ǰ���Ĺ�(���ܿ��Ժ���)
        silenceTarget("��ŭ����|��ŭ��ʿ",649.541,-239.049)
        moveA(657.344,-255.553,-72.0875)
        castSpellA("��������")
        moveF(665.854,-229.152,-68.9699,0)
        moveA(661.006,-213.68,-69.1038)
        moveA(664.055,-205.202,-69.2455)
        --��ǹ����ǰ(���ܿ��Ժ���)
        rotateB(2.17146)
        sleep(50)
        iceLenceTarget("��ŭ����|��ŭ��ʿ",652.448,-201.95)
        rotateB(0.958021)
        moveF(678.887,-177.845,-65.5016,0)
        moveA(660.959,-168.444,-66.4242)
        --����
        sleep(100)
        castSpellA("������")
        moveA(644.085,-152.145,-71.0924)
        --����
        castSpellA("��˪����")
        moveF(646.946,-129.596,-59.7906,0)
        moveA(611.929,-117.036,-54.7631)
        castSpellA("��������")
        moveA(588.923,-121.347,-59.2933)
        silenceTarget("��ŭ����|��ŭ��ʿ",591.492,-138.02)
        --����ѩ���(���ܿ��Ժ���)
        --storm(1,618.416,-126.343)
        --sleep(1000)
        --�����ſ�
        moveF(561.768,-46.5746,-54.1599,0)
        --׼������ѩ�۹�
        keepTargetTogether(540.897,-69.0214,-62.1275)
        moveT(594.791,-64.408,-54.7704)
        castSpellA("��ʦ����")
        moveA(605.75,-64.5632,-55.4874)
        --����
        sleep(200)
        castSpellA("������")
        moveF(638.628,-63.3514,-41.165,0)
        castSpellA("ħ������")
        moveA(631.649,-67.8431,-42.546)
        battle1()
        rotateB(4.79076)
        moveF(627.993,-66.9434,-43.4235,1)
        castShilds()
        sleep(1000)
        castSpellA("��������")
        sleep(2000)
        castSpellA("��������")
  
        prints("��һ�ξ۹ֽ�������ʼ��������һ��")
        castSpellA("��������")
        battle()
        waitForGetRidOfBattle()
        moveF(629.384,-60.4337,-42.5302)
        --����
        tellOtherInOrOut(2)
        --��ʼʰȡ
        pickUp() 
        moveF(626.61,-54.8915,-42.6237,0)
        pickUp() 
        if getRoleCurrentHP() < 20 then
            drink()
        end
        if getNumOfItem(11078) >= 12 then
            prints("��ʼǰ������")
            --ǰ������
            moveF(628.946,-57.3383,-21.1406)
            moveA(672.857,-123.155,-24.3728)
            moveA(713.251,-183.75,-26.8656)
            moveA(754.698,-245.924,-29.2743)
            moveA(803.197,-318.677,-31.8199)
            moveA(812.915,-335.063,-32.634)
            moveF(812.915,-335.063,-46.1247,0)

            unableFly()
            unableWallThrough()
            jumpB()
            sleep(2000)
            OpenTreasures()
            tellOtherInOrOut(2)
            --����ǰ���ư�
            prints("����ǰ���ư�")
            moveF(825.032,-353.936,-28.9064)
            moveA(843.439,-298.24,-30.6395)
            moveA(864.934,-235.145,-32.606)
        else
            moveF(628.946,-57.3383,-21.1406)
            moveA(672.857,-123.155,-24.3728)
        end
        moveF(884.044,-179.091,-42.542)
        sellJunks()
        destroyJunks()
        printd("�����ܼ�����G:%d",getMoney()-initialMoney+1)
        printd("�����ܼ�����G:%d",getMoney()-initialMoney+1)
        --��ʼ����
        moveF(783.612,-130.032,-41.9002,0)
        moveA(724.264,-101.112,-44.4169)
        moveA(656.531,-68.105,-46.5114)
        moveA(561.614,-21.8514,-49.5417)
        moveA(474.309,20.7891,-53.0545)
        moveA(458.231,28.6439,-53.7889)
        moveF(458.021,28.151,-65.1132,0)
        unableFly()
        unableWallThrough()
        wait()

        prints("��ʼ����")
        moveB(456.425,38.7342,-68.9003)
        waitForLoadingPosition(456.425,38.7342,-68.9003)
        prints("�����ɹ�")
        sleep(1000)
        useLua("/run ResetInstances()") --����
        sleep(1000)
        prints("�������óɹ�")   
        --����Ƿ���Ҫ����
        --dugeonToRepaire()
        prints("�ű�����")
        --׼����ʼս��
    else -- ������ϴ������״̬��Debuff(��������)
        -- ��������ʬ����
        -- 1.��ʬ����
        -- 2.����
        -- �������ű����Զ�ѭ���������ˢ�����̣�����һ��ѭ��
        prints("��ʼ��ʬ")
        unableFly()
        unableWallThrough()
        sleep(1000)
        enableClimb()
        moveA(-6482.99,-1101.47,301.293)
        moveA(-6502.37,-1075.77,292.338)
        moveA(-6586.24,-1055.31,262.785)
        moveA(-6752.46,-1036.49,240.226)
        moveA(-6861.56,-1030.84,242.625)
        moveA(-6944.64,-1024.49,241.668)
        moveA(-7057.29,-965.264,260.145)
        moveA(-7179.91,-922.851,250.327)
        unableClimb()
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(6000)
        moveF(-7180.15,-930.262,260.087,0)
        unableFly()
        unableWallThrough()
        jumpB()
        prints("������")
        waitForLoading()
        prints("�������ɹ�")

    end
end

main()
--battle()
--dugeonToRepaire()
--OpenTreasures()
