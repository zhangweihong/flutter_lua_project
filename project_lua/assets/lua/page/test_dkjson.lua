test_dkjson = {}
function test_dkjson.init()--初始化操作

end
function test_dkjson.build(ctx)--widget的build
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    ElevatedButton:new({
                        child = Text:new("dkjson decode",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            local t,pos,msg = DKJson.decode('{"a":"123","b":456,"c":true}')
                            print(t,t.a,t.b,t.c)
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("dkjson encode",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            local str = DKJson.encode({ a = "123",b = 456, c = true})
                            print(str)
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
        }),
        -- bottomNavigationBar = 
    })
end
return test_dkjson
