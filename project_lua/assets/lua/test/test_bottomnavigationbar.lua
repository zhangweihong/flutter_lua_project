test_bottomnavigationbar = {}
function test_bottomnavigationbar.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker

end
local nowIndex = 0
function test_bottomnavigationbar.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Text:new("test_bottomnavigationbar",{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
            })
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
        bottomNavigationBar = BottomNavigationBar:new({
            items = {
                BottomNavigationBarItem:new({
                    icon = Icon:new(Icons.ac_unit,{
                        size = 20,
                        -- color = 
                    }),
                    label = "123",
                    -- backgroundColor = ,
                    -- tooltip = 
                }),
                BottomNavigationBarItem:new({
                    icon = Icon:new(Icons.arrow_downward,{
                        size = 20,
                        -- color = 
                    }),
                    label = "456",
                    -- backgroundColor = ,
                    -- tooltip = 
                })
            },
            currentIndex = nowIndex,
            onTap = function (index)
                print(index)
                test_bottomnavigationbar.setState({
                    callback = function()
                        nowIndex = index
                    end
                })
            end
        })
    })--返回widget
end
function test_bottomnavigationbar.dispose()--widget 销毁

end
return test_bottomnavigationbar
