


function getTaxiNodeNameBySlot(slot)
    --��ǰ��ͼ�ɻ��ڵ���Ϣ��ַ
    currentTaxiNodeBase = R8(0x7ff74d97da70)
    --�ɻ��ڵ��ַ
    taxiNodeBase = R8(0x7ff74da34720 + 0x140)
    --�����Ǹ���slot��ö�Ӧ�ɻ��ڵ���DB���ݿ��е�����
    rdx = R4(currentTaxiNodeBase + (slot-1)*0x28)
    eax = rdx
    eax = eax-R4(taxiNodeBase+0x38)
    ecx = eax
    eax = R8(taxiNodeBase+0x78)
    edx = R1(ecx+eax)
    eax = edx * R4(taxiNodeBase+0x30)
    --���DB�ĵ�ַ������
    dbAddr = eax+R8(taxiNodeBase+0x8)
    dbIndex = R4(dbAddr)
    --��������
    return RSTRING(dbAddr+dbIndex,30)
end
debug_prints("name = %s",getTaxiNodeNameBySlot(2))




