test_chip = {}
function test_chip.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_chip.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_chip.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_chip.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Chip:new({
                label = Text:new("Project",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(15),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                }),
                avatar = nil,
                labelStyle = nil,
                labelPadding = nil,
                deleteIconColor = Color('#ffff0000'),
                backgroundColor = Color('#ffF0E68C'),
                onDeleted = function()
                    print("onDeleted")
                end
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

function test_chip.dispose()--widget 销毁
    
end


return test_chip
