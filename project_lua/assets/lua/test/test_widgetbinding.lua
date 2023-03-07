test_widgetbinding = {}
function test_widgetbinding.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
end

function test_widgetbinding.persistentFrameCallback(time)
    print("persistentFrameCallback",time)
end

function test_widgetbinding.postFrameCallback(time)
    print("postFrameCallback",time)
end

function test_widgetbinding.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Text:new("test_widgetbinding",{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
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
function test_widgetbinding.dispose()--widget 销毁

end
return test_widgetbinding

