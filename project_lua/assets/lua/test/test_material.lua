test_material = {}
function test_material.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_material.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_material.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_material.build(ctx)--进行build操作
    return Scaffold:new({
        body = Material:new({
            child = Text:new("test_material",{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
            }),
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_material.dispose()--widget 销毁
    
end


return test_material
