shieldState = 0
function drink() --�Ժ�
    local drinkBag, drinkSlot = getBelongBagAndSlotByID(30703)
    local breadBag, breadSlot = getBelongBagAndSlotByID(22895)
    if drinkSlot == 0 or breadSlot == 0 then
        standBy()
        castSpellA("��ʳ��(�ȼ� 7)")
        sleep(3500)
        castSpellA("��ˮ��(�ȼ� 8)")
        sleep(3500)
    end
    local je1Bag, je1Slot = getBelongBagAndSlotByID(22044)
    if je1Slot == 0 then
        standBy()
        castSpellA("����ħ����ʯ")
        sleep(3500)
    end
    je1Bag, je1Slot = getBelongBagAndSlotByID(8008)
    if je1Slot == 0 then
        standBy()
        castSpellA("����ħ���챦ʯ")
        sleep(3500)
    end
    je1Bag, je1Slot = getBelongBagAndSlotByID(8007)
    if je1Slot == 0 then
        standBy()
        castSpellA("����ħ����ˮ��")
        sleep(3500)
    end
    je1Bag, je1Slot = getBelongBagAndSlotByID(5513)
    if je1Slot == 0 then
        standBy()
        castSpellA("����ħ�����")
        sleep(3500)
    end
    if getRoleCurrentHP() < 95 and getRoleCurrentMP() < 95 and getRoleCurrentHP() >= 0 and getRoleCurrentMP() >= 0 then
        useItem("ħ��������")
        useItem("ħ��ɽȪˮ")
    end
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04 do
        if IsBuffExist(29073) == 0 or IsBuffExist(34291) == 0 then
            useItem("ħ��������")
            useItem("ħ��ɽȪˮ")
        end
        if getRoleCurrentHP() >= 95 and getRoleCurrentMP() >= 95 then
            break
        end
        sleep(1000)
    end
    
end

function mail()
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
        if i == 3 then
            contactClosetMailObjec()--�����以��
            clickSendMailFrame()--�򿪷���ҳ��
            putMailMoney(3)--����1G
            setMailTargetName1()--��д���֣������ڽű�������д
            sendMail()--�����ʼ�
            useLua("/click MailFrameCloseButton")
            sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
        end
    end
    contactClosetMailObjec()--�����以��
    clickSendMailFrame()--�򿪷���ҳ��
    putMailMoney(100)--����1G
    setMailTargetName()--��д���֣������ڽű�������д
    sendMail()--�����ʼ�
    useLua("/click MailFrameCloseButton")
    sleep(500) -- ��΢�ӳ٣���ֹ���ʼ���ס
end

function silence(name,x,y) --����
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName(name,x,y,3,8)
    --prints(name)
    chooseTarget(ID1,ID2)
    castSpellA("��������")
end

function watchLobster() --�۲���Ϻ����λ
    local ID1,ID2,ID3,ID4,n,distance = 0,0,0,0,0,0
    local x,y,z,x1,y1,z1 = 0,0,0,0,0,0

    while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
     
        ID1,ID2 = getClosetTargetIDFilterName("����������Ϻ��",3,8)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        sleep(300)
        n = n + 1
        if n >= 500 then
            prints("��ʱ���޷���⵽��Ϻ��")
            moveB(120.223,-138.426,-0.821922)
            prints("a:��ʱ���޷���⵽��Ϻ�ˣ�����")
            waitForLoadingPosition(120.223,-138.426,-0.821922)
            useLua("/run ResetInstances()") --����
            sleep(1000)
            moveB(743.192,7014.06,-72.7946)
            prints("a:��ʱ���޷���⵽��Ϻ�ˣ��ٽ���")
            waitForLoadingPosition(743.192,7014.06,-72.7946)
            n = 0
        end
        ID3,ID4 = getClosetTargetIDFilterName("����������Ϻ��",3,8)
        
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

function stormLobster1() --����ѩ��Ϻ��1
    local ID1,ID2,distance1,distance2 = 0,0,0,0
    local x,y,z = 0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
        sleep(100)
        ID1,ID2 = getClosetTargetIDFilterName("����������Ϻ��",3,8)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        distance1 = getDistanceBetween(x,y,68.309, -99.5403)
        distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance1 <= 70 and distance1 >= 0 then
            if distance2 <= 32 and distance2 >= 0 then
                chooseTarget(ID1,ID2)
                castSpellA("��������")
                ID1,ID2 = getClosetTargetIDFilterName("����������Ϻ��",3,8)
                x,y,z = getTargetPositionByID(ID1,ID2,3)
                castSpellA("����ѩ(�ȼ� 1)")
                sleep(5)
                castSpellPosition(x,y,z)
                sleep(1500)
                return 0
            end
        else
            return 0 -- �������ɾ��
        end
    end
end

function stormLobster2() --����ѩ��Ϻ��2
    local ID1,ID2 = getClosetTargetIDFilterName("����������Ϻ��",3,8)
    local x,y,z = getTargetPositionByID(ID1,ID2,3)
    local distance = getDistanceBetween(x,y,9.88542, -24.4741)
    if distance <= 50 and distance >= 0 then
        local distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance2 <= 35 and distance2 >= 12 then
            castSpellA("����ѩ(�ȼ� 1)")
            sleep(5)
            castSpellPosition(x,y,z)
            sleep(1200)
            chooseTarget(ID1,ID2)
            castSpellA("��ǹ��(�ȼ� 1)")
        elseif distance2 <= 4 and distance2 >= 0 then
            castSpellB("��˪����(�ȼ� 1)")
        end
    else
        return 0
    end
