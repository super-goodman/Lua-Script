

level  = getRoleLevel()--�������ȼ�
if level < 52 then --����ȼ�С��52��
    maxStormLevel = 4  --��ǰ��󱩷�ѩ�ȼ�
    maxStormID = 0xC9  --��ǰ��󱩷�ѩ�ļ���ID 16���Ƶĺ�2λ
    maxShieldID = 13031  --��ǰ��󺮱����巨��ID
else --����ȼ����ڵ���52��
    maxStormLevel = 5  --��ǰ��󱩷�ѩ�ȼ�
    maxStormID = 0xCA  --��ǰ��󱩷�ѩ�ļ���ID 16���Ƶĺ�2λ
    maxShieldID = 13032  --��ǰ��󺮱����巨��ID
end

maxWaterLevel = 6 --���ˮ����ȼ�
maxBreadLevel = 6 --�����������ȼ�
maxLevelWaterName = "ħ���մ�ˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ�������" --ʹ���������
maxLevelWaterCreatorID = 8078   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 8076   --ʹ�������ƷID
maxLevelWaterBUFFID = 1137      --ʹ��ˮBUFFID
maxLevelBreadBUFFID = 1131      --ʹ�����BUFFID
waitTime = 15 --����ʱ������
pickUpCheck = 1 --�����Ƿ�ʰȡ,Ĭ��ʰȡ

--����������ƷID
doNotSellItems = {[1705]=true,[6149]=true,[10301]=true,[5498]=true,[7909]=true,[7971]=true,[1206]=true,[1210]=true,[4638]=true,[13443]=true,[1529]=true,[17032]=true,[5500] = true,[17031] = true,[4500] = true,[7989] = true,[13446] = true}
--�����ʼĵ���ƷID
doNotMailItems = {[17031]=true,[17032]=true,[6149]=true}
--��Ҫ���ٵ���������
mustDestroyItemNum = 1
--��Ҫ���ٵ���Ʒ��ID
mustDestroyItem = {[1]=11734}



--�ű�����(��Ҫ�Ķ�)
deadCheck = 0 --У���Ƿ�����;����

--��д������Ϊ��̨����Ƶ��ƶ�����
function move(x,y,z,dis)
    moveB(x,y,z)
    local rx,ry,rz = getRolePosition()
    while getDistanceBetween(x,y,rx,ry) > dis and getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 do
        moveB(x,y,z)
        sleep(40)
        rx,ry,rz = getRolePosition()
    end
end

--�������ſڵ�������
function DugeonOutToIn()
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-10171.3,-3997.14)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("��ʼ�������ſڵ�������")
        moveB(-10171.3,-3997.14,-113.894)
        moveB(-10171.3,-3997.14,-113.894)
        waitForLoadingPosition(-10171.3,-3997.14,-113.894)
        prints("�������ſڵ������ڳɹ�")
    end
end

--¯ʯ��������
function stoneToDugeon()
    local roleX,roleY,roleZ = getRolePosition()
    local mapDistance1 = getDistanceBetween(roleX,roleY,-10482,-3258.08)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 > 0 then 
        prints("��ʼ��¯ʯ��������")
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
        moveA(-10431.7,-3281.42,20.1786)
        moveA(-10407.6,-3289.55,20.179)
        moveA(-10407,-3296.79,20.1446)
        moveA(-10397.4,-3297.3,20.5325)
        moveA(-10370.7,-3317.26,22.7522)
        moveA(-10357.1,-3346.58,22.8766)
        moveA(-10350.4,-3377.25,23.2737)
        moveA(-10321.9,-3455.87,22.4871)
        moveA(-10303.9,-3522.03,22.5413)
        moveA(-10296.7,-3541.31,21.6327)
        moveA(-10293.9,-3594.3,21.6294)
        moveA(-10300.7,-3654.42,22.7738)
        moveA(-10264,-3743.86,17.2187)
        moveA(-10233.7,-3809.11,22.8239)
        moveA(-10200.5,-3822,23.5574)
        moveA(-10191.8,-3891.88,23.5003)
        moveA(-10176.2,-3995.18,-112.186)
        castSpellA("��������")
        --����ݵ�
        moveF(-10176.2,-3995.18,-112.186,0)
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(1000)
        prints("¯ʯ�������ſڽ�����ʼ")
        moveB(-10171.3,-3997.14,-113.894)
        waitForLoadingPosition(-10171.3,-3997.14,-113.894)
        prints("¯ʯ�������ſڽ����ɹ�")
    end
