maxStormLevel = 3  --��ǰ��󱩷�ѩ�ȼ�
maxStormID = 0xEB  --��ǰ��󱩷�ѩ�ļ���ID 16���Ƶĺ�2λ
maxWaterLevel = 5 --���ˮ����ȼ�
maxBreadLevel = 5 --�����������ȼ�
maxLevelWaterName = "ħ����Ȫˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ����ĸ" --ʹ���������
maxLevelWaterCreatorID = 8077   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 8075   --ʹ�������ƷID
maxLevelWaterBUFFID =  1135     --ʹ��ˮBUFFID
maxLevelBreadBUFFID =  1129    --ʹ�����BUFFID

--�����ʼĵ���ƷID
doNotMailItems = {[17031]=true,[17032]=true,[13446]=true,[3928]=true}
--��Ҫ���ٵ���������
mustDestroyItemNum = 7
--��Ҫ���ٵ���Ʒ��ID
mustDestroyItem = {[1]=1520,[2]=1645,[3]=4421,[4]=4599,[5]=1520,[6]=9333,[7]=9334}

--�ű���������Ҫ�Ķ�
attractionTime = 500
--�����Ĵ���(44������)
attractionCount = 21
--�������ʬ������(44������)
maxBodyNum = 50 
maxStormMP = 70

if getRoleLevel() >= 44 then
    attractionTime = 300
    attractionCount = 21
    maxStormMP = 60
end

function dugeonOutToIn()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-6795.56,-2890.72)--����ڸ����ſ�
    if mapDistance <= 100 and mapDistance > 0 then 
        moveA(-6795.56,-2890.72,8.88742)
        prints("������ʼ")
        moveB(-6790.29,-2890.76,8.91156)
        waitForLoadingPosition(-6790.29,-2890.76,8.91156)
        prints("�����ɹ�")
    end

end

