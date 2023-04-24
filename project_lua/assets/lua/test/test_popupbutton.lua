test_popupbutton = {}
function test_popupbutton.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_popupbutton.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_popupbutton.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_popupbutton.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = PopupMenuButton:new({
                items = {
                    Text:new("123",{
                        textAlign = TextAlign.left,
                        style = TextStyle:new({
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#ff000000')
                        })
                    }),
                    Text:new("456",{
                        textAlign = TextAlign.left,
                        style = TextStyle:new({
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#ff000000')
                        })
                    }),
                    Text:new("789",{
                        textAlign = TextAlign.left,
                        style = TextStyle:new({
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#ff000000')
                        })
                    })
                },
                child = Text:new("PopTest",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                }),
                onSelected = function(value)
                    print(value)
                end,
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

function test_popupbutton.dispose()--widget 销毁
    
end


return test_popupbutton