end


function dugeonToStone()
    local roleX,roleY,roleZ = getRolePosition()local roleX,roleY,roleZ = getRolePosition()
    local mapDistance = getDistanceBetween(roleX,roleY,-315.903,100.197)--����ڸ�������ſ�
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

function pickUp() 
    if getGlobalFlag() ~= 1 or pickUpCheck == 0 then
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

--�ȴ���15���ӣ���ֹ����
function wait()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    if deadCheck == 1 then
        prints("��ʼ�ȴ���ֹ������5����,���ڣ�%ss",getThreadTime())
        waitTime = 5
    else
        prints("��ʼ�ȴ���ֹ������15����,���ڣ�%ss",getThreadTime())
    end
  
    --��ʼ����ʱ�䣬����ˢ��15���ӣ���Ȼ����
    while getThreadTime() < waitTime*60 and getGlobalFlag() == 1  do
        sleep(5000)
        prints("ʣ��ȴ�:%ss",waitTime*60-getThreadTime())
    end
    prints("�������ȴ�����")
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
    castSpellA("ħ������")
end

--���취����ʯ
function magicStone()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    sleep(1000)
    prints("����ħ����ʯ")
    standBy()
    if isItemExist(8007) == 0 then
        castSpellA("����ħ����ˮ��")
        sleep(3500)
    end
    if isItemExist(5513) == 0 then
        castSpellA("����ħ�����")
        sleep(3500)
    end
end


--�ͷŶ�
function castShilds()
    if getGlobalFlag() ~= 1 then
        return 
    end
    --20%�����²��ͷŶ�
    if getRoleCurrentMP() < 10 then
        return
    end
    local shiledBuffState = IsBuffExist(maxShieldID)
    local shiledCoolDownState = getSpellCoolDown(maxShieldID)
    -- ��û��CDʱ�ͷŶ�
    if  shiledBuffState == 0 and  shiledCoolDownState == 1  then
        castSpellA("��������")
        return
    end
    --��û�У��ͼ��亮������
    if shiledBuffState == 0 and  shiledCoolDownState == 0 then
        castSpellA("������ȴ")
        sleep(10)
        castSpellA("��������")
    end
end

--׼������
function preparation()
    --��ʼ׼������
    prints("��ʼ׼������")
    drink()
    magicStone()
    drink()
    castBuffs()
    drink()
    castShilds()
    drink()
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
    printf("����ѩ:%f,%f,%f",target_x,target_y,target_z)
    if IsBuffExist(12536) == 1 then
        stormLevel = maxStormLevel
    end
    castSpellA("����ѩ".."(�ȼ� "..stormLevel..")")
    sleep(10)
    castSpellPosition(target_x,target_y,target_z)
end