--¯ʯ��������
function stoneToDugeon()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-7159.27,-3841.75)--�����¯ʯ
    if mapDistance <= 100 and mapDistance > 0 then 
        ID1,ID2 = getClosetTargetIDFilterName("�õ��ϰ�",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ����������
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/click StaticPopup1Button1")
        sleep(1000)
        moveA(-7159.27,-3841.75,8.67293)
        moveA(-7160.78,-3840.72,8.66418)
        moveA(-7157.54,-3826.86,8.67816)
        mount()
        moveA(-7164.11,-3796.29,9.16674)
        moveA(-7168.76,-3766.95,8.3701)
        moveA(-7138.62,-3743.56,8.3758)
        moveA(-7146.07,-3721.92,8.49339)
        moveA(-7148.41,-3723.22,8.49339)
        --��װ��
        ID1,ID2 = getClosetTargetIDFilterName("���ֿ�",3,8)
        contactTarget(ID1,ID2)
        sleep(2000) --�ȴ����������
        contactTarget(ID1,ID2)
        useLua("/click GossipTitleButton5")
        useLua("/click GossipTitleButton3")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(3000)
        useLua("/click MerchantFrameCloseButton")
        moveA(-7146.2,-3722.33,8.49339)
        moveA(-7138.82,-3743.18,8.37814)
        moveA(-7122.22,-3761.2,8.77679)
        mount()
        moveA(-7112.37,-3772.8,8.45856)
        moveA(-7111.3,-3803.43,8.37107)
        moveA(-7154.41,-3828.43,8.72029)
        mail()
        moveA(-7148.61,-3820.1,8.46733)
        moveA(-7124.9,-3809.81,8.58982)
        moveA(-7100.04,-3798.56,8.38443)
        moveA(-7089.82,-3798.99,8.42238)
        moveA(-7059.57,-3769.71,10.3168)
        moveA(-7040.08,-3754.13,13.5474)
        moveA(-7023.66,-3740.08,21.7566)
        moveA(-7002.09,-3722.94,26.2471)
        moveA(-6996.04,-3718.37,28.1792)
        moveA(-6985.94,-3717.57,30.4315)
        moveA(-6953.94,-3717.43,42.9579)
        moveA(-6941.44,-3712.64,45.9253)
        enableClimb()
        moveA(-6919.67,-3698.21,59.7672)
        moveA(-6898.57,-3694.42,73.9134)
        moveA(-6885.57,-3677.49,85.9106)
        moveA(-6866.01,-3650.03,141.666)
        moveA(-6875.96,-3623.49,182.751)
        moveF(-6875.96,-3623.49,184.388,1)
        moveF(-6874.26,-3515.94,183.147,1)
        moveF(-6867.02,-3435.28,182.227,1)
        moveF(-6851.04,-3348.64,181.204,1)
        moveF(-6829.56,-3246.12,180.009,1)
        moveF(-6818.59,-3193.77,179.036,1)
        moveF(-6810.06,-3137.23,178.332,1)
        moveF(-6787.18,-3049.4,177.304,1)
        moveF(-6772.39,-3001.89,176.747,1)
        moveF(-6755.35,-2975.4,176.384,1)
        moveF(-6753.2,-2971.78,48.7121,1)
        moveF(-6765.39,-2954.18,36.4684,1)

        moveF(-6767.9,-2947.14,28.2135,1)
        enableClimb()
        moveF(-6773.98,-2929.58,27.99)
        sleep(1000)
        unableFly()
        unableWallThrough()
        unableClimb()
        jumpB()
        sleep(2000)
        prints("��ʼ¯ʯ����������")
        moveB(-6773.54,-2905.9,8.87742)
        waitForLoadingPosition(-6773.54,-2905.9,8.87742)
        prints("¯ʯ�����������ɹ�")
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
    setMailTargetName()--��д���֣������ڽű�������д
    sleep(200)
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
                    --ʶ�����¹�ϵ
                    local rx,ry,rz = getRolePosition()
                    if math.abs(z-rz) > 4 then
                        moveF(x,y,z)
                    else
                        moveB(x,y,z)
                    end
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

--���취����ʯ
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("����ħ��")
    if isItemExist(5513) == 0 then
        castSpellA("����ħ�����")
        sleep(3500)
    end
    if isItemExist(5514) == 0 then
        castSpellA("����ħ�����")
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
    castSpellA("��ʦ����")
    sleep(1000)
end

--����츳
function checkTalent()
    if getRoleLevel() <= 44 then
        useLua("/click TalentMicroButton")
        useLua("/click PlayerTalentFrameTalent12")
        useLua("/click PlayerTalentFrameTalent12")
        sleep(500)
        useLua("/click PlayerTalentFrameCloseButton")
    end
end

function mount()
    if getRoleLevel() >= 45 then
        mountUp()
    end
end

--�ȴ���ս
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if getRoleflag1() ~= 0x00 and getRoleflag1() ~= 0x04 then
        local time = getThreadTime()
        prints("��ʼ�ȴ���ս")
        while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
            sleep(1000)
        end
        prints("��ս�ɹ�,�ȴ�������ʧ")
    end
end


--����ѩ����
function storm(stormLevel,target_x,target_y,target_z)
    if getGlobalFlag() ~= 1 then
        return 0
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


--������
function battleDistanceCheck(time)
    for i = 1, 40, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 10 then
            prints("%s ���ڽӽ����ر�",name)
            return
        end
        sleep(time/40)
    end
end



--������ҽ��Ĺ���еĹ�
function attraction()
    local time = getThreadTime()
    local count = 0
    --�����ж��Ƿ�û����ô�ཀྵʬ
    local state  = 0
    local previousBodyNum  = 0
    while getGlobalFlag() == 1 and (getThreadTime() - time) <= attractionTime do
        if count >= attractionCount and getRoleLevel() < 44 then
            break
        end
        n = getNumOfFilterNameUnit(3,"���������")
        if n > maxBodyNum then
            break
        end
        local _, _, _, _, _, _, _, _,_, _, _, _, _, _, _,target = getClosetTargetIDFilterName("��ҽ",3)
        if target == 0 then
            if previousBodyNum - n == 0 then
                state  = state + 1
                if state >= 3 then
                    prints("û����ô�ཀྵʬ��,����")
                    return
                end
            end
            previousBodyNum = n
            count = count + 1
            storm(1,1909.14,1020.2,15)
            printd(string.format("��ʼ����Ĺ������:%d,��ǰ������%d,��໹ʣ��%d,��ʣʱ��:%d",count,n,maxBodyNum-n, attractionTime-(getThreadTime() - time)))
            target = 0
        end
        sleep(2000)
    end
    printd("����Ĺ�ؽ���:%d",count)
end


--��ս������ѩ level = 1����������,������1��
function stormWhenInbattle(level,x,y,z,time)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if getRoleCurrentMP2() <= 290 then
        for i = 1, 36, 1 do
            local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance >= 0 and distance < 14 then
                prints("û��%s ���ڽӽ����ر�",name)
                return
            end
            sleep(time/80)
        end
    end
    --��Ѫ���
    if  getRoleCurrentHP() <= 70 then
        useItem("��������ҩˮ")
    end
    if getRoleCurrentMP() >= maxStormMP and level == 1 then
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
        if spellID ~= maxStormID  and spellID ~= 0x0A and spellID ~= 0xC9 and i > 10 and i < 30 then
            storm(1,x,y,z)
        else
            sleep(time/40)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 12 then
            prints("%s ���ڽӽ����ر�",name)
            return
        end
    end
    printd("����ѩʱ��:%d",getThreadTime() - stormTime)
    --�Ա�ʯ

    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�������")
        useItem("ǿЧ����ҩˮ")
        useItem("���ʷ���ҩˮ")
        return
    end
    if isItemExist(5514) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�������")
        useItem("ǿЧ����ҩˮ")
        useItem("���ʷ���ҩˮ")
        return
    end
end

--ȥѰ��
function goForDeath()
    setGlobleVairable(1,1)
    printd("GlobleVairabl = %d",getGlobleVairable(1))
    moveA(1882.01,1015.6,24.2725)
    jumpDown()
    moveA(1912.17,1016.11,11.5156)
    sleep(10000)
end

function battle0()
    prints("��ʼ�۹�")
    moveA(1887.37,1046.47,22.3277)
    sleep(6000)
    moveA(1884.55,1042.87,22.2242)
    storm(1,1859.47,1055.52,9.2715)
    sleep(8000)
    moveA(1886.73,1045.92,20.7259)
    sleep(1000)
end

--�۹�
function battle1()
    prints("��ʼ�۹�")
    --��������µĵط�
    stormWhenInbattle(0,1894.06,1076.05,22.4715,7000)
    --���±�
    stormWhenInbattle(1,1895.91,1055.11,21.0716,8000)
    --����ߵ�������
    stormWhenInbattle(1,1901.8,1045.89,20.3359,8000)
    --�����
    stormWhenInbattle(0,1901.51,1041.29,20.6708,7000)
    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�������")
    end
    moveF(1871.71,1059.46,23.9281,1)
    battleFly(1867.79,1067.03,23.7941)
    --׼����ʽA��
end

--��ʽA��
function battle()
    prints("��ʼ��ʽA��")
    --�����ս��
    printd("flag1 = %d",getRoleflag1())
    while getRoleflag1() == 0x08 and getRoleflag1() ~= 0x00 and getGlobalFlag() == 1 do
        --վ�����̨�ӿ�ʼA
        --����
        if getRoleCurrentMP() <= 30 and getSpellCoolDown(12051) == 1 then
            standBy()
            sleep(100)
            castSpellA("����")
            battleDistanceCheck(7000)
        else
            --�����м�
            stormWhenInbattle(0,1898.27,1051.98,21.6791,8000)
            --�������
            stormWhenInbattle(1,1892,1063.77,21.4485,8000)
        end
        --ǰ���ұ�̨��
        battleFly(1871.53,1058.88,23.7941)
        --����
        if getRoleCurrentMP() <= 30 and getSpellCoolDown(12051) == 1 then
            standBy()
            sleep(100)
            castSpellA("����")
            battleDistanceCheck(8000)
        else
            --�����м�
            stormWhenInbattle(0,1897.42,1054.55,21.9381,8000)
            --����ߵ�������
            stormWhenInbattle(1,1901.8,1045.89,20.3359,8000)
            --�����
            stormWhenInbattle(0,1901.51,1041.29,20.6708,8000)

        end
        --���м�յ�
        battleFly(1871.97,1062.16,21.9742)
        --����ߵ�������
        stormWhenInbattle(1,1904.01,1046.51,24.2554,8000)
        --�����̨��
        battleFly(1867.79,1067.03,23.7941)

    end
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

function openCave()
    moveF(1911.18,1003.04,46.9646,1)
    moveA(1891.95,1036.2,45.8586)
    moveF(1892.41,1038.45,10.9824)
    jumpDown()
    enableClimb()
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1884.42,1039.21,8.87751)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1876.38,1042.77,8.87715)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1871,1045.45,9.83162)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1862.78,1050.16,9.04986)
    for i = 1, 8, 1 do
        quickContact("ǳĹѨ")
    end
    enableFly()
    enableWallThrough()
    moveA(1871.64,1057.74,9.03726)
    sleep(5000)
    waitForGetRidOfBattle()
    moveF(1871.64,1057.74,43.3946,1)
    --ȥ����
    moveA(1830.81,1023.49,41.3225)
    moveF(1841.32,1015.43,11.2541)
    jumpDown()
    moveA(1846.41,1022.37,9.08599)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1840.76,1026.56,9.23487)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1835.74,1032.99,9.22881)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1841.9,1040.82,9.39184)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    moveA(1844.17,1045.16,8.92421)
    for i = 1, 6, 1 do
        quickContact("ǳĹѨ")
    end
    enableFly()
    enableWallThrough()
    moveA(1835.01,1050.77,9.13761)
    sleep(5000)
    waitForGetRidOfBattle()
    moveF(1835.01,1050.77,43)
    moveA(1905.53,1005.48,42.7028)
    unableClimb()
