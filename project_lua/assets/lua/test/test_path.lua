test_path = {}
function test_path.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_path.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_path.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_path.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = ClipPath:new({
                child = Image.network("https://tse2-mm.cn.bing.net/th/id/OIP-C.FwcCcs9QgWK2BDmCLVYjYAHaJQ?pid=ImgDet&rs=1",{
                    width = 400,
                    height = 400,
                    -- fit = 
                }),
                clipper = PathClipper({
                    createPath = function(width,height)
                        local p = Path:new()
                        Path:moveTo({
                            path = p,
                            x = 60,
                            y = 0
                        })--移动到一点
                        Path:quadraticBezierTo({
                            path = p,
                            x1 = 0,
                            y1 = 0,
                            x2 = 0,
                            y2 = 60
                        })--二次贝塞尔
                        Path:lineTo({path = p,x = 0,y = height / 1.2})--划线到一点

                        Path:cubicTo({
                            path = p,
                            x1 = width / 4,
                            y1 = height,
                            x2 = width / 4 * 3,
                            y2 = height / 1.5,
                            x3 = width,
                            y3 = height / 1.2
                        })--相对三次贝塞尔
                        Path:lineTo({path = p,x = width,y = 60})--划线到一点

                        Path:quadraticBezierTo({
                            path = p,
                            x1 = width - 60,
                            y1 = 60,
                            x2 = width - 60,
                            y2 = 0
                        })--二次贝塞尔
                        return p
                    end
                }),
                clipBehavior = Clip.antiAlias
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

function test_path.dispose()--widget 销毁
    
end


return test_path
