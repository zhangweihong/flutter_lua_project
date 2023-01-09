test_safearea = {}
function test_safearea.initState()
    print("test_safearea initState")
end
function test_safearea.build(ctx)
    return SafeArea:new({
        child = Scaffold:new({
            body = Container:new({
                child = Text:new("Test SafeArea",{
                    textAlign = TextAlign.left,
                    style = {
                        fontSize = sp(20),
                        fontWeight = FontWeight.w400,
                        color = Color('#ff000000')
                    }
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
    })
end
function test_safearea.dispose()
    print("test_safearea dispose")
end
return test_safearea
