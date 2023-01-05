test_listview = {}
function test_listview.init()

end

function test_listview.getItems()
    local tb = {}
    for i = 1, 30, 1 do
        local item = Container:new({
            margin = EdgeInsets.only({
                top = 10,
                bottom = 10
            }),
            child = Text:new("item"..i,{
                textAlign = TextAlign.left,
                style = {
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#fff')
                }
            }),
            decoration = BoxDecoration:new({
                color = Color('#4B0082'),
            })
        })
        table.insert( tb,item )
    end
    return tb
end
function test_listview.build(ctx)
    return Scaffold:new({
        body = Container:new({
            -- child = Text:new("ListView",{
            --     textAlign = TextAlign.left,
            --     style = {
            --         fontSize = sp(20),
            --         fontWeight = FontWeight.w400,
            --         color = Color('#fff')
            --     }
            -- })
            child = CommonOverScrollBehaviorWidget({
                child = ListView:new({
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
                    children = test_listview.getItems(),
                    semanticChildCount = nil,
                    dragStartBehavior = DragStartBehavior.start,
                    keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
                    restorationId = nil,
                    clipBehavior = Clip.hardEdge
                })
            }) 
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        })
    })
end
return test_listview


