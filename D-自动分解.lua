function decompose()
    for i=1,4,1 do --ѭ�������и���������Ʒ������,ֱ�������ʼ�
        bagNum = getBagSlotNum(i) --��ñ����Ĵ�С
        unUsedSLot = getUnusedBagSlotNum(i)--������б���ʣ��Ŀո���
        if bagNum-unUsedSLot > 0 then --����������ж���
            for k = 1,bagNum,1 do --���Խ������е�ÿ�����Ӷ��������䣬û�оͲ��ţ��оͻ�Ž�ȥ
                
                castSpellB("�ֽ�")
               --useLua("print("���ڷֽ�")"..)
                sleep(100)
                useItem(tostring(i).." "..tostring(k))
                sleep(3200) -- ��΢�ӳ٣���ֹ���ʼ���ס
            end
            
        end
    end
end

decompose()