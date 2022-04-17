maxStormLevel = 7  --��ǰ��󱩷�ѩ�ȼ�
maxShieldID = 33405  --��ǰ��󺮱����巨��ID
maxWaterLevel = 8 --���ˮ����ȼ�
maxBreadLevel = 7 --�����������ȼ�
maxLevelWaterName = "ħ��ɽȪˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ��������" --ʹ���������
maxLevelWaterCreatorID = 30703   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 22895   --ʹ�������ƷID
maxLevelWaterBUFFID = 34291      --ʹ��ˮBUFFID
maxLevelBreadBUFFID = 29073      --ʹ�����BUFFID
waitTime = 15 --����ʱ������


--�ű�����(��)
initialMoney = 0
resetFlag = 0
--��������ֽ�����Ϳ�ʼ��������Ҫ��־λ
repairResetFlag = 0

--ר��Ϊ��������Ƶ��ƶ�����
function moveInOut(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    moveB(x,y,z)
end


--¯ʯ������
function stornToDugeon()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,2294.99,-5347.1)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("¯ʯ�ؿ�ʼ����")
        moveA(2294.99,-5347.1,90.8804)
        moveA(2292.83,-5339.2,90.8804)
        moveA(2292.69,-5332.77,90.8804)
        moveA(2282.95,-5318.98,88.7434)
        --������
        standBy()
        mountUp()
        moveA(2259.75,-5319.51,81.6764)
        --��������
        ID1,ID2 = getClosetTargetIDFilterName("����",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --�ȴ����������
        useLua("/click GossipTitleButton1")
        sleep(1000)
        useLua("/run RepairAllItems()")
        sleep(6000)
        useLua("/click MerchantFrameCloseButton")
        moveA(2262.53,-5305.01,82.1187)
        moveA(2288.7,-5316.27,88.5085)
        --����
        mail()
        moveA(2296.22,-5284.8,82.1805)
        moveA(2316.64,-5232.94,85.4355)
        moveA(2325.81,-5217.15,84.0463)
        moveA(2384.88,-5163.64,74.0783)
        moveA(2430.97,-5112.89,81.4461)
        moveA(2455.92,-5089.93,76.285)
        moveA(2471.91,-5070.97,80.5016)
        moveA(2484.17,-5029.04,70.155)
        moveA(2490.52,-4981.94,74.4519)
        moveA(2492.49,-4946.69,78.7178)
        moveA(2493.95,-4920.95,76.8368)
        moveA(2491.3,-4876.13,74.8377)
        moveA(2471.8,-4837.47,73.881)
        moveA(2448.29,-4798.22,74.7355)
        moveA(2429.07,-4767.39,71.4756)
        moveA(2442.07,-4714.06,76.2384)
        moveA(2485.91,-4676.39,78.0516)
        moveA(2518.44,-4658.76,76.2983)
        moveA(2588.18,-4628.32,82.3714)
        moveA(2665.7,-4587.67,85.5991)
    
        moveA(2720.11,-4556.01,89.2648)
        moveA(2758.66,-4528.95,90.2397)
        moveA(2782.53,-4504.47,91.3378)
        moveA(2810.27,-4473.89,91.6529)
        moveA(2838.08,-4438.49,90.9734)
        moveA(2862.08,-4398.44,91.0572)
        moveA(2880.03,-4363.37,90.2409)
        moveA(2915.55,-4316.17,93.6137)
        moveA(2984.78,-4242.26,89.6534)
        moveA(3058.61,-4161.75,95.4958)
    
        moveA(3089.31,-4131.92,97.0188)
        moveA(3126.38,-4064.73,101.806)
        moveA(3155.49,-4040.56,103.817)
        moveA(3183.83,-4039.08,107.992)
        --����
        openGate("���߹㳡���")
        moveA(3197.09,-4038.61,107.991)
        moveA(3229.59,-4037.22,108.422)
        prints("����")
        moveInOut(3235.5,-4056.65,108.467)
        waitForLoadingPosition(3235.5,-4056.65,108.467)
        prints("��������")
        
    end
end

--������¯ʯ
function dugeonToStorn()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    moveA(3229.59,-4037.22,108.422)
    moveA(3197.09,-4038.61,107.991)
    openGate("���߹㳡���")
    --��ֹ�������ǰ���������µĿ�ס
    enableFly()
    moveA(3183.83,-4039.08,107.992)
    unableFly() 
    unableWallThrough()
    moveA(3171.2,-4042.08,105.149)
    standBy()
    mountUp()
    moveA(3155.49,-4040.56,103.817)
    moveA(3126.38,-4064.73,101.806)
    moveA(3089.31,-4131.92,97.0188)
    moveA(3058.61,-4161.75,95.4958)

    moveA(2984.78,-4242.26,89.6534)
    moveA(2915.55,-4316.17,93.6137)
    moveA(2880.03,-4363.37,90.2409)
    moveA(2862.08,-4398.44,91.0572)
    moveA(2838.08,-4438.49,90.9734)
    moveA(2810.27,-4473.89,91.6529)
    moveA(2782.53,-4504.47,91.3378)
    moveA(2758.66,-4528.95,90.2397)
    moveA(2720.11,-4556.01,89.2648)
    moveA(2665.7,-4587.67,85.5991)
    moveA(2588.18,-4628.32,82.3714)
    moveA(2518.44,-4658.76,76.2983)
    moveA(2485.91,-4676.39,78.0516)
    moveA(2442.07,-4714.06,76.2384)
    moveA(2429.07,-4767.39,71.4756)
    moveA(2448.29,-4798.22,74.7355)
    moveA(2471.8,-4837.47,73.881)
    moveA(2491.3,-4876.13,74.8377)
    moveA(2493.95,-4920.95,76.8368)
    moveA(2492.49,-4946.69,78.7178)
    moveA(2490.52,-4981.94,74.4519)
    moveA(2484.17,-5029.04,70.155)
    moveA(2471.91,-5070.97,80.5016)
    moveA(2455.92,-5089.93,76.285)
    moveA(2430.97,-5112.89,81.4461)
    moveA(2384.88,-5163.64,74.0783)
    moveA(2325.81,-5217.15,84.0463)
    moveA(2282.67,-5317.75,88.6079)
    moveA(2294.27,-5335.28,90.8806)
    moveA(2293.12,-5344.16,90.8806)
end

--����Ƿ���Ҫ�������
function checkIfNeedRepaire()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,3588,-3637.26)--����ڸ����ڲ�ִ��
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        unusedBag = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        headDuration = getEquipementDurationBySlotNum(1)
        printd("��ǰͷ���;ã�%d",headDuration)
        printd("��ǰδʹ�ñ���������%d",unusedBag)
        if unusedBag > 20 and headDuration >= 30 then --���װ�����죬����û�����ͳ�������

        elseif unusedBag <= 20 or headDuration <= 30 then --���װ�����˻��߱������˻س�����
            if unusedBag ~= -1 and headDuration ~= -1 then  --�ٴ���֤�����Ƿ�ɹ�
                prints("����-��ʼ����")
                if  getStoneCoolDown(6948) == 0 then --���¯ʯû��CD,��ʹ��¯ʯ
                    sleep(2000)
                    useItem("¯ʯ")
                    sleep(9000)
                    waitForLoading()
                    sleep(2000)
                    --���ø���
                    if repairResetFlag == 1 then
                        useLua("/run ResetInstances()") --����
                        sleep(1000)
                        prints("�������óɹ�")
                    end
                    stornToDugeon()
                else
                    moveInOut(3588,-3637.26,138.469)
                    waitForLoadingPosition(3588,-3637.26,138.469)
                    moveA(3229.59,-4037.22,108.422)
                    if repairResetFlag == 1 then
                        useLua("/run ResetInstances()") --����
                        prints("�������óɹ�")
                    end 
                    dugeonToStorn()
                    stornToDugeon()
                end     
            end
        end
    end
