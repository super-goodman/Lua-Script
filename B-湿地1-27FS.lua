
maxWaterLevel = 8 --���ˮ����ȼ�
maxBreadLevel = 7 --�����������ȼ�
maxLevelWaterName = "ħ��ɽȪˮ"  --ʹ��ˮ����
maxLevelBreadName = "ħ��������" --ʹ���������
maxLevelWaterCreatorID = 30703   --ʹ��ˮ��ƷID
maxLevelBreadCreatorID = 22895   --ʹ�������ƷID
maxLevelWaterBUFFID = 34291      --ʹ��ˮBUFFID
maxLevelBreadBUFFID = 29073      --ʹ�����BUFFID
maxShieldBuffID = 27125  --���ʦ����ID
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
   -- prints(string.format("%d,%x,%d,%d"),getGlobalFlag(),getRoleflag1(),(getRoleCurrentHP() < 95 or getRoleCurrentMP() < 95),(getThreadTime() - time))
    while getGlobalFlag() == 1 and getRoleflag1() ~= 0x04 and (getRoleCurrentHP() < 95 or getRoleCurrentMP() < 95) and (getThreadTime() - time) < 50 do
        if IsBuffExist(maxLevelWaterBUFFID) == 0 and getRoleCurrentMP() < 95 then
            useItem(maxLevelWaterName)
        end
        if IsBuffExist(maxLevelBreadBUFFID) == 0 and getRoleCurrentHP() < 95 then
            useItem(maxLevelBreadName)
        end
    end
end

function findEnemy()
    if getGlobalFlag() ~= 1 then
        return
    end
    ID1,ID2,x,y = getClosetTargetIDFilterNameNoDead("��",3)
    rotateA(x,y)
    chooseTarget(ID1,ID2)

    castSpellA("��ǹ��")
    sleep(1500)
    castSpellA("��ǹ��")
end


--�ȴ���ս
function waitForGetRidOfBattle()
    if getGlobalFlag() ~= 1 then
        return 0
    end
    local time = getThreadTime()
    while getRoleflag1() == 0x08 and getGlobalFlag() == 1 and (getThreadTime() - time) < 80 do
        --ID1,ID2,x,y = getClosetTargetToAPositionFilterNameNoDead("з|Ϲ",-10945.8,2115.75,3)
        ID1,ID2,x,y = getClosetTargetIDFilterInBattle("��",3)
        rotateA(x,y)
        chooseTarget(ID1,ID2)
        castSpellA("��ǹ��")
        sleep(1000)
    end
    prints("��ս�ɹ�,�ȴ�������ʧ")


end

function main()
    prints("��ʼʪ�عһ���ǧ��ǵ���ǰ����5��Ժȣ���������:-4141.5,-2946.58,11.5809(��Ϸ��61,72)")
    prints("����ص㶼���Կ�����ֻҪ������ˢ�ֵĵ㶼����")
 
    --moveA(-4141.5,-2946.58,11.5809)
    for i = 1, 100, 1 do
        if getGlobalFlag() ~= 1 then
            return
        end
        findEnemy()
        sleep(700)
        if getRoleCurrentMP() < 40 then
            waitForGetRidOfBattle()
            drink()
        end
        if IsBuffExist(maxShieldBuffID) == 0 and  getSpellCoolDown(maxShieldBuffID) == 1  then
            castSpellA("��ʦ����")
            return
        end
    end
end


main()