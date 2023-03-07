test_clipboard = {}
function test_clipboard.init()--初始化操作

end
function test_clipboard.build(ctx)--widget的build
    return Scaffold:new({
        body = Column:new({
            children = {
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
                        Helper:getClipboard({
                            format = 'text/plain',
                            callback = function (value)
                                print("getClipboard ",value)
                            end
                        })
                    end,
                    -- onLongPress = 
                }),
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
                        Helper:setClipboard("test_clipboard")
                    end,
                    -- onLongPress = 
                })
            },
            mainAxisAlignment = MainAxisAlignment.start,
            crossAxisAlignment = CrossAxisAlignment.start
        }),
        appBar =  AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })
end
return test_clipboard
