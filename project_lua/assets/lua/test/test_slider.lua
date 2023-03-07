test_slider = {}
function test_slider.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_slider.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_slider.postFrameCallback(time)
--	print('postFrameCallback',time)
--end
local _sliderV = 2
function test_slider.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Slider:new({
                value = _sliderV,
                min = 0,
                max = 100.0,
                semanticFormatterCallback = function (value)
                    return tostring(math.round(value)).."元"
                end,
                onChanged = function(value)
                    print("slider",value)
                    _sliderV = value
                    test_slider.setState({
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

function test_slider.dispose()--widget 销毁
    
end


return test_slider
