test_positioned = {}
function test_positioned.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker

end
function test_positioned.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Stack:new({
                children = {
                    Positioned:directional({
                        child = Text:new("test_positioned",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        textDirection = TextDirection.rtl,
                        start = sp(200),
                        -- top = nil,
                        -- _end = nil,
                        -- bottom = nil,
                        -- width = nil,
                        -- height = nil
                    })
                },
                alignment = Alignment.topLeft
            }),
            -- margin = ,
            -- padding = ,
            -- decoration = ,
            -- foregroundDecoration = nil,
            -- alignment = nil
        }),--返回widget,
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }) 
    })
end
function test_positioned.dispose()--widget 销毁

end
return test_positioned
