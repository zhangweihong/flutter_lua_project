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
                                        fontSize = sp(12),
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview",
                                            path = "assets/lua/test/test_listview.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_builder",
                                            path = "assets/lua/test/test_listview_builder.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_custom",
                                            path = "assets/lua/test/test_listview_custom.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_listview_sp",
                                            path = "assets/lua/test/test_listview_sp.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_gridview",
                                            path = "assets/lua/test/test_gridview.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_helper",
                                            path = "assets/lua/test/test_helper.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_safearea",
                                            path = "assets/lua/test/test_safearea.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_ani",
                                            path = "assets/lua/test/test_ani.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_positioned",
                                            path = "assets/lua/test/test_positioned.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_consumer",
                                            path = "assets/lua/test/test_consumer.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_bottomnavigationbar",
                                            path = "assets/lua/test/test_bottomnavigationbar.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_dkjson",
                                            path = "assets/lua/test/test_dkjson.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_netagent",
                                            path = "assets/lua/test/test_netagent.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_sig_scrollview",
                                            path = "assets/lua/test/test_sig_scrollview.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({
                                        ctx = ctx,
                                        widget = CommonStatelessWidget:new({
                                            widgetName = "test_clipboard",
                                            path = "assets/lua/test/test_clipboard.lua"
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
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_widgetbinding",
                                            path = "assets/lua/test/test_widgetbinding.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_showtimepicker",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_showtimepicker",
                                            path = "assets/lua/test/test_showtimepicker.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_datepicker",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_datepicker",
                                            path = "assets/lua/test/test_datepicker.lua"
                                        })
                                    })
                                end
                            })
                        })
                        ,
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_checkbox",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_checkbox",
                                            path = "assets/lua/test/test_checkbox.lua"
                                        })
                                    })
                                end
                            })
                        })
                        ,
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_checkboxlisttile",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_checkboxlisttile",
                                            path = "assets/lua/test/test_checkboxlisttile.lua"
                                        })
                                    })
                                end
                            })
                        })
                        ,
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_radio",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_radio",
                                            path = "assets/lua/test/test_radio.lua"
                                        })
                                    })
                                end
                            })
                        }) ,
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_radiolisttile",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_radiolisttile",
                                            path = "assets/lua/test/test_radiolisttile.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_switch",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_switch",
                                            path = "assets/lua/test/test_switch.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_slider",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_slider",
                                            path = "assets/lua/test/test_slider.lua"
                                        })
                                    })
                                end
                            })
                        })
                        ,
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_circleavatar",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_circleavatar",
                                            path = "assets/lua/test/test_circleavatar.lua"
                                        })
                                    })
                                end
                            })
                        })
                    },
                    mainAxisAlignment = MainAxisAlignment.start,
                    crossAxisAlignment = CrossAxisAlignment.start
                }),
                Column:new({
                    children = {
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_rectclipper",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_rectclipper",
                                            path = "assets/lua/test/test_rectclipper.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_r_rectclipper",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_r_rectclipper",
                                            path = "assets/lua/test/test_r_rectclipper.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_path",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_path",
                                            path = "assets/lua/test/test_path.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_chip",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_chip",
                                            path = "assets/lua/test/test_chip.lua"
                                        })
                                    })
                                end
                            })
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_datatable",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_datatable",
                                            path = "assets/lua/test/test_datatable.lua"
                                        })
                                    })
                                end
                            }),
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_raw_mat_button",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_raw_mat_button",
                                            path = "assets/lua/test/test_raw_mat_button.lua"
                                        })
                                    })
                                end
                            }),
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_tab_bars",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_tab_bars",
                                            path = "assets/lua/test/test_tab_bars.lua"
                                        })
                                    })
                                end
                            }),
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_popupbutton",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_popupbutton",
                                            path = "assets/lua/test/test_popupbutton.lua"
                                        })
                                    })
                                end
                            }),
                        }),
                        Container:new({
                            child = ElevatedButton:new({
                                child = Text:new("Next test_composited_transform_target",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(12),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#FF00FF')
                                    })
                                }),
                                onPressed = function ()
                                    navPush({   
                                        ctx = ctx,
                                        widget = CommonStatefulWidget:new({
                                            widgetName = "test_composited_transform_target",
                                            path = "assets/lua/test/test_composited_transform_target.lua"
                                        })
                                    })
                                end
                            }),
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
