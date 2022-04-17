

function callBack()
    name,chat = getChatInfoByType(49) --获得队长的信息
    name1,chat1 = getChatInfoByType(1) --获得队长的信息
    if chat == "follow1" or chat1 == "follow1" then
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,1818.68,-4425.61)--NY
        if mapDistance1 <= 40 and mapDistance1 >= 0 then 
            prints("NY副本外开始进入副本")
            moveA(1816.29,-4421.4,-19.3299)
            moveB(1818.68,-4425.61,-20.313)
            waitForLoadingPosition(1818.68,-4425.61,-20.313)
            prints("NY副本外成功进入副本")
        end
        mapDistance1 = getDistanceBetween(x,y,-231.412,1570.74)--YY
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("YY副本外开始进入副本")
            moveA(-232.049,1569.54,76.8921)
            moveB(-231.412,1570.74,76.8921)
            waitForLoadingPosition(-231.412,1570.74,76.8921)
            prints("YY副本外成功进入副本")
        end
        mapDistance1 = getDistanceBetween(x,y,2919.92,-822.062)--XS
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("XS副本外开始进入副本")
            moveA(2917.04,-822.804,160.327)
            moveB(2919.92,-822.062,160.327)
            waitForLoadingPosition(2919.92,-822.062,160.327)
            prints("XS副本外成功进入副本")
        end
        mapDistance1 = getDistanceBetween(x,y,-1184.72,2869.68)--MLD
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("MLD副本外开始进入副本")
            moveA(-1182.79,2873.51,85.8051)
            moveB(-1184.72,2869.68,85.6133)
            waitForLoadingPosition(-1184.72,2869.68,85.6133)
            prints("MLD副本外成功进入副本")
        end
        mapDistance1 = getDistanceBetween(x,y,-7178.26,-927.956)--黑石深渊
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("黑石副本外开始进入副本")
            moveB(-7178.26,-927.956,166.845)
            waitForLoadingPosition(-7178.26,-927.956,166.845)
            prints("黑石副本外成功进入副本")
        end
        mapDistance1 = getDistanceBetween(x,y,3235.5,-4056.65)--斯坦索姆
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("斯坦索姆副本外开始进入副本")
            moveB(3235.5,-4056.65,108.467)
            waitForLoadingPosition(3235.5,-4056.65,108.467)
            prints("斯坦索姆副本外成功进入副本")
        end
    end
    
    if chat == "follow2" or chat1 == "follow2" then
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,2.52141,-3.43138)--NY
        if mapDistance1 <= 40 and mapDistance1 >= 0 then 
            prints("NY开始出本")
            moveA(1.05892,-6.355,-14.95)
            moveB(2.52141,-3.43138,-14.062)
            waitForLoadingPosition(2.52141,-3.43138,-14.062)
            prints("NY出本成功")
        end
        mapDistance1 = getDistanceBetween(x,y,-230.714,2106.73) --YY
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("YY开始出本")
            moveA(-229.335,2109.04,76.8904)
            moveB(-230.714,2106.73,76.8906)
            waitForLoadingPosition(-230.714,2106.73,76.8906)
            prints("YY出本成功")
        end
        mapDistance1 = getDistanceBetween(x,y,852.499,1312.79)--XS
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("XS开始出本")
            moveA(853.204,1316.18,18.6715)
            moveB(852.499,1312.79,18.6714)
            waitForLoadingPosition(852.499,1312.79,18.6714)
            prints("XS出本成功")
        end
        mapDistance1 = getDistanceBetween(x,y,754.893,-628.817)--MLD
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("MLD开始出本")
            moveA(754.839,-623.227,-32.9406)
            moveB(754.893,-628.817,-32.774)--出本
            waitForLoadingPosition(754.893,-628.817,-32.774)
            prints("MLD出本成功")
        end
        mapDistance1 = getDistanceBetween(x,y,456.425,38.7342)--黑石深渊
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("黑石深渊开始出本")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("黑石深渊出本成功")
        end
        mapDistance1 = getDistanceBetween(x,y,3587.84,-3637.8)--斯坦索姆
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            prints("斯坦索姆开始出本")
            moveB(3587.84,-3637.8,138.472)
            waitForLoadingPosition(3587.84,-3637.8,138.472)
            prints("斯坦索姆出本成功")
        end
        name,chat = getChatInfoByType(49) --获得队长的信息
        name1,chat1 = getChatInfoByType(1) --获得队长的信息
    end
end

