test_radiolisttile = {}
function test_radiolisttile.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_radiolisttile.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_radiolisttile.postFrameCallback(time)
--	print('postFrameCallback',time)
--end
local _group = 1
function test_radiolisttile.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    RadioListTile:new({
                        value = 2,
                        groupValue = _group,
                        title = Text:new("title 1",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        subtitle = Text:new("sub title 1",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        controlAffinity = ListTileControlAffinity.leading,
                        onChanged = function(value)
                            _group = value
                            test_radiolisttile.setState({
                                callback = function()
                                end
                            })
                        end
                    }),
                    RadioListTile:new({
                        value = 1,
                        groupValue = _group,
                        title = Text:new("title 2",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        subtitle = Text:new("sub title 2",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        controlAffinity = ListTileControlAffinity.leading,
                        onChanged = function(value)
                            _group = value
                            test_radiolisttile.setState({
                                callback = function()
                                end
                            })
                        end
                    })
                },
                mainAxisAlignment = MainAxisAlignment.start,
                crossAxisAlignment = CrossAxisAlignment.start
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

function test_radiolisttile.dispose()--widget 销毁
    
end


return test_radiolisttile