--��ս������ѩ level = 1 ��ߵȼ� level = 0 1��----state = 1 ���������� 0�رվ�����
function stormWhenInbattle(level,x,y,z,time,state)
    if getGlobalFlag() ~= 1 then
        return 0
    end
    --��Ѫ���
    if  getRoleCurrentHP() <= 70 then
        --��дһ�㽵���������
        if isItemExist(6149) == 1 or isItemExist(13446) == 1 then
            useItem("��Ч����ҩˮ")
            useItem("��������ҩˮ")
        end
    end
    --û�ж��ñ���Ѫ��
    if (getSpellCoolDown(12472) == 0 and IsBuffExist(maxShieldID) == 0) or (getSpellCoolDown(maxFireShieldID) == 0 and IsBuffExist(maxFireShieldID) == 0) == 0 then
        castSpellB("����Ѫ��")
    end 
    --�����������40%��ʹ����������ѩ
    if getRoleCurrentMP() >= 40 and level == 1 then
        storm(maxStormLevel,x,y,z)   
    elseif level == 0 then
        storm(1,x,y,z)   
    end
    --ѭ�������ӳ��жϣ�������ܱ���ϣ����ͷ�һ������ѩ����
    local stormTime = getThreadTime()
    for i = 1, 20, 1 do
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 or (getThreadTime() - stormTime) > 7.5 then
            prints("��ս��������ʱ")
            break
        end
        local spellID = getRoleCurrentSpellID()
        --�������ID����ȷ��һ������ѩ,���ҳ���1.3s��ʼ�жϣ���Ϊǰ1s ����ID��־λû�б���λ
        if spellID ~= maxStormID and spellID ~= 0x0A and i > 5 and i < 15 then
            storm(1,x,y,z)
        else
            sleep(time)
        end
        if state == 1 then
            local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
            if distance >= 0 and distance < 8 then
                prints("%s ���ڽӽ����ر�",name)
                return
            end
        end
    end
    printd("����ѩ����ʱ��:%d",getThreadTime() - stormTime)
    if isItemExist(8007) == 1 and getRoleCurrentMP() <= 60 then
        useItem("������ˮ��")
        return
    end
    if isItemExist(5513) == 1 and getRoleCurrentMP() <= 60 then
        useItem("�������")
        return
    end
    if isItemExist(6149) == 1 and getRoleCurrentMP() <= 60 then
        useItem("ǿЧ����ҩˮ")
        return
    end


end

--������
function battleDistanceCheck(time)
    for i = 1, 10, 1 do
        local _,_,_,_,z,_,_,_,name,_,_,distance = getClosetTargetIDInBattle(3)
        if distance >= 0 and distance < 8 then
                prints("%s ���ڽӽ����ر�",name)
                return
        end
        sleep(time)
    end
end

--�۹�
function battle1()
    prints("��ʼ�۹�ս��")
    sleep(4000)
    --��һ����
    stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
    --�ڶ�����
    castShilds()
    stormWhenInbattle(0,-284.706,76.2606,-91.467,200)  
    --��ʼ��ܵ�һ����ը
    moveA(-303.732,91.7557,-91.4674)
    move(-303.693,89.5952,-88.5929,1)
    sleep(9000)
    castSpellA("��������")
    --���ػ�ȥ
    moveA(-299.28,94.3029,-91.4685)
    moveA(-298.392,101.316,-90.6758)
    --������ǽ
    enableClimb()
    --��ǽ����Ծ
    move(-298.415,102.308,-88.7195,1)
    jumpB()
    castShilds()
    --ǰ��A�ֿ�ʼ�ص�
    moveA(-308.763,101.805,-88.5769,3)
    --��ʼ����A��
    --��һ����
    standBy()
    stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
    --�ڶ�����
    castShilds()
    stormWhenInbattle(1,-284.706,76.2606,-91.467,400)  
    --��������
    castShilds()
    stormWhenInbattle(0,-287.171,80.8275,-91.467,350,1)
    castShilds()
    --ǰ������
    moveA(-299.28,94.3029,-91.4685)
    --�ڶ�����
    stormWhenInbattle(0,-284.706,76.2606,-91.467,350)
    --���ĸ���
    castShilds()
    stormWhenInbattle(1,-288.13,71.0988,-90.6759,400)
    --�������
    stormWhenInbattle(0,-291.516,65.0149,-91.4671,350,1)
    castShilds()
end




