function decompose()
    for i=1,4,1 do --循环将所有副背包的物品都放入,直到填满邮件
        bagNum = getBagSlotNum(i) --获得背包的大小
        unUsedSLot = getUnusedBagSlotNum(i)--获得所有背包剩余的空格子
        if bagNum-unUsedSLot > 0 then --如果背包中有东西
            for k = 1,bagNum,1 do --尝试将背包中的每个格子都放入邮箱，没有就不放，有就会放进去
                
                castSpellB("分解")
               --useLua("print("正在分解")"..)
                sleep(100)
                useItem(tostring(i).." "..tostring(k))
                sleep(3200) -- 略微延迟，防止发邮件卡住
            end
            
        end
    end
end

decompose()