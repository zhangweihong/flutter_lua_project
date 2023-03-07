test_share_preferences = {}
function test_share_preferences.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker

end
function test_share_preferences.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    ElevatedButton:new({
                        child = Text:new("set",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            print("SharedPreferences:setInt")
                            SharedPreferences:setInt({key = "testSetInt",value = 123})--设置一个int
                            SharedPreferences:setStringList({key = "testSetIntList" ,value = {
                                "123",
                                "456"
                            }})--设置String的luatable
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("get",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            local nowV = SharedPreferences:getInt({key = "testSetInt"})--获取int
                            print("SharedPreferences:getInt",nowV)
                            local nowVList = SharedPreferences:getStringList({key = "testSetIntList"})--获取Luatable
                            print("SharedPreferences:getStringList",nowVList[1],nowVList[2])

                        end,
                        -- onLongPress = 
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
        })
    })--返回widget
end
function test_share_preferences.dispose()--widget 销毁

end
return test_share_preferences
