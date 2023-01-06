test_pageview = {}
local pageController = PageController({
	initialPage = 0,
	keepPage = true,
	viewportFraction = 1
})
function test_pageview.init()

end
function test_pageview.build(ctx)
    return Scaffold:new({
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        body = Container:new({
            child = PageView:new({
                children = {
                    Column:new({
                        children = {
                            Container:new({
                                color = Color('#000'),
                                width = sp(300),
                                height = sp(200),
                                child = Text:new("111111111",{
                                    textAlign = TextAlign.left,
                                    style = {
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#fff')
                                    }
                                })
                            }),
                            ElevatedButton:new({
                                child = Text:new("Next test_stf",{
                                    textAlign = TextAlign.left,
                                    style = {
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#f0f')
                                    }
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_stf",
                                            path = "assets/lua/page/test_stf.lua"
                                        })
                                    })
                                end,
                            })
                        },
                        mainAxisAlignment = MainAxisAlignment.start,
                        crossAxisAlignment = CrossAxisAlignment.start
                    }),
                    Container:new({
                        color = Color('#0f0'),
                        width = 100,
                        height = 100,
                        child = Text:new("2222222",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#fff')
                            }
                        })
                    }),
                },
                controller = pageController,
                physics = AlwaysScrollableScrollPhysics(),
                onPageChanged = function (index)
                    PageJumpToPage(pageController,index)
                end
            })
        })
    })
end
return test_pageview
