test_ani = {}
local aniCtrl
local curvedAni
local listener
function test_ani.initState(_state,_tickerProvider)
    aniCtrl = AnimationController({
        durationMilliseconds = 500,
        vsync = _tickerProvider
    })
    curvedAni = CurvedAnimation({
        parent = aniCtrl,
        curve = Curves.easeInCubic,
        reverseCurve = nil
    })
    listener = AnimationStatusListenerAdd({
        controller = aniCtrl,
        listener = function(status)
            print("status",status)
        end
    })
end

function test_ani.didUpdateWidget(oldWidget)
    print("didUpdateWidget")
end

function test_ani.build(ctx)
    return Scaffold:new({
        body = Container:new({
            child = Column:new({
                children = {
                    Image.asset("assets/img/R-C.jfif",{
                        opacity = curvedAni,
                        width = sp(100),
                        height = sp(100),
                        fit = BoxFit.cover
                    }),
                    ElevatedButton:new({
                        child = Text:new("test Forward",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            }
                        }),
                        onPressed = function ()
                            AnimationControllerForward({
                                controller = aniCtrl,
                                from = nil
                            })
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("test Reverse",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            }
                        }),
                        onPressed = function ()
                            AnimationControllerReverse({
                                controller = aniCtrl,
                                from = nil
                            })
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("test Stop",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            }
                        }),
                        onPressed = function ()
                            AnimationControllerStop({
                                controller = aniCtrl,
                                canceled = true
                            })
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("test Reset",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            }
                        }),
                        onPressed = function ()
                            AnimationControllerReset({
                                controller = aniCtrl
                            })
                        end,
                        -- onLongPress = 
                    }),
                    ElevatedButton:new({
                        child = Text:new("test Remove Listener",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            }
                        }),
                        onPressed = function ()
                            AnimationStatusListenerRemove({
                                controller = aniCtrl,
                                listener = listener
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
        })
    })
end
function test_ani.dispose()

end
return test_ani