function main()
    if IsBuffExist(8326) == 0 then -- 如果身上没有带着灵魂状态的Debuff
        prints("检测中")
        for i = 1, 100, 1 do
           
            callBack()
            sleep(2000)
        end
        jumpB()
    else
        x,y,z = getRolePosition()
        mapDistance1 = getDistanceBetween(x,y,1177.78,-4464.24)--怒焰死亡
        if mapDistance1 <= 50 and mapDistance1 >= 0 then --如果在炉石 then
            sleep(3000)
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            moveA(1177.78,-4464.24,21.3539)
            moveA(1216.39,-4421.53,21.7456)
            moveA(1293.62,-4396.76,26.2862)
            moveA(1343.5,-4380.38,26.1741)
            moveA(1425.18,-4367.75,25.236)
            moveA(1431.77,-4378.76,25.236)
            moveA(1443.22,-4420.18,25.236)
            moveA(1468,-4418.67,25.236)
            moveA(1514.71,-4415.75,17.9052)
            moveA(1566.3,-4413.97,7.35712)
            moveA(1591.81,-4406.96,6.79834)
            moveA(1629.94,-4401.35,14.271)
            moveA(1669.11,-4396,20.7622)
            moveA(1709.38,-4376.83,27.7806)
            moveA(1735.35,-4413.64,36.7858)
            moveA(1744.34,-4430.33,37.3929)
            moveA(1727.29,-4484.78,31.5764)
            moveA(1751.37,-4511.01,27.0998)
            moveA(1780.26,-4525.68,23.7411)
            moveA(1814.44,-4527.18,20.0703)
            moveA(1846.09,-4504.94,20.9778)
            moveA(1887.99,-4470.05,19.5603)
            moveA(1894.94,-4427.22,14.0637)
            moveA(1865.68,-4415.25,7.81862)
            moveA(1836.81,-4402.85,4.18814)
            moveA(1828.99,-4399.61,1.83294)
            moveA(1807.84,-4395.82,-18.3681)
            moveA(1810.94,-4410.15,-18.5167)
            moveA(1814.52,-4417.33,-18.5257)
            moveB(1818.34,-4424.93,-20.1594)
            waitForLoading()
        end

        mapDistance1 = getDistanceBetween(x,y,-383.85,1118.02)--YY死亡
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            moveA(-383.85,1118.02,84.4178)
            moveA(-376.517,1135.62,81.1283)
            moveA(-368.171,1175.55,66.7418)
            moveA(-369.341,1184.9,65.6991)
            moveA(-367.878,1203.66,64.619)
            moveA(-363.474,1233.56,52.7367)
            moveA(-355.099,1277.79,40.5408)
            moveA(-347.396,1327.28,33.7943)
            moveA(-338.379,1376.68,30.6281)
            moveA(-316.917,1421.04,31.1125)
            moveA(-295.262,1458.37,35.5607)
            moveA(-284.065,1471.49,39.5826)
            moveA(-252.795,1460.98,50.3686)
            moveA(-225.07,1455.52,60.3422)
            moveA(-201.992,1473.64,66.0579)
            moveA(-207.747,1496.39,70.4835)
            moveA(-233.094,1515.08,74.8345)
            moveA(-248.621,1527.58,77.1667)
            moveA(-240.966,1548.48,76.8923)
            moveB(-231.412,1570.74,76.8921)
            waitForLoading()

        end

        mapDistance1 = getDistanceBetween(x,y,2608.49,-538.961)--XS
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            moveA(2608.49,-538.961,89.0597)
            moveA(2612.7,-548.789,88.9998)
            moveA(2608.08,-561.564,88.9998)
            moveA(2601.75,-571.432,93.1976)
            moveA(2606.13,-585.436,97.3144)
            moveA(2637.45,-619.977,106.352)
            moveA(2677.12,-673.247,112.926)
            moveA(2737.85,-696.099,122.365)
            moveA(2779.37,-702.497,128.638)
            moveA(2815.21,-699.775,136.947)
            moveA(2843.22,-694.372,139.332)
            moveA(2851.85,-712.866,145.512)
            moveA(2862.56,-739.497,159.818)
            moveA(2873.24,-764.218,160.332)
            moveA(2886.26,-767.951,160.332)
            moveA(2903.85,-807.124,160.332)
            moveA(2911.1,-824.627,160.329)
            moveA(2916.64,-822.8,160.327)
            moveA(2918.2,-822.134,160.327)
            moveA(2917.79,-822.329,160.327)
            moveB(2919.92,-822.062,160.327)
            waitForLoading()
        end

        mapDistance1 = getDistanceBetween(x,y,-1448.83,1969.32)--MLD
        if mapDistance1 <= 40 and mapDistance1 >= 0 then
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            moveA(-1448.83,1969.32,85.3652)
            moveA(-1461.65,1964.45,85.4928)
            moveA(-1461.74,2004.58,78.4378)
            moveA(-1456.19,2044.81,62.9153)
            moveA(-1430.25,2071.56,61.8717)
            moveA(-1400.61,2099.59,62.2277)
            moveA(-1386.8,2133.61,63.5551)
            moveA(-1369.37,2184.81,74.7841)
            moveA(-1366.51,2193.16,78.6483)
            moveA(-1372.83,2206.46,90.5535)
            moveA(-1378.93,2224.39,91.9583)
            moveA(-1378.98,2254.42,92.2183)
            moveA(-1380.71,2297.76,92.9063)
            moveA(-1382.08,2319.59,92.3365)
            moveA(-1382.03,2342.32,92.3293)
            moveA(-1383.39,2436.21,88.8606)
            moveA(-1383.87,2460.71,88.7515)
            moveA(-1383.15,2484.72,88.8319)
            moveA(-1380.11,2507.87,92.5092)
            moveA(-1372.47,2535.79,102.419)
            moveA(-1368.51,2548.84,106.787)
            moveA(-1383.55,2570.12,111.462)
            moveA(-1384.65,2588.21,111.556)
            moveA(-1383.55,2638.62,111.556)
            moveA(-1356.46,2660.94,111.671)
            moveA(-1346,2668.36,111.622)
            moveA(-1305.79,2675.79,111.578)
            moveA(-1277.31,2680.53,111.829)
            moveA(-1248.17,2686.1,111.556)
            moveA(-1227.3,2701.33,111.306)
            moveA(-1215.88,2720.24,111.557)
            moveA(-1211.31,2740.11,113.632)
            moveA(-1207.84,2754.33,112.23)
            moveA(-1210.83,2763.48,112.79)
            moveA(-1217.61,2780.88,111.557)
            moveA(-1216.8,2805.53,114.024)
            moveA(-1256.52,2839.25,114.789)
            moveA(-1302.74,2848.72,112.926)
            moveA(-1366.85,2856.59,116.773)
            moveA(-1389.23,2871.09,126.809)
            moveA(-1419.01,2893.07,133.496)
            moveA(-1422.63,2911.45,137.154)
            moveA(-1424.98,2938.99,135.023)
            moveA(-1425.54,2946.21,134.537)
            moveA(-1431.77,2948.26,134.633)
            moveA(-1445.6,2954.82,124.173)
            moveA(-1453.98,2958.87,123.452)
            moveA(-1471.62,2958.02,121.615)
            moveA(-1473.46,2971.85,122.632)
            moveA(-1459.66,2986.5,114.7)
            moveA(-1437.76,2999.9,115.29)
            moveA(-1431.11,2983.35,115.727)
            moveA(-1428.88,2973.92,100.158)
            moveA(-1427.36,2940.88,94.3915)
            moveA(-1398,2926.51,94.4299)
            moveA(-1383.67,2920.28,92.658)
            moveA(-1374.42,2867.49,90.2239)
            moveA(-1349.34,2848.07,87.3526)
            moveA(-1322.74,2882.6,88.6376)
            moveA(-1304.55,2904.08,88.4738)
            moveA(-1294.6,2929.16,88.2477)
            moveA(-1280.73,2924.28,87.8265)
            moveA(-1271.1,2902.91,87.7575)
            moveA(-1237.14,2904.95,87.0087)
            moveA(-1198.37,2896.79,85.9949)
            moveA(-1186.97,2880.6,85.8574)
            moveB(-1183.42,2869.79,85.6598)
            waitForLoading()
        end

        mapDistance1 = getDistanceBetween(x,y,-6413.82,-1121.2)--黑石深渊
        if mapDistance1 <= 100 and mapDistance1 >= 0 then
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            prints("黑石深渊开始跑尸")
            unableFly()
            sleep(1000)
            moveA(-6413.82,-1121.2,329.571)
            moveF(-6413.82,-1121.2,429.571,1)
            moveA(-6521.65,-1063.91,421.608)
            moveA(-6618.67,-1029.37,419.312)
            moveA(-6696.06,-1001.91,416.811)
            moveA(-6788.43,-969.141,413.245)
            moveA(-6915.4,-932.361,409.329)
            moveA(-6976.85,-928.792,407.349)
            moveA(-7040.94,-925.069,405.268)
            moveA(-7126.48,-920.029,402.827)
            unableFly()
            jumpB()
            sleep(6000)
            moveF(-7180.15,-930.262,260.087,0)
            unableFly()
            jumpB()
            prints("黑石深渊灵魂进本")
            waitForLoading()
            prints("黑石深渊灵魂进本成功")
            prints("黑石深渊灵魂出本")
            moveB(456.425,38.7342,-68.9003)
            waitForLoadingPosition(456.425,38.7342,-68.9003)
            prints("黑石深渊灵魂出本成功")
        end

        mapDistance1 = getDistanceBetween(x,y,2676.76,-4016.84)--斯坦索姆
        if mapDistance1 <= 100 and mapDistance1 >= 0 then
            name,chat = getChatInfoByType(49) --获得队长的信息
            name1,chat1 = getChatInfoByType(1) --获得队长的信息
            prints("斯坦索姆开始跑尸")
            unableFly()
            sleep(1000)
            moveA(2676.76,-4016.84,95.1686)
            moveA(2757.58,-4015.35,96.6255)
            moveA(2829.81,-4017.36,102.793)
            moveA(2889.88,-4020.86,101.258)
            moveA(2958.57,-4034.25,100.984)
            moveA(3081.33,-4039.23,103.373)
            moveA(3179.2,-4039.46,105.703)
            moveA(3229.49,-4036.99,108.421)
            prints("斯坦索姆灵魂进本")
            moveB(3235.5,-4056.65,108.467)
            waitForLoadingPosition(3235.5,-4056.65,108.467)
            prints("斯坦索姆灵魂进本成功")
            prints("斯坦索姆灵魂出本")
            moveB(3587.84,-3637.8,138.472)
            waitForLoadingPosition(3587.84,-3637.8,138.472)
            prints("斯坦索姆灵魂出本成功")

        end
    end
end
main()