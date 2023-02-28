test_stf = {}
function test_stf.initState()
    print("test_stf initState")
end

function test_stf.build(ctx)
    return Scaffold:new({
        body = Row:new({
            children = {
                Column:new({
                    children = {
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Back To Home",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
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
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next ListView",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview",
                                            path = "assets/lua/page/test_listview.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next ListViewBuilder",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_builder",
                                            path = "assets/lua/page/test_listview_builder.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next ListViewCustom",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_custom",
                                            path = "assets/lua/page/test_listview_custom.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next ListViewSeparated",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_sp",
                                            path = "assets/lua/page/test_listview_sp.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next GridViewBuilder",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_gridview",
                                            path = "assets/lua/page/test_gridview.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next TestHelper",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_helper",
                                            path = "assets/lua/page/test_helper.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_safearea",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_safearea",
                                            path = "assets/lua/page/test_safearea.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_ani",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_ani",
                                            path = "assets/lua/page/test_ani.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_positioned",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_positioned",
                                            path = "assets/lua/page/test_positioned.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_consumer",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_consumer",
                                            path = "assets/lua/page/test_consumer.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_bottomnavigationbar",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_bottomnavigationbar",
                                            path = "assets/lua/page/test_bottomnavigationbar.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_dkjson",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_dkjson",
                                            path = "assets/lua/page/test_dkjson.lua"
                                        })
                                    })
                                end
                            })
                        }),
                    },
                    mainAxisAlignment = MainAxisAlignment.start,
                    crossAxisAlignment = CrossAxisAlignment.start
                }),
                Column:new({
                    children = {
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_netagent",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_netagent",
                                            path = "assets/lua/page/test_netagent.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_sig_scorllview",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_sig_scrollview",
                                            path = "assets/lua/page/test_sig_scrollview.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_clipboard",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_clipboard",
                                            path = "assets/lua/page/test_clipboard.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_widgetbinding",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_widgetbinding",
                                            path = "assets/lua/page/test_widgetbinding.lua"
                                        })
                                    })
                                end
                            })
                        })
                    },
                    mainAxisAlignment = MainAxisAlignment.start,
                    crossAxisAlignment = CrossAxisAlignment.start
                })
            },
            mainAxisAlignment = MainAxisAlignment.start,
            crossAxisAlignment = CrossAxisAlignment.start
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
