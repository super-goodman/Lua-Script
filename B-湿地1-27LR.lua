
function findEnemy()
    if getGlobalFlag() ~= 1 then
        return
    end
    ID1,ID2,x,y = getClosetTargetIDFilterNameNoDead("��",3)
    rotateA(x,y)
    chooseTarget(ID1,ID2)
    castSpellA("����")
    castSpellA("�Զ����")
    castSpellA("�������")
    useLua("/petattack")
end

--�ȴ���ս
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        sleep(1000)
    end
    prints("��ս�ɹ�,�ȴ�������ʧ")


end


function main()
    prints("��ʼʪ�عһ� ����һ���������������ͼ��ѹ�:ǿ������ �����乭����������㴩һ�ѳ���������Ĺ����Ϳ��Թһ�һ���ϣ����Դӵ�����ϱ����ڹ������˴���ã�������������3��ħ�������� ���� ħ�������� ���� ������ -4227.35,-2708.51,41.6954 ����ص㶼���Կ���")
    local headDuration = getEquipementDurationBySlotNum(18)
    if headDuration < 10 then
        useLua("/equip ǿ����")
        headDuration = getEquipementDurationBySlotNum(18)
        if headDuration < 10 then
            useLua("/equip �����乭")
        end
    end
    local happniess = getLuaReturn("GetPetHappiness()")
    prints(happniess)
    if happniess == "2"  or happniess == "1"  then
        prints("�ó��￪����")
        waitForGetRidOfBattle()
        sleep(3000)
        waitForGetRidOfBattle()
        useLua("/cast ι������")
        useLua("/use ħ��������")
        useLua("/use ħ��������")
        useLua("/use ������")
      
        sleep(10000)
    end
   
    for i = 1, 700, 1 do
        --prints(getLuaReturn("GetPetHappiness()"))
        if getGlobalFlag() ~= 1 then
            return
        end
        findEnemy()
        sleep(500)
    end



end


main()