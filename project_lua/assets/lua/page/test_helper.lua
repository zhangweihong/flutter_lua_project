test_helper = {}
function test_helper.init()

end
function test_helper.build(ctx)
    return Scaffold:new({
        body = Column:new({
            children = {
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test md5 str",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            local md5 = Helper:md5("abcdef")
                            print("md5",md5)
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test AESEncode",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            local en = Helper:aesEncode({key = "49ba59abbe56e057",iv = "49ba59abbe56e057",content = "i am aes"})
                            print("aesEncode",en)
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test AESDecode",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            local en = Helper:aesEncode({key = "49ba59abbe56e057",iv = "49ba59abbe56e057",content = "i am aes"})
                            local de = Helper:aesDecode({key = "49ba59abbe56e057",iv = "49ba59abbe56e057",content = en})
                            print("aesEncode",de)
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test appMode",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            local appMode = Helper.appMode
                            print("appMode",appMode)
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test appPltform",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            local appPltform = Helper.appPltform
                            print("appPltform",appPltform)
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test setOrientations",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            Helper:setOrientations({DeviceOrientation.portraitDown})
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test setEnabledSystemUIMode",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            Helper:setEnabledSystemUIMode(SystemUiMode.manual,{overlays = {SystemUiOverlay.top}})
                        end,
                    }),
                }),
                Container:new({
                    child = ElevatedButton:new({
                        child = Text:new("test Dlg",{
                            textAlign = TextAlign.left,
                            style = {
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FF8C00')
                            }
                        }),
                        onPressed = function ()
                            Helper:showDlg({
                                child = GestureDetector:new({
                                    child = Container:new({
                                        alignment = Alignment.center,
                                        decoration = BoxDecoration:new({
                                            color = Color('#00ff0000'),
                                        }),
                                        child = Container:new({
                                            decoration = BoxDecoration:new({
                                                color = Color('#00ff00'),
                                                borderRadius = BorderRadius.all(20)
                                            }),
                                            width = sp(100),
                                            height = sp(100),
                                        })
                                    }),
                                    onTap = function ()
                                        navPop(ctx)
                                    end,
                                }),
                                context = ctx,
                                barrierDismissible = false
                            })
                        end,
                    }),
                }),
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
return test_helper

