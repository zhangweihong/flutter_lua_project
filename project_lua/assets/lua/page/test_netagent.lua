test_netagent = {}
function test_netagent.init()--初始化操作

end
function test_netagent.build(ctx)--widget的build
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    ElevatedButton:new({
                        child = Text:new("test netagent fetch",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            NetAgent:Fetch({
                                url = 'https://www.baidu.com',
                                method = 'GET',
                                host = nil,
                                params = {},
                                header = {},
                                formData = {},
                                contentType = 'application/json',
                                responseType = ResponseType.json,
                                callback = function (res)
                                    print(res.statusCode,res.data,res.statusMessage)
                                end
                            })
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
return test_netagent