end


--�����ſڵ�������
function DugeonGateToInside()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,3235.5,-4056.65)--����ڸ����ſ�
    if mapDistance1 <= 40 and mapDistance1 > 0 then 
        prints("�Ӹ����ſڳ���������")
        moveInOut(3235.5,-4056.65,108.467)
        prints("��ʼ�ȴ���������")
        waitForLoadingPosition(3235.5,-4056.65,108.467)
    end
end

function mail()
    prints("��ʼ�ʼ�")
    bagNum = getBagSlotNum(0) --��ñ����Ĵ�С
    unUsedSLot = getUnusedBagSlotNum(0)--������б���ʣ��Ŀո���
    if bagNum-unUsedSLot > 0 then --����������ж���
        contactClosetMailObjec()--�����以��(������)
        clickSendMailFrame()--�򿪷���ҳ��
        setMailTargetName()--��д���֣������ڽű�������д
        for k = 9,bagNum,1 do --���Խ������е�ÿ�����Ӷ��������䣬û�оͲ��ţ��оͻ�Ž�ȥ
            putMailItem(0,k) --����
            sleep(10)
        end
        sendMail()--�����ʼ�
        useLua("/click MailFrameCloseButton")
        sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
    end
    for i=1,4,1 do --ѭ�������и���������Ʒ������,ֱ�������ʼ�
        bagNum = getBagSlotNum(i) --��ñ����Ĵ�С
        unUsedSLot = getUnusedBagSlotNum(i)--������б���ʣ��Ŀո���
        if bagNum-unUsedSLot > 0 then --����������ж���
            contactClosetMailObjec()--�����以��(������)
            clickSendMailFrame()--�򿪷���ҳ��
            setMailTargetName()--��д���֣������ڽű�������д
            for k = 1,bagNum,1 do --���Խ������е�ÿ�����Ӷ��������䣬û�оͲ��ţ��оͻ�Ž�ȥ
                putMailItem(i,k) --����
                sleep(10)
            end
            sendMail()--�����ʼ�
            useLua("/click MailFrameCloseButton")
            sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
        end
    end
    contactClosetMailObjec()--�����以��
    clickSendMailFrame()--�򿪷���ҳ��
    putMailMoney(200)--����1G
    setMailTargetName()--��д���֣������ڽű�������д
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
    castSpellA("��ʦ����")
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
        sleep(1000)
        --���һ��С����ս���У��ͷ�ħ����
        if getRoleflag1() == 0x08 then
            castSpellA("ħ����")
        else
            ID1,ID2,_,_,_,_,_,_,_,flag1 = getClosetTargetIDFilterName(name,6)
            contactTarget(ID1,ID2)
        end


    end
