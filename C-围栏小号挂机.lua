globalFlagSet(1)
function waitMagic() --小号等待魔法师
    local ID1,ID2,ID3,ID4 = 0,0,0,0
    local distance1,distance2 = 0,0
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04  do
        ID1,ID2 = getClosetTargetIDToAPositionFilterName("盘牙魔法师",-71.736, -159.968,3, 8)
        ID3,ID4 = getClosetTargetIDToAPositionFilterName("盘牙魔法师",-37.4429, -168.425,3, 8)
        if ID1 == 0 then
            return 0
        end
        distance1 = getTargetAndPositionDistanceByID(ID1,ID2,-71.736, -159.968,3)
        distance2 = getTargetAndPositionDistanceByID(ID3,ID4,-37.4429, -168.425,3)
        if distance1 >= 30 and distance2 >= 40 and distance1 ~= 0 then
            return 0
        end
        sleep(1000)
    end
end

function waitWatcher1(distance,x,y) --小号等待监工
    local ID1,ID2,ID3,ID4 = 0,0,0,0
    local distance1,distance2 = 0,0
    while getRoleCurrentHP() ~= -1 and getRoleflag1() ~= 0x04  do
        ID1,ID2 = getClosetTargetIDToAPositionFilterName("盘牙监工",x, y,3, 8)
        distance1 = getTargetAndPositionDistanceByID(ID1,ID2,x,y,3)
        --distance1 = getTargetAndRoleDistanceByID(ID1,ID2,3)
        if distance1 >= distance then
            ID1,ID2 = getClosetTargetIDToAPositionFilterName("盘牙监工",x, y,3, 8)
            distance1 = getTargetAndPositionDistanceByID(ID1,ID2,x,y,3)
            sleep(500)
            ID3,ID4 = getClosetTargetIDToAPositionFilterName("盘牙监工",x,y,3, 8)
            distance2 = getTargetAndPositionDistanceByID(ID1,ID2,x,y,3)
            if  distance2 > distance1 then
                return 0
            end
        end
        sleep(50)
    end
end




function move(x,y,z) --改写过的移动
    local x1,y1,z1 = getRolePosition()
    local n = 0
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04 do
        moveB(x,y,z)
        if getRoleCurrentHP() < 15 then
            useItem("特效治疗药水")
        end
        if getRoleCurrentMP() < 14 then
            useItem("特效法力药水")
        end
        sleep(40)
        n = n + 1
        if n >= 750 then
            moveB(x+1,y+1,z)
            sleep(100)
            jumpB()
            sleep(650)
            jumpB()
            n1 = 0
        end
        x1,y1,z1 = getRolePosition()
    end
end

function jump(x,y,z)
    local x1,y1,z1 = getRolePosition()
    while getDistanceBetween(x1,y1,x,y) > 0.8 and getRoleCurrentMP() ~= -1 and getRoleflag1() ~= 0x04 do
        moveB(x,y,z)
        jumpB()
        --useLua("/run JumpOrAscendStart()")
        if getRoleCurrentHP() < 15 then
            useItem("特效治疗药水")
        end
        for i = 1, 15, 1 do
            moveB(x,y,z)
            sleep(40)
        end
     
        x1,y1,z1 = getRolePosition()
    end
end


