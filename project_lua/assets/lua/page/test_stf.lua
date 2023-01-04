test_stf = {}
function test_stf.initState()
    print("test_stf initState")
end

function test_stf.build(ctx)
    return Scaffold:new({
        body = Container:new({
            child = Text:new("Test_stf",{
                textAlign = TextAlign.left,
                style = {
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#000')
                }
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