--��ʽս��
function battle2()
    prints("��ʼ��ʽս��")
    while getRoleflag1() == 0x08 and getRoleflag1() ~= 0x04 and getGlobalFlag() == 1 do
        moveA(-299.28,94.3029,-91.4685)
        moveA(-298.392,101.316,-90.6758)
        --������ǽ
        enableClimb()
        --��ǽ����Ծ
        move(-298.415,102.308,-88.7195,1)
        jumpB()
        castShilds()
        --ǰ��A�ֿ�ʼ�ص�
        moveA(-308.763,101.805,-88.5769,3)
        --��ʼ����A��
        --��һ����
        standBy()
        stormWhenInbattle(0,-287.288,72.8496,-91.4665,350)
        --�ڶ�����
        castShilds()
        stormWhenInbattle(1,-284.706,76.2606,-91.467,400)
        --��������
        castShilds()
        stormWhenInbattle(0,-287.171,80.8275,-91.467,340,1)
        castShilds()
        --�ж��Ƿ�ǰ������һ�߻��ѻ����µؼ���A
        if getRoleCurrentMP() < 30 and getSpellCoolDown(12051) == 1  then
            moveA(-303.732,91.7557,-91.4674)
            move(-303.693,89.5952,-88.5929,1)
            sleep(2000)
            standBy()
            castSpellA("����")
            battleDistanceCheck(1000)
        else
            --ǰ�����ϣ���ʼ����A��
            moveA(-299.28,94.3029,-91.4685)
            --�ڶ�����

            stormWhenInbattle(0,-284.706,76.2606,-91.467,350)
            --���ĸ���
            castShilds()
            stormWhenInbattle(1,-288.13,71.0988,-90.6759,400)
            --�������
            castShilds()
            stormWhenInbattle(0,-291.516,65.0149,-91.4671,350,1)
        end
       
    end
    printd("ս������!��ҵ�ǰս��Flag = %d",getRoleflag1())
end

