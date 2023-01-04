test_stf = {}
function test_stf.initState()
    print("test_stf initState")
end

function test_stf.build(ctx)
    return Scaffold:new({
        body = Container:new({
            child = ElevatedButton:new({
                child = Text:new("Test_stf",{
                    textAlign = TextAlign.left,
                    style = {
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#FF00FF')
                    }
                }),
                onPressed = function ()
                    navReplaceAndRemoveAll({
                        ctx = ctx,
                        widget = CommonStatelessWidget:new({
                            widgetName = "app",
                            path = "assets/lua/app.lua"
                        })
                    })
                end
            })
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        })
    })
end
function test_stf.dispose()
    print("test_stf dispose")
end
return test_stf
