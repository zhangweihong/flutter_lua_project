test_r_rectclipper = {}
function test_r_rectclipper.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_r_rectclipper.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_r_rectclipper.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_r_rectclipper.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            width = 200,
            height = 200,
            child = ClipRRect:new({
                    child = Image.network("https://tse2-mm.cn.bing.net/th/id/OIP-C.FwcCcs9QgWK2BDmCLVYjYAHaJQ?pid=ImgDet&rs=1",{
                        width = 100,
                        height = 100,
                        -- fit = 
                    }),
                    clipper = RRectClipper({
                        createRRect = function(width,height)
                            return RRect.fromLTRBXY({
                                left = 20,
                                top = 30,
                                right = 80,
                                bottom = 90,
                                radiusX = 10,
                                radiusY = 10
                            })
                        end
                    })
                    -- borderRadius = ,
                    -- clipBehavior = 
                })
            }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_r_rectclipper.dispose()--widget 销毁
    
end


return test_r_rectclipper