end



function main()
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
      prints("\n��Ҫ�ȼ�:42\n��ʼ�ص�:¯ʯ,��������\n¯ʯ�ص�:�ӻ�ɭ���ܣ��ǵ�ȥ��45����ѧ�Ķ�ѧ��,�������Ч��\n�츳:�����ȵ������ڤ�룬�����˼����㣬ֱ�����������౩��ѩ���룬ʱ�䣬���ٶ�Ҫ��\n��Ҫ������������װ��(�÷�,ҹ��)\n�츳ͼ��https://github.com/super-goodman/Lua-Script/blob/main/README.md")
       stoneToDugeon()
        dugeonOutToIn()
        --����츳�����44���¾�ÿ�ν������һ��
        checkTalent()
        castBuffs()
        mount()
        moveA(1212.67,842.04,8.93346)
        moveA(1218.15,841.674,8.98997)
        moveF(1218.15,841.674,67.67,1)

        moveA(1271.16,837.084,68.7646)
        moveA(1382.26,829.02,66.2149)
        moveA(1484.53,839.904,63.8474)
        moveA(1622.3,869.903,60.6088)
        moveA(1704.79,895.726,58.632)
        moveF(1731.19,901.487,58.012)
        moveA(1759.38,909.268,57.3353)
        moveA(1853.35,971.205,54.7548)  
        moveF(1905.32,995.639,16.3926)
        --����Ƿ�����һ�Σ���ֹ�������ȥ����
        local n = getNumOfFilterNameUnit(3,"���������")
        if n == 0 then
            --��ʼ����boss
            moveA(1910.25,1011.12,18.2062)
            sleep(500)
            --��ʼ���
            moveA(1909.78,1001.45,18.0897)
            --���գ�׼������
        end
        moveF(1910.72,1003.45,29.8568,1) 
        jumpDown()
        waitForGetRidOfBattle()
        --��ȥ��ĹѨ
        if getRoleLevel() >= 44 and n == 0 then
            openCave()
        end 
        jumpDown()
        moveB(1910.58,1005.97,24.2104)
        sleep(2000) 
        --�ر��������ñ�־λ
        setGlobleVairable(1,0)
        --��ʼ����Ĺ�ص�С�֣�����4����
        attraction()
        --�ȴ���ս
        waitForGetRidOfBattle()
        sleep(2000) 
        --��ʼ��׼������
        drink()
        magicStone()
        drink()
        castBuffs()
        drink()
        --����׼�����ֿ���
        moveF(1905.32,995.639,48.7435,0) 
        moveA(1894.62,1042.11,47.8224)
        jumpDown()
        moveA(1886.73,1045.92,20.7259)
        sleep(200) 
        --��ʼ����(��һ��ѩ)
        storm(1,1897.8,1016.01,11)
        sleep(1200)
        --(�ڶ���ѩ)
        storm(1,1860.52,1046.22,8.87693)
        sleep(8000)
        jumpB()
        --�ȴ�һ��.���ܶ�����Ϊ��Ҳ�Ῠס
        sleep(8000)
        --������Ĺ�
        moveF(1867.4,1050.34,22.061,1)
        sleep(200)
        storm(1,1845.45,1029.66,9.07001)
        sleep(1000)
        battle0()
        moveA(1871.37,1059.72,20.6529)
        --��ʼ�۹�
        battle1()
        --׼����ʽA��
        battle()
        moveF(1898.43,1053.21,24.2308)
        pickUp() 
        sleep(1000)
        destroyJunks()
        goForDeath()
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
        local headDuration = getEquipementDurationBySlotNum(1)
        --��ñ���ʣ��ĸ�����Ŀ
        local unusedBag = getUnusedAllBagSlotNum()
        --���ͷ���;ô���20%���߰��ĸ���>10���ͼ���������Ĺ�ظ����װ�����ٳ���
        if headDuration >= 20 and unusedBag > 10 then
            moveA(-7189.22,-3940.99,9.14343)
            moveA(-7171.53,-3949.57,9.78582)
            moveA(-7105.19,-3850.91,9.09412)
            moveA(-7085.07,-3814.72,8.42323)
            moveA(-7076.18,-3751.25,8.7846)
            moveA(-7070.99,-3697.34,10.0018)
            moveA(-7052.8,-3643.66,17.1077)
            moveA(-7046.48,-3624.53,11.1828)
            moveA(-7023.01,-3539.44,9.98922)
            moveA(-6991.46,-3420.96,10.5901)
            moveA(-6980.67,-3380.48,11.0259)
            moveA(-6978.57,-3326.77,10.0284)
            moveA(-6977.9,-3274.67,8.99528)
            moveA(-6928.15,-3183.43,9.74122)
            moveA(-6894.26,-3121.95,8.68728)
            moveA(-6893.86,-3065.09,9.34692)
            moveA(-6875.37,-2994.51,9.78099)
            moveA(-6858.07,-2942.28,9.37534)
            moveA(-6847.51,-2911.16,8.87842)
            moveA(-6827.98,-2907.62,8.87842)
            moveA(-6795.43,-2890.62,8.88728)
            moveB(-6787.1,-2890.63,8.96244)
            prints("��ʼ��ʬ����")
            waitForLoadingPosition(-6787.1,-2890.63,8.96244)
            prints("��ʬ�����ɹ�")
        else
            --Ĺ�ظ�����װ��
            sleep(1000)
            ID1,ID2 = getClosetTargetIDFilterName("���",3,8)
            contactTarget(ID1,ID2)
            sleep(3000) --�ȴ��򿪽���1
            contactTarget(ID1,ID2)
            useLua("/click GossipTitleButton1")
            useLua("/click GossipTitleButton1")
            sleep(1000) --�ȴ��򿪽���2
            useLua("/click StaticPopup1Button1")
            useLua("/click StaticPopup1Button1")
            sleep(1000) --�ȴ��򿪽���3
            useLua("/click StaticPopup1Button1")
            useLua("/click StaticPopup1Button1")
            sleep(1000) --�ȴ�����
            mount()
            moveA(-7199.74,-3940.13,9.38273)
            moveA(-7190.79,-3934,9.25794)
            moveA(-7180.45,-3930.39,9.86625)
            moveA(-7169.72,-3924.71,9.0884)
            moveA(-7129.17,-3881.81,10.4179)
            moveA(-7112.61,-3863.09,8.9684)
            moveA(-7090.87,-3822.39,9.07322)

            moveA(-7085.7,-3800.24,8.43695)
            moveA(-7104.85,-3795.52,8.37024)
            moveA(-7110.05,-3781.4,8.40917)
            moveA(-7123.56,-3759.87,8.86716)
            moveA(-7139.09,-3741,8.39147)
            moveA(-7146.22,-3722.85,8.49314)
            moveA(-7148.37,-3723.25,8.49333)
            --��װ��
            ID1,ID2 = getClosetTargetIDFilterName("���ֿ�",3,8)
            contactTarget(ID1,ID2)
            sleep(2000) --�ȴ����������
            contactTarget(ID1,ID2)
            useLua("/click GossipTitleButton5")
            useLua("/click GossipTitleButton3")
            sleep(1000)
            useLua("/run RepairAllItems()")
            sleep(3000)
            useLua("/click MerchantFrameCloseButton")
            moveA(-7146.13,-3722.43,8.4934)
            moveA(-7138.34,-3743.14,8.38147)
            moveA(-7110.31,-3771.74,8.46103)
            mount()
            moveA(-7110.55,-3807.01,8.37794)
            moveA(-7152.36,-3827.74,8.62542)
            --�ʼ�
            mail()
            moveA(-7148.61,-3820.1,8.46733)
            moveA(-7124.9,-3809.81,8.58982)
            moveA(-7100.04,-3798.56,8.38443)
            moveA(-7089.82,-3798.99,8.42238)
            moveA(-7059.57,-3769.71,10.3168)
            moveA(-7040.08,-3754.13,13.5474)
            moveA(-7023.66,-3740.08,21.7566)
            moveA(-7002.09,-3722.94,26.2471)
            moveA(-6996.04,-3718.37,28.1792)
            moveA(-6985.94,-3717.57,30.4315)
            moveA(-6953.94,-3717.43,42.9579)
            moveA(-6941.44,-3712.64,45.9253)
            enableClimb()
            moveA(-6919.67,-3698.21,59.7672)
            moveA(-6898.57,-3694.42,73.9134)
            moveA(-6885.57,-3677.49,85.9106)
            moveA(-6866.01,-3650.03,141.666)
            moveA(-6875.96,-3623.49,182.751)
            moveF(-6875.96,-3623.49,184.388,1)
            moveF(-6874.26,-3515.94,183.147,1)
            moveF(-6867.02,-3435.28,182.227,1)
            moveF(-6851.04,-3348.64,181.204,1)
            moveF(-6829.56,-3246.12,180.009,1)
            moveF(-6818.59,-3193.77,179.036,1)
            moveF(-6810.06,-3137.23,178.332,1)
            moveF(-6787.18,-3049.4,177.304,1)
            moveF(-6772.39,-3001.89,176.747,1)
            moveF(-6755.35,-2975.4,176.384,1)
            moveF(-6753.2,-2971.78,48.7121,1)
            moveF(-6765.39,-2954.18,36.4684,1)

            moveF(-6767.9,-2947.14,28.2135,1)
            enableClimb()
            moveF(-6773.98,-2929.58,27.99)
            sleep(1000)
            unableFly()
            unableWallThrough()
            unableClimb()
            jumpB()
            sleep(2000)
            prints("��ʼ��ʬ���������")
            moveB(-6773.54,-2905.9,8.87742)
            waitForLoadingPosition(-6773.54,-2905.9,8.87742)
            prints("��ʬ����������ɹ�")
        end
        
    end
end

main()
