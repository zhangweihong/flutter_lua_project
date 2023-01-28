test_consumer = {}

function test_consumer.init()--初始化操作
    CommonState:new({
        stateKey = 'test_consumer',
        value = {
            ddd = 1
        }
    })--新建一个state
end
function test_consumer.build(ctx)--widget的build
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    ElevatedButton:new({
                        child = Text:new("test_consumer",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),
                        onPressed = function ()
                            Provider:set({
                                context = ctx,
                                value = {
                                    aa = 2
                                },
                                stateKey = "test_consumer",
                                listen = false
                            })
                            CommonState:notify({stateKey = "test_consumer"})--广播state
                        end,
                        --CusumerWidget
                        -- onLongPress = 
                    }),
                    CommonCusumerWidget:new({
                        stateKey = "test_consumer",
                        -- child = ,
                        builder = function (_ctx,_tb,_child)
                            print("CommonCusumerWidget _tb",_tb,_tb.aa,_child)
                            return Text:new("CommonCusumerWidget",{
                                textAlign = TextAlign.left,
                                style = TextStyle:new({
                                    fontSize = sp(20),
                                    fontWeight = FontWeight.w400,
                                    color = Color('#ff000000')
                                })
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
        })
    })
end
return test_consumer
