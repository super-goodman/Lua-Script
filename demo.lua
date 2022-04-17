


function getTaxiNodeNameBySlot(slot)
    --当前地图飞机节点信息基址
    currentTaxiNodeBase = R8(0x7ff74d97da70)
    --飞机节点基址
    taxiNodeBase = R8(0x7ff74da34720 + 0x140)
    --下面是根据slot获得对应飞机节点在DB数据库中的索引
    rdx = R4(currentTaxiNodeBase + (slot-1)*0x28)
    eax = rdx
    eax = eax-R4(taxiNodeBase+0x38)
    ecx = eax
    eax = R8(taxiNodeBase+0x78)
    edx = R1(ecx+eax)
    eax = edx * R4(taxiNodeBase+0x30)
    --获得DB的地址与索引
    dbAddr = eax+R8(taxiNodeBase+0x8)
    dbIndex = R4(dbAddr)
    --返回名字
    return RSTRING(dbAddr+dbIndex,30)
end
debug_prints("name = %s",getTaxiNodeNameBySlot(2))




