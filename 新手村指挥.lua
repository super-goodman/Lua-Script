function chat()
    local name,chat = getChatInfoByType(49) --获得队长的信息
    local ID1,ID2 = 0,0
    local x,y,z,distance = 0,0,0,0
    if chat == "follow1" then
        ID1,ID2 = getClosetTargetID(3)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance <= 10 then
            contactTarget(ID1,ID2)
            sleep(1000)
        end

    elseif chat == "follow2" then
        ID1,ID2 = getClosetTargetID(6)
        distance = getTargetAndRoleDistanceByID(ID1,ID2,6)
        if distance <= 10 then
            contactTarget(ID1,ID2)
            sleep(5000)
        end
    end
end

while getRoleCurrentMP() ~= -1 do
    chat()
    if getRoleflag1() ~= 0x08 then
        ID1,ID2 = getClosetTargetIDFilterLevel(70,4)
        x,y,z = getTargetPositionByID(ID1,ID2,4)
        moveA(x,y,z)
    end
    sleep(100)
end
