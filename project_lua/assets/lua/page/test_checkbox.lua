test_checkbox = {}
function test_checkbox.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_checkbox.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_checkbox.potest_checkboxrameCallback(time)
--	print('potest_checkboxrameCallback',time)
--end
local checkState = false
function test_checkbox.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Checkbox:new({
                value = checkState,
                onChanged = function(value)
                    checkState = value
                    test_checkbox.setState({
                        callback = function()
                        
                        end
                    })
                    print("Checkbox",value)
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
    })
end

function test_checkbox.dispose()--widget 销毁
    
end


return test_checkbox
