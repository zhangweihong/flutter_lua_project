test_pageview = {}
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
                    Container:new({
                        color = Color('#000'),
                        width = 100,
                        height = 100,
                        child = Text:new("111111111",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#fff')
                            }
                        })
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