--������
function main()
    if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
        prints("\n��Ҫ�ȼ�:49\n��ʼ�ص�:˹ͨ�ɵ�¯ʯ,��������\n¯ʯ�ص�:˹ͨ�ɵ�\n��Ҫ�ص����������,����רע,ħ������,ħ��Э��\n ��Ҫ�̹�,���Ⱥ�������,����רע��1��ħ������\n��ҪЬ���ƶ��ٶȸ�ħ\n��Ҫ������������װ��(�÷�,ҹ��)\n�츳ͼ��https://github.com/super-goodman/Lua-Script/blob/main/README.md")
        DugeonOutToIn()
        dugeonToStone()
        stoneToDugeon()
        DugeonOutToIn()
        --��������Ծ
        moveF(-315.903,100.197,-67.4536)
        --����Ƿ���Ϊ������������
        local _,_,_,_,_,_,_,_,_,_,_,distance = getClosetTargetIDToAPosition(-302.038,95.482,3)
        if distance < 20 then
            moveF(-402.826,98.4152,-70.2394)
            moveA(-482.302,128.905,-71.0511)
            --׼������
            preparation()
            prints("�ű���һ����ʽ��ʼ")
            --�µ�һ��ѩ
            storm(1,-499.869,149.781,-91.0591)
            sleep(1000)
            moveA(-466.341,107.446,-71.7752)
            --�������м�Ĺ�
            silenceTarget("��",-491.301,109.234)
            moveA(-400.663,132.49,-76.0984)
            --�µڶ���ѩ
            storm(1,-422.34,147.472,-90.9367)
            sleep(1000)
            moveF(-400.663,132.49,-73.0984)
            moveA(-359.359,83.748,-73.561,0)
            --�������ϣ�����һ��ѩ4s
            unableFly()
            unableWallThrough()
            jumpB()
            sleep(2000)
            storm(1,-378.04,95.0535,-90.865)
            sleep(4000)
            --5sѩ����䣬���ȴ�35s
            castSpellA("��������")
            sleep(30000)
            moveA(-362.464,95.2888,-90.8697)
            moveA(-355.657,95.4889,-90.9073)
            --����
            castSpellA("������")
            moveA(-298.48,96.8887,-91.4684)
            moveA(-298.392,101.316,-90.6758)
            --������ǽ
            enableClimb()
            --��ǽ����Ծ
            move(-298.415,102.308,-88.7195,1)
            jumpB()
            --ǰ��A�ֿ�ʼ�ص�
            moveA(-308.763,101.805,-88.5769,3)
            castSpellA("��������")
            --��ʼ�۹�
            battle1()
            --��ʼ��ʽ��ս��
            battle2()
            --��һ��ս������,��ʼʰȡ
            moveA(-297.588,94.7891,-91.467)
            moveA(-288.048,74.2222,-91.467)
            moveF(-288.048,74.2222,-88.1948)
            pickUp()
            --ʰȡ������׼����ʼ�ڶ���
            moveA(-296.94,79.8073,-91.4669)
            unableFly()
            unableWallThrough()
            moveA(-296.644,94.9367,-91.4669)
            moveA(-336.498,95.4791,-90.9287)
        else
            deadCheck = 1
        end
        prints("�ű��ڶ�����ʽ��ʼ")
        --׼������
        preparation()
        moveA(-382.543,94.6914,-90.8695)
        moveF(-383.404,94.4865,-70.3386,0)
        moveF(-531.478,59.1547,-71.3054,1)
        --��һ������ѩ
        standBy()
        sleep(100)
        storm(1,-533.511,86.6282,-90.9701)
        sleep(1000)
        moveF(-430.883,35.1762,-72.4317,1)
        moveA(-405.455,53.5684,-72.7539)
        --�ڶ�������ѩ
        standBy()
        sleep(100)
        storm(1,-424.429,40.0693,-90.9019)
        sleep(1000)
        moveA(-359.358,84.2123,-87.5611)
        standBy()
        sleep(100)
        --�������ϣ�����һ��ѩ4s
        unableFly()
        unableWallThrough()
        jumpB()
        sleep(2500)
        storm(1,-378.04,95.0535,-90.865)
        sleep(4000)
        --5sѩ����䣬���ȴ�35s
        castSpellA("��������")
        sleep(30000)
        moveA(-362.464,95.2888,-90.8697)
        moveA(-355.657,95.4889,-90.9073)
        --����
        castSpellA("������")
        moveA(-298.48,96.8887,-91.4684)
        moveA(-298.392,101.316,-90.6758)
        --������ǽ
        enableClimb()
        --��ǽ����Ծ
        move(-298.415,102.308,-88.7195,1)
        jumpB()
        --ǰ��A�ֿ�ʼ�ص�
        moveA(-308.763,101.805,-88.5769,3)
        castSpellA("��������")
        --��ʼ�۹�
        battle1()
        --��ʼ��ʽ��ս��
        battle2()
        --��һ��ս������,��ʼʰȡ
        moveA(-297.588,94.7891,-91.467)
        moveA(-288.048,74.2222,-91.467)
        moveF(-288.048,74.2222,-88.1948)
        pickUp()
        --��ʼ����
        moveF(-315.318,99.883,-125.913)
        unableFly()
        unableWallThrough()
        jumpB()
        --������
        drink()
        wait()
        prints("������ʼ")
        moveB(-308.647,100.205,-131.848)
        waitForLoadingPosition(-308.647,100.205,-131.848)
        prints("�����ɹ�")
        sleep(1000)
        useLua("/run ResetInstances()") --����
        sleep(1000)
        prints("�������óɹ�")   
    else
        prints("��ʼ��ʬ")
        moveA(-10562.1,-3377.31,22.0487)
        moveA(-10533.4,-3403,22.3131)
        moveA(-10528.4,-3439.76,22.284)
        moveA(-10467.5,-3532.23,22.5713)
        moveA(-10430.5,-3591.52,22.22)
        moveA(-10412.2,-3621.4,23.7291)
        moveA(-10402.8,-3656.02,22.1372)
        moveA(-10385.4,-3692.49,18.3501)
        moveA(-10325.6,-3772.53,18.3276)
        moveA(-10276.6,-3837.36,18.3276)
        moveA(-10237.8,-3888.57,19.4929)
        moveA(-10233.3,-3918.53,20.692)
        moveA(-10213.5,-3925.8,21.9629)
        moveA(-10201,-3945.58,22.4559)
        moveA(-10170.1,-3996.37,22.4975)
        moveF(-10170.1,-3996.37,11.2189,1)
        unableFly()
        unableWallThrough()
        jumpB()
        prints("��ʬ������ʼ")
        waitForLoading()
        prints("��ʬ�����ɹ�")
    end
end



main()