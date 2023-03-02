test_checkboxlisttile = {}
function test_checkboxlisttile.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_checkboxlisttile.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_checkboxlisttile.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

local checkState = false
function test_checkboxlisttile.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = CheckboxListTile:new({
                value = checkState,
                title = Text:new("title",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                }),
                subtitle = Text:new("sub title",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                }),
                onChanged = function(value)
                    checkState = value
                    test_checkboxlisttile.setState({
                        callback = function()
                        end
                    })
                    print("CheckboxListtile",value)
                end
            }),
            color = Color('#ffff0000')
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

function test_checkboxlisttile.dispose()--widget 销毁
    
end


return test_checkboxlisttile
