test_listview_custom = {}
function test_listview_custom.init()

end
function test_listview_custom.build(ctx)
    return Scaffold:new({
        body = ListView:custom({
            scrollDirection = Axis.vertical,
            reverse = false,
            controller = nil,
            primary = false,
            physics = nil,
            shrinkWrap = false,
            padding = nil,
            childrenDelegate = SliverChildBuilderDelegate({
                builder = function(_ctx,index)--返回item Widget
                    return Container:new({
                        decoration = BoxDecoration:new({
                            color = Color('#191970'),
                            -- borderRadius = ,
                            -- border = ,
                            -- image = ,
                        }),
                        margin = EdgeInsets.only({
                            top = 10,
                            bottom =10 ,
                        }),
                        child = Text:new("SliverChildBuilderDelegate"..index,{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff00ff')
                            })
                        })
                    })
                end,
                childCount = 20,
                addAutomaticKeepAlives = true,
                addRepaintBoundaries = true,
                addSemanticIndexes = true,
                semanticIndexOffset = 0,
                semanticIndexCallback = function(w,index)--返回semantic index
                    print("semanticIndexCallback",index)
                    return nil
                end
            }),
            itemExtent = nil,
            prototypeItem = nil,
            cacheExtent = nil,
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
return test_listview_custom