end

--ʰȡ
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
        if(n > 1) then --�����������4���Ӿ�ʰȡ
            local ID1,ID2,x,y,z = getClosetTargetIDFilterCanBeLoot() --�������Ŀ��Ա�ʰȡ�Ĺ���
            if ID1 ~= 0 and ID1 ~= -1 then --֤���������˹���
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --���Ŀ������ҵľ���
                if distance < 40 and distance >= 0 then -- �����8�뷶Χ�ڣ���ֹȥʰȡ̫Զ��Ŀ�꣬Ȼ�󱻿�ס
                    moveB(x,y,z)
                    contactTarget(ID1,ID2) --ʰȡĿ��
                    quickPickUp()
                    sleep(50)
                    useLua("/click StaticPopup1Button1")
                    
                end
            else --����û�п���ʰȡ��Ŀ���ˣ�����ѭ��
                break
            end
        else
            break
        end
        sleep(10)
    end
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


--��ս������ѩ
function stormWhenInbattle(x,y,z)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --���ѻ���
    if getRoleCurrentMP() <= 20 and getSpellCoolDown(12051) == 1 and getRoleCurrentHP() > 70 then
        castSpellB("����Ѫ��")
        sleep(50)
        castSpellA("����")
        sleep(4000)
        return
    end
    --û�ж��ñ���Ѫ��
--[[     if getSpellCoolDown(12472) == 1 and IsBuffExist(maxShieldID) == 0 then
        castSpellB("����Ѫ��")
    end ]]
    --�����������50%��ʹ����������ѩ
    
    if getRoleCurrentMP() >= 20 then
        storm(maxStormLevel,x,y,z)   
    else
        storm(1,x,y,z)   
    end
    --ѭ�������ӳ��жϣ�������ܱ���ϣ����ͷ�һ������ѩ����
    for i = 1, 20, 1 do
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= 0xCB and spellID ~= 0xCD and spellID ~= 0x0A and i > 4 and i < 16 then
            storm(1,x,y,z)
        else
            sleep(380)
        end
        local _,_,_,_,_,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance > 0 and distance < 4 then
            prints("%s ���ڽӽ����ر�",name)
            break
        end
    end
    --�з�ϵ�ֲ���û�жܵ�buff����û��CDʱ�ͷŶ�
    ID1 =  getClosetTargetIDInBattleFilterName("�ػ���",3)
    if IsBuffExist(maxShieldID) == 0 and  getSpellCoolDown(maxShieldID) == 1 and ID1 ~= -1 and ID1 ~= 0  then
        castSpellB("��������")
    end
    --�Ա�ʯ
    if isItemExist(22044) == 1 and getRoleCurrentMP() <= 65 then
        useItem("��������")
        useItem("��Ч����ҩˮ")
    end
    if isItemExist(8008) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�����챦ʯ")
    end
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("������ˮ��")
    end


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


