test_switch = {}
function test_switch.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
end

--function test_switch.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_switch.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

local _switch = false
function test_switch.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Switch:new({
                value = _switch,
                onChanged = function(value)
                    _switch = value
                    print("_switch",_switch)
                    test_switch.setState({
                        callback = function()
                        end
                    })
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

function test_switch.dispose()--widget 销毁
    
end


return test_switch
