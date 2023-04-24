test_tab_bars = {}
local test_contrl = nil
function test_tab_bars.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    test_contrl = TabController({
        initialIndex = 0,
        animationDuration = 1,
        vsync = _tickerProvider,
        length = 2
    })
end

--function test_tab_bars.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_tab_bars.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_tab_bars.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            -- child = ,
            -- margin = ,
            -- padding = ,
            decoration = BoxDecoration:new({
                color = Color("#ffff0000"),
                -- borderRadius = ,
                -- border = ,
                -- image = ,
            }),
            -- foregroundDecoration = nil,
            -- alignment = nil
        }),
        appBar = TabBar:new({
            tabs = {
                Text:new("11111",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                }),
                Text:new("2222",{
                    textAlign = TextAlign.left,
                    style = TextStyle:new({
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    })
                })
            },
            controller = test_contrl,
            onTap = function()
                
            end,
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_tab_bars.dispose()--widget 销毁
    
end


return test_tab_bars