--ս��
function battle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local count = 0
    prints("��ʼս��",name)
    battleFly(3686.46,-3647.17,145.638,0)
    stormWhenInbattle(3666.89,-3625.17,139.951)
    battleFly(3695.24,-3641.22,145.078,0)
    stormWhenInbattle(3679.47,-3623.01,140.264)
    --�����ս���У����ҳ��ϲ���ֻʣ�����������
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 do
        count = count + 1
        if count > 4 and checkForGetRidOfBattle() == true then
            break
        end
        --������  
        rotateB(3.3)
        useLua("/use 13")
        useLua("/use 14")
        battleFly(3685.83,-3646.46,146.136,0)
        stormWhenInbattle(3666.89,-3625.17,139.951)
        --������
        rotateB(0.7)
        battleFly(3694.8,-3640.04,145.778,0)
        stormWhenInbattle(3679.47,-3623.01,140.264)  
    end    
        
end


--�ȴ���ս
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    prints("��ʼ�ȴ���ս:%d",checkForGetRidOfBattle())
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        sleep(1000)
    end
    prints("��ս�ɹ�,�ȴ�������ʧ")
    moveF(3687.52,-3646.88,145,0)
    --�ȴ�������ʧ
    sleep(19000)


end

--����Ƿ�Ҫ��ս
function checkForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local InBattleNum = getNumOfInBattleUnit()
    printd("ʣ����%d",InBattleNum)
    printd("��ʰȡ��%d",getNumOfCanBeLootUnit())
    _,_,_,_,_,HP = getLowestHPTargetID(3)
    if InBattleNum < 10 then
        return true
    else
        return false
    end
end

--�ȴ���15���ӣ���ֹ����
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    prints("��ʼ�ȴ���ֹ������14����,���ڣ�%ss",getThreadTime())
    --��ʼ����ʱ�䣬����ˢ��15���ӣ���Ȼ����
    while getThreadTime() < waitTime*60  do
        sleep(10000)
        prints("ʣ��ȴ�:%ss",waitTime*60-getThreadTime())
    end
    prints("�ű����ȴ�����")
end

--С�Ž�����
function tellOtherInOrOut(state)
    if isInPartyOrGroup() == 1 then
        useLua("/party follow"..state) --��С�ų���
        useLua("/party follow"..state) --��С�ų���
    end
end


