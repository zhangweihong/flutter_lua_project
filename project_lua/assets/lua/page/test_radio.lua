test_radio = {}
function test_radio.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_radio.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_radio.postFrameCallback(time)
--	print('postFrameCallback',time)
--end
local _group = 1
function test_radio.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Row:new({
                children = {
                    Radio:new({
                        value = 2,
                        groupValue = _group,
                        onChanged = function(value)
                            _group = value
                            test_radio.setState({
                                callback = function()
                                end
                            })
                        end
                    }),
                    Radio:new({
                        value = 1,
                        groupValue = _group,
                        onChanged = function(value)
                            _group = value
                            test_radio.setState({
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

function test_radio.dispose()--widget 销毁
    
end


return test_radio