function callBack()
    name,chat = getChatInfoByType(49) --获得队长的信息
    name1,chat1 = getChatInfoByType(1) --获得队长的信息
    if chat == "follow1" or chat1 == "follow1" then
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,743.192,7014.06)--如果在炉石
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
           
            moveB(743.192,7014.06,-72.7946)
            waitForLoading()
            --prints("进本结束")
        end
    end
    if chat == "follow2" or chat1 == "follow2" then
        
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,120.223,-138.426)--如果在炉石
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            --prints("出本")
            moveA(121.171,-130.215,-0.838217)
            moveB(120.223,-138.426,-0.821922)
            waitForLoading()
            --prints("出本结束")
        elseif getDistanceBetween(x,y,69.9503,-325.795) <= 40 and getDistanceBetween(x,y,69.9503,-325.795) >= 0 then
            --prints("跑出本")
            move(69.9503,-325.795,3.03587)
            move(61.2938,-323.035,3.03675)
            castSpellA("闪现术")
            move(-4.86042,-298.799,3.09008)
            move(-15.6062,-294.427,2.05401)
            move(-17.175,-264.773,-1.54152)
            move(-19.7396,-238.948,-2.09964)
            castSpellA("闪现术")
            move(-23.0183,-200.569,-1.8485)
            move(-24.7437,-188.624,-2.29001)
            castSpellA("寒冰护体(等级 6)")
            move(-34.3342,-173.13,-1.99026)
            move(-48.1653,-154.69,-1.50054)
            move(-56.5378,-142.109,-1.50338)
            move(-64.6081,-132.587,-1.58817)
            move(-79.2262,-128.238,-1.58817)
            move(-84.7866,-126.296,-1.4106)--转交
            move(-84.693,-122.035,-1.6431)
            move(-100.381,-114.026,-3.1505)--火焰节火炬点
            --move(-92.919,-104.732,-4.66746)
            move(-99.8795,-75.2492,-3.17315)
            castSpellA("闪现术")
            move(-112.841,-27.5825,-5.12581)
            move(-101.386,-1.84192,-8.18317)
            move(-81.3684,5.08273,-5.30549)
            castSpellA("寒冰护体(等级 6)")
            move(-67.7587,16.005,-1.64567)
            move(-51.5569,19.9881,-1.59056)
            move(-35.0662,26.2707,0.81196)
            move(-24.2441,25.6233,2.4764)
            move(-15.1319,18.4538,3.47812)
            move(-2.79508,7.07245,0.243307)
            move(2.12491,-8.60073,-1.33743)
            move(1.78749,-19.1488,-1.66041)
            move(10.5015,-26.6059,-1.45648)
            castSpellA("闪现术")
            move(35.2148,-39.596,-1.04909)
            castSpellA("冰霜新星(等级 1)")
            move(45.9989,-47.0182,-1.37307)
            move(67.9588,-63.0631,-2.12291)
            move(80.6393,-74.993,-3.21888)
            move(92.69,-85.6395,-3.00291)
            move(106.908,-97.9534,-1.59057)
            move(117.858,-107.4,-1.59057)
            move(125.212,-122.238,-0.992671)
            moveB(120.223,-138.426,-0.821922)
            waitForLoading()
            --prints("跑出本结束")
        end
    end
    if chat == "follow3" or chat1 == "follow3" then
 
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,120.617,-123.455)--如果在炉石
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            --prints("跑进本")
            move(120.617,-123.455,0.101573)
            move(126.337,-118.982,-1.26321)
            move(126.337,-118.982,-1.26321)
            move(122.52,-110.033,-0.794826 )
            move(94.2386,-89.2036,-2.71253)
            move(65.7763,-73.9397,-3.93717)
            move(63.1481,-71.8084,-3.96471 )
            move(36.4872, -53.8166, -3.20747 )
            move(21.9444,-43.8772, -3.90103 )
            move(23.2283,-32.6406,-1.02073 )
            move(13.8081,-6.57001,-1.54462)
            waitWatcher1(4,-24.4727, -1.91938)
            jump(9.31632,-2.35937,-1.09519)
            move(-0.645283,10.2394,2.96381)--]]
            move(-26.6161,27.4639,2.2147)
            waitWatcher1(5,-46.3704, 1.5132)
            move(-45.59,21.923,-1.10631)
            waitWatcher1(3,-68.5778, -14.6931)
            move(-82.0672,3.86863,-5.59913)
            move(-91.5474,3.09776,-6.11251)
            move(- 114.903,-8.98928,-8.77723 )
            move(-105.378,-42.5621,-3.27367)
            move(-102.409,-65.0945,-2.90705 )
            move(-85.0828,-113.023,-3.05488 )
            waitMagic()
            move(-88.4479,-117.586,-1.92662)
            move(-84.7412,-124.506,-1.53335)
            move(-80.7025,-130.196,-1.5812)
            move(-64.5776,-132.752,-1.58873)
            move(-51.9185,-144.911,-1.57472)
            move(-40.774,-161.321,-1.57441)
            move(-25.7016,-189.866,-2.3059)
            move(-3.77401,-207.311,-1.56993)
            move(10.4421,-225.071,-1.5817)
            move(14.7652,-244.188,0.868485)
            move(8.01266,-263.866,1.53593)
            move(-1.5733,-273.841,0.472907)
            move(-7.99595,-286.25,-1.14089)
            move(-9.97003,-293,2.59457)
            move(-5.18369,-305.438,3.04033)
            move(10.6327,-310.216,3.03575)
            move(30.6836,-314.545,3.03575)
            move(50.125,-318.767,3.037)
            move(65.0174,-320.47,3.04095)
            move(77.8158,-321.277,3.04188)
            move(87.5187,-320.991,3.03599)
            --prints("跑进本结束")
        elseif  getDistanceBetween(x,y,87.5187,-320.991) <= 40 and getDistanceBetween(x,y,87.5187,-320.991) >= 0 then
            --prints("上buff")
            ID1,ID2 = getClosetTargetIDFilterLevel(70,4)
            chooseTarget(ID1,ID2)
            castSpellA("魔法抑制(等级 1)")
            castSpellA("智慧祝福(等级 1)")
            castSpellA("恢复(等级 1)")
        end
    end


