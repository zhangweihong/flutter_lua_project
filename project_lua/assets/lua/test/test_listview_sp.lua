test_listview_sp = {}
function test_listview_sp.init()

end
function test_listview_sp.build(ctx)
    return Scaffold:new({
        body = ListView:separated({
            scrollDirection = Axis.vertical,
            reverse = false,
            controller = nil,
            primary = false,
            physics = nil,
            shrinkWrap = false,
            padding = nil,
            addAutomaticKeepAlives = true,
            addRepaintBoundaries = true,
            addSemanticIndexes = true,
            cacheExtent = nil,
            itemBuilder = function (_ctx,index)--item Widget builder 
                return Container:new({
                    child = Text:new("item builder"..index,{
                        textAlign = TextAlign.left,
                        style = TextStyle:new({
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#FF00FF')
                        })
                    }),
                    margin = EdgeInsets.only({
                        top = 10,
                        bottom = 10,
                    }),
                    decoration = BoxDecoration:new({
                        color = Color('#191970')
                    })
                })
            end,
            separatorBuilder = function (_ctx,index)--item Widget builder 
                return Container:new({
                    child = Container:new({
                        child = Text:new("--------------",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#FFD700')
                            })
                        })
                    })
                })
            end,
            itemCount = 20,
            semanticChildCount = nil,
            dragStartBehavior = DragStartBehavior.start,
            keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
            restorationId = nil,
            clipBehavior = Clip.hardEdge
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }) 
    })
end
return test_listview_sp