function main()
    --������ʼ
    --�ӱ��⿪ʼ
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
        
        -- ������ˢ������
        -- 1.�Ӹ����ſ��ܽ�����(���ӳٵȴ�����)
        -- 2.�Ժ�-��buff-�Ժ�
        -- 3.��ʼ��������-ˢ��������

        unableFly()
        unableWallThrough()
        sleep(200)
        --�����ſڵ�������
        DugeonGateToInside()
        --����Ƿ���Ҫ����
        checkIfNeedRepaire()
        --¯ʯ������
        stornToDugeon()
        --�����ſڵ�������
        DugeonGateToInside()
        --��ʼ׼������
        --�Ժ�
        initialMoney = getMoney()
        --����
        tellOtherInOrOut(1)
        drink()
        --��BUFF
        castBuffs()
        if isItemExist(22044) == 1  then
            useItem("��������")
        end
        drink()
        --���취����ʯ
        magicStone()
        drink()
        castSpellA("��������")
        --��ʽ��ʼ
        moveA(3596.73,-3655.13,138.514) 
        moveA(3622.96,-3643.19,138.51) 
        --����
        openGate("�ʹ���ڴ���")
        --����
        moveF(3626.42,-3641.2,161.394,1)
  
        --moveA(3678.23,-3628.53,158.088)
        --��ǹ���������ұ� 3684.95,-3615.04
        --iceLenceTarget("��ʬ|����",3686.61,-3612.29)
        moveA(3627.15,-3614.87,157.072)
        tellOtherInOrOut(1)
        --�����������������
        silenceTarget(" ��ʬ|����",3634.02,-3620.46)
        --ǰ����Ȫ
        moveF(3619.88,-3490.09,165.684,0)
        --�ӳٵȺ���Ĺ�����
        sleep(3000)
        --����ѩ��ǰ��������
        storm(1,3637.05,-3479.9,138.265)
        sleep(1000)
        --storm(1,3606.75,-3507.73,137.523)
        --sleep(1000)
        --���ǽ����(ǰ��ǰ��)
        moveA(3584.63,-3493.02,162.723)
        moveA(3562.16,-3461.61,162.279)
        moveA(3512.37,-3403.62,161.173)
        castSpellA("��������")
        moveA(3459.66,-3382.98,160.006)
        --�ӳٵȺ���Ĺ�����
        sleep(5000)
        --��ǹ����ǰ��
        iceLenceTarget("��ʬ|����",3442.14,-3377.46)
        moveA(3510.4,-3306.8,158.094)
        --����ѩ���ʲ�
        storm(1,3491.72,-3303.13,130.40)
        sleep(1000)
        --ǰ��Ѫɫ����
        moveF(3590.43,-3312.82,154,0)
        moveF(3641.8,-3320.11,153,0)
        moveF(3702.91,-3263.52,151.364,1)
 
        --����ѩ������һ����+����ʳʬ��
        storm(1,3719.55,-3261.71,127.754)
        sleep(1000)
        --storm(1,3678.04,-3265,127.469)
        --sleep(1000)
        --��ʼ���غ���

        moveF(3690.21,-3356.56,153,0)
        castSpellA("��������")
        --moveA(3709.04,-3382.45,157.315)
        
        --����������
        moveA(3719.21,-3458.79,152)
        silenceTarget("ʳʬ��",3730.73,-3455.07)

        moveA(3672.01,-3522.44,151.881)
        moveA(3678.12,-3578.21,151)
        --�ȴ�
        --sleep(1000)
        castSpellA("ħ������")
        --���﷿���ұ߿�ʼ�½�
        moveF(3695.07,-3641.27,145,0)
        castSpellA("��������")
        silenceTarget("����",3701.5,-3625.41)
        --���뷿�ӣ�׼����ʼˢ��
        moveF(3686.46,-3647.17,145.638,0)
 
        battle()
        --��ʼ��ǽ���ȴ���ս
        --castSpellA("������")
        moveF(3700.16,-3668.2,146.764,0)
        waitForGetRidOfBattle()

        --��ʼǰ��Ŀ�ĵ�ʰȡ(��ը����)
        castSpellA("��������")
        moveF(3670.07,-3621.29,141.447,0)
        pickUp()
        --����
        moveF(3614.96,-3647.25,156.545,1)
        unableFly()
        unableWallThrough()
        printd("��������G:%d",getMoney()-initialMoney)
        moveA(3597.01,-3654.75,138.514)
        prints("��ʼ������������û����ı�ʯ")
        if isItemExist(22044) == 1  then
            useItem("��������")
        end
        tellOtherInOrOut(2)
        castSpellA("��������")
        sleep(1500)
        castSpellA("��������")
        prints("��ʼ�;öȱ������")
        unusedBag = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        headDuration = getEquipementDurationBySlotNum(1)
        if unusedBag > 20 and headDuration >= 30 then --���װ�����죬����û�����ͳ�������
            -- 6. ���ø���
            -- 9. ��������һ��ѭ��
            if resetFlag == 0 then
                wait()
            end
            --����
            tellOtherInOrOut(2)
            moveInOut(3587.84,-3637.8,138.472)
            waitForLoadingPosition(3587.84,-3637.8,138.472)
            sleep(1000)
            if resetFlag == 0 then
                useLua("/run ResetInstances()") --����
                sleep(1000)
                prints("�������óɹ�")   
               
            end
        elseif unusedBag <= 20 or headDuration <= 30 then --���װ�����˻��߱������˻س�����
            if unusedBag ~= -1 and headDuration ~= -1 then  --�ٴ���֤�����Ƿ�ɹ�

                --ǰ��¯ʯ
                repairResetFlag = 1
                checkIfNeedRepaire()
            end
        end      
    else -- ������ϴ������״̬��Debuff(��������)
        -- ��������ʬ����
        -- 1.��ʬ����
        -- 2.����
        -- �������ű����Զ�ѭ���������ˢ�����̣�����һ��ѭ��
        prints("��ʼ��ʬ")
        unableFly()
        unableWallThrough()
        sleep(1000)
        moveA(2676.76,-4016.84,95.1686)
        moveA(2757.58,-4015.35,96.6255)
        moveA(2829.81,-4017.36,102.793)
        moveA(2889.88,-4020.86,101.258)
        moveA(2958.57,-4034.25,100.984)
        moveA(3081.33,-4039.23,103.373)
        moveA(3179.2,-4039.46,105.703)
        moveA(3229.49,-4036.99,108.421)
        prints("������")
        moveInOut(3235.5,-4056.65,108.467)
        waitForLoadingPosition(3235.5,-4056.65,108.467)
        prints("������")
        moveInOut(3587.84,-3637.8,138.472)
        waitForLoadingPosition(3587.84,-3637.8,138.472)
    end
end

main()
