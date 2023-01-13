test_listview_builder = {}
function test_listview_builder.init()

end

function test_listview_builder.getItem(index)
    local item = Container:new({
            margin = EdgeInsets.only({
                top = 10,
                bottom = 10
            }),
            child = Text:new("item"..index,{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#fff')
                })
            }),
            decoration = BoxDecoration:new({
                color = Color('#4B0082'),
            })
        })
    return item
end
function test_listview_builder.build(ctx)
    return Scaffold:new({
        body = Container:new({
            -- child = Text:new("ListView",{
            --     textAlign = TextAlign.left,
            --     style = TextStyle:new({
            --         fontSize = sp(20),
            --         fontWeight = FontWeight.w400,
            --         color = Color('#fff')
            --     })
            -- })
            child = ListView:builder({
                scrollDirection = Axis.vertical,
                reverse = false,
                controller = nil,
                primary = false,
                physics = nil,
                shrinkWrap = false,
                padding = nil,
                itemExtent = nil,
                prototypeItem = nil,
                addAutomaticKeepAlives = true,
                addRepaintBoundaries = true,
                addSemanticIndexes = true,
                cacheExtent = nil,
                itemCount = 20,
                itemBuilder = function(_ctx,index)
                    return test_listview_builder.getItem(index)
                end,
                semanticChildCount = nil,
                dragStartBehavior = DragStartBehavior.start,
                keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
                restorationId = nil,
                clipBehavior = Clip.hardEdge
            })
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        })
    })
end
return test_listview_builder


