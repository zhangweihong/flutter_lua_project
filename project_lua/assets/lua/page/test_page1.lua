test_page1 = {}

function test_page1.init()
    print("testPage1")
end

function test_page1.build(ctx)
    return Scaffold:new({
        appBar = AppBar:new({
        }),
        body = Container:new({
            child = Column:new({
                children = {
                    Text:new("Page1",{
                        textAlign = TextAlign.left,
                        style = {
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#C71585')
                        }
                    }),
                    ElevatedButton:new({
                        child = Text:new("Next",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#fff')
                            }
                        }),
                        onPressed = function ()
                            navPush({
                                ctx = ctx,
                                widget = CommonStatelessWidget:new({
									widgetName = "test_pageview",
									path = "assets/lua/page/test_pageview.lua"
								})
                            })
                        end,
                    })
                },
                mainAxisAlignment = MainAxisAlignment.start,
                crossAxisAlignment = CrossAxisAlignment.start
            })
        }),
    })
end

return test_page1;