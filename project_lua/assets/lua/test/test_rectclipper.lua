
test_rectclipper = {}
function test_rectclipper.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_rectclipper.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_rectclipper.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_rectclipper.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            width = 200,
            height = 200,
            child = ClipRect:new({
                child = Image.network("https://tse2-mm.cn.bing.net/th/id/OIP-C.FwcCcs9QgWK2BDmCLVYjYAHaJQ?pid=ImgDet&rs=1",{
                    width = 100,
                    height = 100,
                    -- fit = 
                }),
                clipper = RectClipper({
                    createRect = function(width,height)
                        return Rect.fromLTRB({
                            left = 30,
                            top = 40,
                            right = 100,
                            bottom = 120
                        })
                    end
                })
                -- RectClipper({
                --     createRect = function(width,height)
                --         return Rect.fromLTRB({
                --             left = 30,
                --             top = 40,
                --             right = 10,
                --             bottom = 20
                --         })
                --     end
                -- }),
                -- clipBehavior = Clip.antiAlias
            }),
            -- margin = ,
            -- padding = ,
            -- decoration = ,
            -- foregroundDecoration = nil,
            -- alignment = nil
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_rectclipper.dispose()--widget 销毁
    
end


return test_rectclipper