end

n = 0


if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
    for i = 1, 2, 1 do
        prints("检测中")
        callBack()
        sleep(3000)
    end
    jumpB()     
else
    roleX,roleY,roleZ = getRolePosition()
    mapDistance1 = getDistanceBetween(roleX,roleY,248.645,7084.57)--如果在炉石
    if mapDistance1 <= 40 and mapDistance1 >= 0 then --如果在炉石 then
        moveA(248.339,7084.93,36.4931)
        moveA(250.472,7070.83,36.4321)
        moveA(289.945,7058.72,35.8072)
        moveA(335.873,7041.86,18.2696)
        moveA(392.145,7017.98,18.2689)
        moveA(422.403,7005.16,18.2691)
        prints("a:开始准备灵魂状态潜水")
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
                sleep(1000) --等待打开修理界面
                moveA(625.733,6880.79,-70.6405)
                moveA(633.662,6868.47,-77.6463)
                moveA(658.132,6865.01,-83.3429)
                moveA(683.197,6879.15,-70.5428)
                moveA(707.939,6914.73,-67.9848)
                moveA(724.224,6953.45,-67.0945)
                moveA(718.469,6987.9,-73.0748)
                moveA(728.51,7011.19,-72.2453)
                moveB(743.192,7014.06,-72.7946)
                prints("a:灵魂状态进本")
                waitForLoadingPosition(743.192,7014.06,-72.7946)
                moveB(120.223,-138.426,-0.821922)
                prints("a:灵魂状态出本")
                waitForLoadingPosition(120.223,-138.426,-0.821922)
                sleep(2000)
    end
    x,y,z = getRolePosition()
    mapDistance1 = getDistanceBetween(x,y,335.886,7625.12)--如果在炉石
    if mapDistance1 <= 40 and mapDistance1 >= 0 then

        name,chat = getChatInfoByType(49) --获得队长的信息
        name,chat = getChatInfoByType(1) --获得队长的信息
        moveA(335.886,7625.12,22.7486)
        moveA(383.34,7567.48,22.0386)
        moveA(388.64,7535.66,17.9626 )
        moveA(404.517,7449.27,18.2695)
        --IDa,IDb = getClosetTargetID(4)
        --chooseTarget(IDa,IDb)
        --contactTarget(IDa,IDb)
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
        waitForLoading()
        moveA(121.171,-130.215,-0.838217)
        moveB(120.223,-138.426,-0.821922)
        waitForLoading()
        name,chat = getChatInfoByType(49) --获得队长的信息
        name,chat = getChatInfoByType(1) --获得队长的信息
    end
end