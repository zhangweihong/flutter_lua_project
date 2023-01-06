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
return test_helper

