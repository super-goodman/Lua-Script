
maxShieldID = 11426  --��ǰ��󺮱����巨��ID


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






function main()
    moveA(-5235.07,-1482.82,498.906)
    prints("ֻ��һ���ص�ſ���ˢ������-5235.07,-1482.82,498.906")
    for i = 1, 100, 1 do
        castSpellA("ħ����(�ȼ� 1)")
        sleep(1500)
        if IsBuffExist(maxShieldID) == 0 and  getSpellCoolDown(maxShieldID) == 1  then
            castSpellA("��������(�ȼ� 1)")
        end
        if getRoleCurrentMP() < 35 then
            castSpellA("����")
            sleep(8000)
        end
    end
end

main()