end

function attackTechnicianNotUnderBridge()--��������Ѳ��������ʦ
    local ID1,ID2 = getClosetTargetIDFilterName("������ʦ",3,8)
    local x,y,z = getTargetPositionByID(ID1,ID2,3)
    local distance1 = getDistanceBetween(x,y,77.796, -356.878)
    local distance2 = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance1 > 8 and distance2 <= 35 and distance2 >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("��������")
    else
        return 0
    end
end

function attackTechnician()--��Ѳ��������ʦ
    local ID1,ID2 = getClosetTargetIDFilterName("������ʦ",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance <= 35 and distance >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("��������")
    else
        return 0
    end
end

function iceBlock() -- ��������
    moveB(71.1643,-338.1,6.0474)
    sleep(50)
    useLua("/cancelAura ������(�ȼ� 4)")
    local ID1,ID2,distance,hp = 0,0,0,0
    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        sleep(100)
        ID1,ID2 = getClosetTargetIDInBattleFilterName("������ʿ",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        hp = getRoleCurrentHP()
        if distance <= 15 and distance >= 0 then
            castSpellA("��������")
            return 0
        end
        if hp <= 45 and hp >= 0 then
            castSpellA("��������")
            return 0
        end
    end
end

function patrolBraveStop() --Ѳ����ʿ�����ж�
    local ID1,ID2 = getClosetTargetIDFilterName("������ʿ",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance <= 13 and distance >= 0 then
        castSpellB("��˪����(�ȼ� 1)")
    end
end

function patrolBraveSlience() --Ѳ����ʿ�����ж�
    local ID1,ID2 = getClosetTargetIDFilterName("������ʿ",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    level = getRoleLevel()
    if distance <= 35 and level == 70 and distance >= 0 then
        chooseTarget(ID1,ID2)
        castSpellA("��������")
    end
end

function summonStopMinion1(x,y,z)--ˮԪ�ض�ס��
    castSpellA("�ٻ�ˮԪ��")
    sleep(5)
    castSpellB("������ȴ")
    sleep(5)
    castSpellA("��˪����(�ȼ� 1)")
    sleep(5)
    castSpellB("������")
    sleep(5)
    castSpellPosition(x,y,z)
    sleep(5)
    useLua("/run PetDismiss()")  
end

function summonStopMinion2()--ˮԪ�ض�ס��
    castSpellA("�ٻ�ˮԪ��")
    sleep(600)
    castSpellB("������")
    sleep(20)
    --castSpellPosition(42.5877,-315.003,3.03932)
    castSpellPosition(35.2655,-312.797,3.03607)
    sleep(5)
    castSpellA("������")
end

function firstLevelStormGathered(x,y,z) --һ������ѩ�۹��ж�
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local spellID,hp = 0,0
    --printf(distance)
    if distance <= 8 and distance >=0 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
       if IsBuffExist(12536) == 1 then
            castSpellA("����ѩ(�ȼ� 7)")
            sleep(5)
            castSpellPosition(x,y,z)
       else
            castSpellA("����ѩ(�ȼ� 1)")
            sleep(5)
            castSpellPosition(x,y,z)
       end
       for i = 1, 20,1 do
           sleep(205)
           spellID = getRoleCurrentSpellID()
           if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 15 and spellID ~= 0x0a then
               if IsBuffExist(12536) == 1 then
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("����ѩ(�ȼ� 1)")
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

function firstLevelStormGathered1(x,y,z) --һ������ѩ�۹��ж�1
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    local spellID,hp = 0,0
    --printf(distance)
    if distance <= 8 and distance >=0 and ID1 ~= 0 and ID1 ~= -1 then
        return 0
    else
       if IsBuffExist(12536) == 1 then
            castSpellA("����ѩ(�ȼ� 7)")
            sleep(5)
            castSpellPosition(x,y,z)
       else
            castSpellA("����ѩ(�ȼ� 1)")
            sleep(5)
            castSpellPosition(x,y,z)
       end
       for i = 1, 20,1 do
           sleep(245)
           spellID = getRoleCurrentSpellID()
           if spellID ~= 0xCB and spellID ~= 0xCD  and i >= 5 and i<= 15 and spellID ~= 0x0a then
               if IsBuffExist(12536) == 1 then
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("����ѩ(�ȼ� 1)")
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

function checkDistanceBetweenMinion1() --����Ⱥ�Ƿ��㹻�ľ���
    local ID1,ID2 = getHighestHPTargetIDInBattle(3)
    local targetHP = getTargetHPByID(ID1,ID2,3)
    local hp = getRoleCurrentHP()
    local distance,distance1,distance2 = 0,0,0
    local x,y,z,n = 0,0,0,0
    local name,chat = getChatInfoByType(7)
    if name ~= "" and name ~= 0 and name ~= -1 then
        useLua("/reply [����Զ��ظ�]�Ҳ��ǻ᳤,������������빫��,�Ƚ���,�᳤��ŮȨ����ȫ�ܹھ�����m�㣬������m��")
        useLua("/tell ŮȨ ".. name.. "  ������빫��")
        useLua("/tell ȫ�ܹھ� ".. name.. "  ������빫��")
        useLua("/guildinvite "..name)
    end
    if hp < 70 and hp > 0 then
        useItem("���Ʋ�����")
        sleep(2000)
    end
    local coolDown = getSpellCoolDown(12051)
    local mp = getRoleCurrentMP()
    if coolDown == 0 and mp < 43 and mp > 0 and targetHP >= 35 then
        useItem("��������")
        useItem("�����챦ʯ")
        useItem("������ˮ��")
        useItem("�������")
    end
    if mp < 35 and mp > 0 and targetHP >= 35 then
        --prints("����1")
        castSpellA("����")
    end
    if targetHP < 35 and mp < 57 and targetHP >= 0 and mp > 0 then
        --prints("����2")
        useItem("��������")
        useItem("�����챦ʯ")
        useItem("������ˮ��")
        useItem("�������")
        sleep(100)
        castSpellA("����")
    end
    ID1,ID2 = getClosetTargetIDInBattleFilterName("��������Ŭ",3,8)
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
        ID1,ID2 = getClosetTargetIDInBattleFilterName("������ʦ",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance <= 30 and distance > 0 then
            chooseTarget(ID1,ID2)
            castSpellA("��������")
        end
        hp = getRoleCurrentHP()
        if hp <= 14 then
            useItem("��Ч����ҩˮ")
            castSpellA("��������(�ȼ� 5)")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        distance =  getTargetAndPositionDistanceByID(ID1,ID2,49.5638, -414.071,3)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        if distance >= 0 then --�����ж�
            distance1 = getDistanceBetween(x,y,-15.7392, -392.649)
            ID1,ID2 = getHighestHPTargetIDInBattle(3)
            targetHP = getTargetHPByID(ID1,ID2,3)
            if targetHP >= 30 then
                if distance1 <= 18 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 30 and targetHP >= 20  then
                if distance1 <= 32 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 20 and targetHP >= 10 then
                if distance1 <= 42 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 10 and targetHP >= 0 then
                if distance1 <= 47 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            end
        end
        if n >= 60 then
            ID1,ID2 = getClosetTargetIDInBattle(3) --�ж��Ƿ���̨��������
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

function checkDistanceBetweenMinion2() --����Ⱥ�Ƿ��㹻�ľ���2
    local ID1,ID2 = getHighestHPTargetIDInBattle(3)
    local targetHP = getTargetHPByID(ID1,ID2,3)
    local hp = getRoleCurrentHP()
    local distance,distance1,distance2 = 0,0,0
    local x,y,z = 0,0,0
    if hp < 70 and hp > 0 then
        useItem("���Ʋ�����")
        sleep(2000)
    end
    local coolDown = getSpellCoolDown(12051)
    local mp = getRoleCurrentMP()
    if coolDown == 0 and mp < 43 and mp > 0 and targetHP >= 35 then
        useItem("��������")
        useItem("�����챦ʯ")
        useItem("������ˮ��")
        useItem("�������")
    end
    if mp < 43 and mp > 0 and targetHP >= 35 then
        castSpellA("����")
    end
    if targetHP < 35 and mp < 57 and targetHP >= 0 and mp > 0 then
        useItem("��������")
        useItem("�����챦ʯ")
        useItem("������ˮ��")
        useItem("�������")
        sleep(100)
        castSpellA("����")
    end
    ID1,ID2 = getClosetTargetIDFilterName("��������Ŭ",3,8)
    if ID1 ~= 0 and ID1 ~= -1 then
        local flag2 = getTargetFlag2ByID(ID1,ID2,3)
        if flag2 == 0x08 then
            moveA(82.684,-348.453,3.03567)
        end
    end

    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        ID1,ID2 = getClosetTargetIDInBattleFilterName("������ʦ",3,8)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance <= 30 and distance > 0 then
            chooseTarget(ID1,ID2)
            castSpellA("��������")
        end
        hp = getRoleCurrentHP()
        if hp <= 14 then
            useItem("��Ч����ҩˮ")
            castSpellA("��������(�ȼ� 5)")
        end
        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        distance =  getTargetAndRoleDistanceByID(ID1,ID2,3)
        x,y,z = getTargetPositionByID(ID1,ID2,3)
        if distance >= 0 then --�����ж�
            distance1 = getDistanceBetween(x,y,-15.7392, -392.649)
            ID1,ID2 = getHighestHPTargetIDInBattle(3)
            targetHP = getTargetHPByID(ID1,ID2,3)
            if targetHP >= 30 then
                if distance1 <= 4 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 30 and targetHP >= 20  then
                if distance1 <= 32 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 20 and targetHP >= 10 then
                if distance1 <= 42 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            elseif targetHP <= 10 and targetHP >= 0 then
                if distance1 <= 57 then --�������Ƿ�Ŀ�ĵ�
                    return 0
                end
            end
        end
        ID1,ID2 = getClosetTargetIDInBattle(3) --�ж��Ƿ���̨��������
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

function shield() --�Ƿ��Ϻ�������
    local ID1,ID2 = getClosetTargetIDInBattleFilterName("����ħ��ʦ",3,8)
    if shieldState == 1 then
        castSpellA("��������(�ȼ� 5)")
        --[[
        if IsBuffExist(33944) == 0 then
            castSpellA("ħ������(�ȼ� 6)")
        end
        --]]
        return 0 
    end
    if ID1 ~= 0 and ID1 ~= -1 then
        shieldState = 1
        castSpellA("��������(�ȼ� 5)")
    end
end

function silenceTechnician()--��ϼ�ʦ����
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local name = getTargetNameByID(ID1,ID2,3)
    if name == "������ʦ" then
        chooseTarget(ID1,ID2)
        castSpellA("��������")
    end
end

function skipStorm(x,y,z) --�Ƿ��������������һ��
    local ID1,ID2 = getClosetTargetIDInBattle(3)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    if distance < 15 and distance >= 0 then
        return
    else
        castSpellA("����ѩ(�ȼ� 1)")
        sleep(5)
        castSpellPosition(x,y,z)
    end
end

function isMinionInPosition(x,y,z) --����Ⱥ�Ƿ�һ������ѩλ��
    local ID1,ID2,distance,coolDown = 0,0,0,0
    local mp,level,spellID,distance1 = 0,0,0,0
    ID1,ID2 = getClosetTargetIDInBattleFilterName("����ħ��ʦ",3,8)
    if ID1 ~= 0 and ID1 ~= -1 then
        shieldState = 1
    end
    while getRoleCurrentMP() ~= -1 and getRoleflag1() == 0x08 do
        sleep(5)

        ID1,ID2 = getClosetTargetIDToAPositionInBattle(49.5638, -414.071,3)
        if getRoleflag1() == 0x00 or getRoleflag1() == 0x04 then
            --prints("��ս��")
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
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)           
                end
            else
                castSpellA("����ѩ(�ȼ� 1)")
                sleep(5)
                castSpellPosition(x,y,z)    
            end
            for i = 1, 20,1 do
               
                spellID = getRoleCurrentSpellID()
                if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 15 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                    if IsBuffExist(12536) == 1 then
                        castSpellA("����ѩ(�ȼ� 7)")
                        sleep(5)
                        castSpellPosition(x,y,z)
                   else
                        castSpellA("����ѩ(�ȼ� 1)")
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

function secondTimeMaxLevelStorm(x,y,z) --�ڶ�������������ѩ
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
        castSpellB("����Ѫ��")
        castSpellA("����ѩ(�ȼ� 7)")
        sleep(5)
        castSpellPosition(x,y,z)
        for i = 1, 20,1 do
            sleep(410)
            spellID = getRoleCurrentSpellID()
            if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 13 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                if IsBuffExist(12536) == 1 then
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(x,y,z)
               else
                    castSpellA("����ѩ(�ȼ� 1)")
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
        
        ID1,ID2 = getHighestHPTargetIDInBattle(3) --�ڶ�����ѩ
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 32 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i<= 13 and i >= 5 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("����ѩ(�ȼ� 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("����ѩ(�ȼ� 1)")
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

        ID1,ID2 = getHighestHPTargetIDInBattle(3) --��������ѩ
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 28 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("�ٻ�ˮԪ��")
                    sleep(600)
                    castSpellB("������")
                    sleep(50)
                    castSpellPosition(80.5394,-410.023,3.03428)
                    sleep(5)
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i >= 5 and i<= 13 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("����ѩ(�ȼ� 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("����ѩ(�ȼ� 1)")
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

        ID1,ID2 = getHighestHPTargetIDInBattle(3) --�ڶ�����ѩ
        mp = getRoleCurrentMP()
        targetHP = getTargetHPByID(ID1,ID2,3)
        if mp >= 20 or IsBuffExist(12536) == 1 then
            if targetHP <= 22 or IsBuffExist(12536) == 1 then
                if targetHP >= 0 and ID1 ~= 0 and ID1 ~= -1 then
                    castSpellA("����ѩ(�ȼ� 7)")
                    sleep(5)
                    castSpellPosition(76.651,-417.735,3.03409)
                    for i = 1, 20,1 do
                        sleep(400)
                        spellID = getRoleCurrentSpellID()
                        if spellID ~= 0xCB and spellID ~= 0xCD and i<= 13 and i >= 5 and spellID ~= 0x0a and IsBuffExist(12472) == 0 then
                            if IsBuffExist(12536) == 1 then
                                castSpellA("����ѩ(�ȼ� 7)")
                                sleep(5)
                                castSpellPosition(x,y,z)
                           else
                                castSpellA("����ѩ(�ȼ� 1)")
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

function removeDebuff() --�������
    if IsBuffExist(33787) == 1 or IsBuffExist(32173) == 1 or IsBuffExist(15655) == 1 then
        castSpellA("��������")
        castSpellA("��������")
        return 0
    end
end

function ore()--�ɿ�
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
                ID3,ID4 = getClosetTargetIDToAPositionFilterName("�����๤",-88.31,-287.80,3,8)
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

function treasure1() --������
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("��̵�ħ������",133.155, -305.886,6,8)
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

function treasure2() --������2
    local ID1,ID2 = getClosetTargetIDToAPositionFilterName("��̵�ħ������",134.05, -446.654,6,8)
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

function move(x,y,z) --��д�����ƶ�
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04  do
        moveB(x,y,z)
        if getRoleCurrentHP() <= 15 and getRoleCurrentHP() >= 1 then
            useItem("��Ч����ҩˮ")
        end
        if getRoleCurrentMP() <= 14 and getRoleCurrentHP() >= 1 then
            useItem("��Ч����ҩˮ")
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

function skip() --������̨������
    local ID1,ID2 = getClosetTargetIDFilterName("������ʿ",3,8)
    local distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
    castSpellB("��������(�ȼ� 4)")
    castSpellB("��������(�ȼ� 7)")
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
            useItem("��Ч����ҩˮ")
        end
        for i = 1, 15, 1 do
            moveB(x,y,z)
            sleep(40)
        end
     
        x1,y1,z1 = getRolePosition()
    end
end

function pickUp() --ʰȡ
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04 do -- ѭ��n�Σ�mld�����кܶ�֣�
        local n = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        if(n > 4) then --�����������4���Ӿ�ʰȡ
            local ID1,ID2 = getClosetTargetIDFilterCanBeLoot() --�������Ŀ��Ա�ʰȡ�Ĺ���
            if ID1 ~= 0 and ID1 ~= -1 then --֤���������˹���
                local distance = getTargetAndRoleDistanceByID(ID1,ID2,3) --���Ŀ������ҵľ���
                if distance < 40 and distance >= 0 then -- �����8�뷶Χ�ڣ���ֹȥʰȡ̫Զ��Ŀ�꣬Ȼ�󱻿�ס
                    contactTarget(ID1,ID2) --ʰȡĿ��
                    sleep(50)
                    useItem("���Ƶİ���")
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

--������ʼ
--�ӱ��⿪ʼ

useLua("/removefriend �����м�")
--useLua("/ignore �����м�")
sleep(2000)
useLua("/friend �����м�")
if IsBuffExist(8326) == 0 then -- �������û�д������״̬��Debuff
    -- ������ˢ������
    -- 1.�Ӹ����ſ��ܽ�����(���ӳٵȴ�����)
    -- 2.�Ժ�-��buff-�Ժ�
    -- 3.��ʼ��������-ˢ��������
    roleX,roleY,roleZ = getRolePosition() --�����Ĺ��
    mapDistance1 = getDistanceBetween(roleX,roleY,338.382,7624.41)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --�����¯ʯ then
        prints("a:���Ŵ�Ĺ�ؿ�ʼ")
        useItem("��ɫ½����")
        useItem("˪���ƽ��ߵĺŽ�")    
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
    mapDistance1 = getDistanceBetween(roleX,roleY,234.317,7920.04)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --�����¯ʯ then
        moveA(234.317,7920.04,25.0776)
        moveA(240.032,7906,25.7801)
        moveA(240.032,7906,25.7801)
        useItem("˪���ƽ��ߵĺŽ�")
        useItem("��ɫ½����")
        sleep(3500)
        moveA(257.147,7864.96,23.12)
        moveA(277.048,7861.91,24.5074)
        moveA(287.956,7851.34,22.3817)
        moveA(321.68,7850.33,22.7926)
        moveA(323.501,7843.37,22.3667)
        ID1,ID2 = getClosetTargetIDFilterName("����²��٪��",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --�ȴ����������
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
        castSpellB("������")
        moveA(488.224,7244.35,16.7861)
        castSpellB("������")
        moveA(522.165,7055.7,16.8074)
        castSpellB("������")
        moveA(544.161,6961.94,16.7637)
        castSpellB("������")
        moveA(550.472,6957.96,9.62258)
        castSpellB("������")
        moveA(570.18,6939.38,-21.9679)
        castSpellB("������")
        moveA(581.349,6938.73,-39.9977)
        castSpellB("������")
        moveA(608.24,6908.64,-47.6687)
        castSpellB("������")
        moveA(608.09,6908.6,-47.6738)
        moveA(614.375,6890.87,-56.2252)
        moveA(627.688,6878.41,-71.2822)
        moveA(641.199,6868.34,-80.1888)
        moveA(665.759,6866.15,-78.4772)
        moveA(665.759,6866.15,-72.2003)
        moveA(709.469,6914.38,-67.8285)
        castSpellB("������")
        moveA(720.006,6950.8,-68.0424)
        castSpellB("������")
        moveA(717.492,6990.01,-73.0739)
        castSpellB("������")
        moveA(733.508,7012.31,-72.6895)
    end
  
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,743.192,7014.06)--�����¯ʯ
    if mapDistance1 <= 100 and mapDistance1 >= 0 then --�����¯ʯ then
         prints("a:�Ӹ����ſڿ�ʼ")
        moveB(743.192,7014.06,-72.7946)
        waitForLoadingPosition(743.192,7014.06,-72.7946)

    end
    sleep(1000)
    drink()
    sleep(1000)

    useLua("/party follow2") --��С�ų���
    castSpellA("�����ǻ�(�ȼ� 5)")
    castSpellA("������(�ȼ� 4)")
    castSpellA("ħ������(�ȼ� 6)")
    --useLua("/5.Ѱ����� ������Ұ ��/��/��/��/����/P1�ȶ�FARM!��ӭ��·��ը����!���SS/LR/Ԫ��/����!��ӭС������������������ǿ�ٴ��Ի�!��սP2�̶������ȶ�ѡ��")

    drink()
    --��ʼ����
    move(124.939,-116.089,-0.8645)--�۲������λ
    watchLobster()

    move(124.939,-116.089,-0.8645)
    castSpellA("��������(�ȼ� 5)")
    move(122.52,-110.033,-0.794826 )
    move(94.2386,-89.2036,-2.71253)
    move(65.7763,-73.9397,-3.93717)--��һ����ѩ
    sleep(100)
    stormLobster1()
    move(63.1481,-71.8084,-3.96471 )--����
    castSpellA("������")
    move(36.4872, -53.8166, -3.20747 )
    move(21.9444,-43.8772, -3.90103 )--�ڶ�����ѩ
    sleep(100)
    stormLobster2()

    move(23.2283,-32.6406,-1.02073 )
    castSpellA("��˪����(�ȼ� 1)")
    move(13.8081,-6.57001,-1.54462)--��Ծ��Ϊ��
    jumpA(8.13143,-1.20081,-0.887246) --������״
    move(-0.645283,10.2394,2.96381)
    move(-26.6161,27.4639,2.2147)
    castSpellA("��������(�ȼ� 5)")
    move(-45.59,21.923,-1.10631) --��ʿ�����ж�
    patrolBraveStop()
    move(-78.1637,6.80497,-4.54459)--��ʿ�����ж�
    patrolBraveSlience()
    move(-91.819,-5.91063,-8.01405)--��ʿ�����ж�
    patrolBraveStop()
    move(-105.891,-15.4141,-7.78536)--��ʿ�����ж�
    patrolBraveStop()
    move(-108.334, -28.7902, -4.02367)--��ʿ�����ж�
    patrolBraveStop()
       
    move(-106.595,-34.6006,-3.58998)--��һ��Ѳ�߹ֱ���
    patrolBraveStop()
    move(-105.378,-42.5621,-3.27367)--����
    castSpellA("������")
    move(-102.409,-65.0945,-2.90705 )--��ѩ
    sleep(100)
    firstLevelStormGathered(-104.997,-44.8355,-3.19386)
    move(-100.835,-81.7564,-3.71117 )--��
    castSpellA("��������(�ȼ� 5)")
    move(-98.6018,-125.2,-125.2)
    move(-84.7412,-124.506,-1.53335)--ת��
    move(-80.7025,-130.196,-1.5812)
    move(-64.5776,-132.752,-1.58873)
    move(-51.9185,-144.911,-1.57472)
    move(-40.774,-161.321,-1.57441) --����
    move(-25.7016,-189.866,-2.3059)--����
    castSpellA("������")

    move(-14.2572,-217.355,-1.58922)--����
    move(-12.3031,-235.201,-1.60556)
    castSpellA("��������(�ȼ� 7)")
    move(-8.54631,-274.631,-0.534612)--ѡ��Ŀ�귴��
    silence("����������Ϻ��",5.4219, -257.777)
    move(-9.11416,-285.24,-1.08062)
    castSpellA("��������(�ȼ� 5)")
    move(-6.72458,-296.899,3.02885)
    useItem("������ˮ��")
    move(-3.74734,-301.4,3.03803)--����
    castSpellA("��˪����(�ȼ� 1)")
    move(9.16583,-305.124,3.03621)--����
    castSpellA("������")
    move(30.3688,-312.673,3.03559)--��ѩ1
    sleep(100)
    firstLevelStormGathered1(6.67683,-306.907,3.03559)
    move(36.6403,-313.956,3.03727)--��ѩ2
    sleep(100)
 
    firstLevelStormGathered(14.3523,-309.649,3.03683)
    move(42.5877,-315.003,3.03932)--��ѩ
    sleep(100)
    firstLevelStormGathered(23.3329,-312.295,3.03683)
    move(44.1911,-315.269,3.03945)--ˮԪ��
    summonStopMinion1(23.3329,-312.295,3.03683)
    move(50.7804,-317.205,3.03951)--ˮԪ�ز�����
    summonStopMinion2()
    move(89.9651,-323.008,3.03548)--��ѩ����߹�
    sleep(100)
    skipStorm(118.274,-304.224,3.03571)
    sleep(1400)
    move(75.408,-338.806,3.03572)
    castSpellA("��������(�ȼ� 5)")
    move(73.3535,-337.869,3.03572)--��ǰ�Һ�λ��
    jump(72.3069,-337.145,6.05351) --����ȥ
    move(72.1468,-337.443,6.07123 )--���ұ���һ��
    attackTechnicianNotUnderBridge()--��������Ѳ��������ʦ
    useLua("/run PetDismiss()")
    move(71.3389,-338.800,6.07123)--����
    if getRoleflag1() == 0x08 then
        iceBlock()
        sleep(11000)
        attackTechnician()--��������ʦ
        jumpB()
        skip() --������̣��������ٻ�ȥ
        sleep(4000)
        moveB(71.3389,-338.800,6.07123)--�жϹ���λ��
        sleep(400)
        checkDistanceBetweenMinion1()
        move(81.3059,-353.019,3.03577)--��ϼ�ʦ����
        silenceTechnician()

        move(92.6425,-371.707,3.03568)--��̨���������ܵ��м�
        castSpellA("��������(�ȼ� 5)")
        move(88.8848,-392.935,3.03572)--��ѩһ��
        sleep(100)
        isMinionInPosition(67.0139,-413.785,3.03564)
        --sleep(7000)
        move(93.6898,-388.816,3.03572)--��ѩ����
        sleep(100)
        secondTimeMaxLevelStorm(74.0525,-418.013,3.03562)
        move(92.3513,-383.009,3.03567)--����
        castSpellA("������")
        move(76.6604,-340.2,3.03572)--��ǰ�Һ�λ��
        castSpellB("��ʦ����(�ȼ� 3)")
        move(73.0281,-338.579,3.03572)
        jump(71.868,-338.043,6.07048)-- --����ȥ
        move(71.7322,-338.334,6.07123)
        move(71.7322,-338.334,6.07123)
        moveB(72.1468,-337.443,6.07123)--�ȴ����ﵽλ
        sleep(400)
        checkDistanceBetweenMinion1()
        moveA(81.3059,-353.019,3.03577)--��ϼ�ʦ����
        silenceTechnician()
        moveA(89.8669,-368.355,3.03565 )
        castSpellA("������")
        moveA(117.651,-418.639,3.03501)--��ѩ
        sleep(100)

        castSpellB("����ѩ(�ȼ� 1)")
        sleep(5)
        castSpellPosition(127.208,-448.286,3.03409)
        sleep(1200)
        moveA(109.518,-400.424,3.03563)
        castSpellA("��������(�ȼ� 5)")
        moveA(88.1915,-360.504,3.03563)--����
        castSpellA("������")
        moveA(76.6604,-340.2,3.03572)--��ǰ�Һ�λ��
        moveA(73.0281,-338.579,3.03572)
        jump(71.868,-338.043,6.07048)--��Ծ��
        move(71.7322,-338.334,6.07123)
        moveB(72.1468,-337.443,6.07123 ) --�ж�λ��
        sleep(400)
        checkDistanceBetweenMinion1()
    end           
    for i = 1, 50, 1 do
        flag1 = getRoleflag1()
        if  flag1 == 0x08 then --��ս���о�ѭ��ս��
            
            move(81.3059,-353.019,3.03577)--��ϼ�ʦ����
            silenceTechnician()
            move(92.6425,-371.707,3.03568)--��̨���������ܵ��м�
            shield()
            move(88.8848,-392.935,3.03572)--��ѩһ��
            sleep(100)
            useLua("/party follow1") --��С�Ž���
            isMinionInPosition(67.0139,-413.785,3.03564)
            --sleep(7000)
            flag1 = getRoleflag1()
            if flag1 == 0x00 then
                break
            end
            move(92.9172,-391.322,3.03429)--��ѩ����
            sleep(100)
            secondTimeMaxLevelStorm(74.0525,-418.013,3.03562)
            flag1 = getRoleflag1()
            if flag1 == 0x00 then
                break
            end
            move(92.3513,-383.009,3.03567)--����
            castSpellA("������")
            moveB(76.6604,-340.2,3.03572)--��ǰ�Һ�λ��
            --removeDebuff()
            move(76.6604,-340.2,3.03572)--��ǰ�Һ�λ��
            move(73.0281,-338.579,3.03572)
            jump(71.868,-338.043,6.07048)-- --����ȥ
            move(71.7322,-338.334,6.07123)
            sleep(100)
            moveB(72.0574,-336.379,6.11707)--�ȴ����ﵽλ
            sleep(800)
            jumpB()
            sleep(1000)
            checkDistanceBetweenMinion1()
            useLua("/party follow3") --��С�Ž���
        elseif flag1 == 0 or flag1 == 0x04 then --��ս�˾�����
            break
        end
    end










        -- 4. ʰȡ
        useLua("/party follow2") --��С�ų���
        moveA(92.6425,-371.707,3.03568)
        moveA(77.8577,-417.692,3.03567)
        pickUp()
        moveA(73.118,-411.031,3.03567)
        treasure2()
        moveA(99.6179,-384.6,3.03567)
        moveA(92.966,-353.43,3.03567)
        -- 5. ��������(���ӳٵȴ�����)
        -- 6. ���ø���
        -- 9. ��������һ��ѭ��
        move(90.1411,-346.429,3.03587)
        treasure1()
        move(69.9503,-325.795,3.03587)
        move(61.2938,-323.035,3.03675)
        castSpellA("������")
        useLua("/party follow2") --��С�ų���  
        move(-4.86042,-298.799,3.09008)
        move(-15.6062,-294.427,2.05401)
        ore2()
        move(-17.175,-264.773,-1.54152)
        move(-19.7396,-238.948,-2.09964)
        castSpellA("������")
        move(-23.0183,-200.569,-1.8485)
        ore()
        useItem("��������")
        unusedBag = getUnusedAllBagSlotNum()--��ñ���ʣ��ĸ�����Ŀ
        headDuration = getEquipementDurationBySlotNum(1)
        if unusedBag > 11 and headDuration >= 20 then --���װ�����죬����û�����ͳ�������
        move(-24.7437,-188.624,-2.29001)
        castSpellA("��������(�ȼ� 5)")
        move(-34.3342,-173.13,-1.99026)
        move(-48.1653,-154.69,-1.50054)
        move(-56.5378,-142.109,-1.50338)
        move(-64.6081,-132.587,-1.58817)
        move(-79.2262,-128.238,-1.58817)
        move(-84.7866,-126.296,-1.4106)--ת��
        move(-84.693,-122.035,-1.6431)
        move(-100.381,-114.026,-3.1505)--����ڻ���
        --move(-92.919,-104.732,-4.66746)
        move(-99.8795,-75.2492,-3.17315)
        castSpellA("������")
        move(-112.841,-27.5825,-5.12581)
        move(-101.386,-1.84192,-8.18317)
        move(-81.3684,5.08273,-5.30549)
        castSpellA("��������(�ȼ� 5)")
        move(-67.7587,16.005,-1.64567)
        move(-51.5569,19.9881,-1.59056)
        move(-35.0662,26.2707,0.81196)
        move(-24.2441,25.6233,2.4764)
        move(-15.1319,18.4538,3.47812)
        move(-2.79508,7.07245,0.243307)
        move(2.12491,-8.60073,-1.33743)
        move(1.78749,-19.1488,-1.66041)
        move(10.5015,-26.6059,-1.45648)
        castSpellA("������")
        move(35.2148,-39.596,-1.04909)
        castSpellA("��˪����(�ȼ� 1)")
        move(45.9989,-47.0182,-1.37307)
        move(67.9588,-63.0631,-2.12291)
        move(80.6393,-74.993,-3.21888)
        move(92.69,-85.6395,-3.00291)
        move(106.908,-97.9534,-1.59057)
        move(117.858,-107.4,-1.59057)
        move(125.212,-122.238,-0.992671)
        moveB(120.223,-138.426,-0.821922)
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        useLua("/run ResetInstances()") --����
        sleep(1000)
    
    elseif unusedBag <= 11 or headDuration < 20 then --���װ�����˻��߱������˻س�����
        if unusedBag ~= -1 and headDuration ~= -1 then  --�ٴ���֤�����Ƿ�ɹ�
        
        -- 5. ¯ʯ(���ӳٵȴ���������������20s����)
        sleep(3000)
        useItem("¯ʯ")
        waitForLoading()--�ȴ����� �� ������������
        -- 6. ���ø���
        --useLua("/run ResetInstances()") --����
        sleep(1000)   
        -- 8. ǰ�����������������
        moveA(234.317,7920.04,25.0776)
        moveA(240.032,7906,25.7801)
        moveA(240.032,7906,25.7801)
        useItem("��ɫ½����")
        useItem("˪���ƽ��ߵĺŽ�")    
        sleep(3500)
        moveA(257.147,7864.96,23.12)
        moveA(277.048,7861.91,24.5074)
        moveA(287.956,7851.34,22.3817)
        moveA(321.68,7850.33,22.7926)
        moveA(323.501,7843.37,22.3667)
        ID1,ID2 = getClosetTargetIDFilterName("����²��٪��",3,8)
        contactTarget(ID1,ID2)
        sleep(1000) --�ȴ����������
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
        castSpellB("������")
        moveA(488.224,7244.35,16.7861)
        castSpellB("������")
        moveA(522.165,7055.7,16.8074)
        castSpellB("������")
        moveA(544.161,6961.94,16.7637)
        castSpellB("������")
        moveA(550.472,6957.96,9.62258)
        castSpellB("������")
        moveA(570.18,6939.38,-21.9679)
        castSpellB("������")
        moveA(581.349,6938.73,-39.9977)
        castSpellB("������")
        moveA(608.24,6908.64,-47.6687)
        castSpellB("������")
        moveA(608.09,6908.6,-47.6738)
        moveA(614.375,6890.87,-56.2252)
        moveA(627.688,6878.41,-71.2822)
        moveA(641.199,6868.34,-80.1888)
        moveA(665.759,6866.15,-78.4772)
        moveA(665.759,6866.15,-72.2003)
        moveA(709.469,6914.38,-67.8285)
        castSpellB("������")
        moveA(720.006,6950.8,-68.0424)
        castSpellB("������")
        moveA(717.492,6990.01,-73.0739)
        castSpellB("������")
        moveA(733.508,7012.31,-72.6895)
        useLua("/run ResetInstances()") --����
        sleep(1000)
             -- 7. ǰ��������Ź���
             -- 9. ��ȥ�����ſڹ���
             -- 10. ���ø���
             -- 11. ��������һ��ѭ��
        end
    end   
 
else -- ������ϴ������״̬��Debuff(��������)
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,248.645,7084.57)--�����¯ʯ
    if mapDistance1 <= 40 and mapDistance1 >= 0 then --�����¯ʯ then
        moveA(248.339,7084.93,36.4931)
        moveA(250.472,7070.83,36.4321)
        moveA(289.945,7058.72,35.8072)
        moveA(335.873,7041.86,18.2696)
        moveA(392.145,7017.98,18.2689)
        moveA(422.403,7005.16,18.2691)
        prints("a:��ʼ׼�����״̬Ǳˮ")
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
        sleep(1000) --�ȴ����������
        moveA(625.733,6880.79,-70.6405)
        moveA(633.662,6868.47,-77.6463)
        moveA(658.132,6865.01,-83.3429)
        moveA(683.197,6879.15,-70.5428)
        moveA(707.939,6914.73,-67.9848)
        moveA(724.224,6953.45,-67.0945)
        moveA(718.469,6987.9,-73.0748)
        moveA(728.51,7011.19,-72.2453)
        moveB(743.192,7014.06,-72.7946)
        prints("a:���״̬����")
        waitForLoadingPosition(743.192,7014.06,-72.7946)
        moveB(120.223,-138.426,-0.821922)
        prints("a:���״̬����")
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        sleep(2000)
    end
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,335.886,7625.12)--�����¯ʯ
    if mapDistance1 <= 40 and mapDistance1 >= 0 then --�����¯ʯ then
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
        prints("a:���״̬����")
        waitForLoadingPosition(743.192,7014.06,-72.7946)
        moveB(120.223,-138.426,-0.821922)
        prints("a:���״̬����")
        waitForLoadingPosition(120.223,-138.426,-0.821922)
        sleep(2000)
    end

end

