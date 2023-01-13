test_gridview = {}
function test_gridview.init()

end
function test_gridview.build(ctx)
    return Scaffold:new({
        body = GridView:builder({
            scrollDirection = Axis.vertical,
            reverse = false,
            controller = nil,
            primary = false,
            physics = nil,
            shrinkWrap = false,
            padding = nil,
            gridDelegate = SliverGridDelegateWithFixedCrossAxisCount({
                crossAxisCount = 2,
                childAspectRatio = 1.0,
                mainAxisSpacing = 0.0,
                crossAxisSpacing = 0.0,
                mainAxisExtent = nil
            }),
            itemBuilder = function (_ctx,index)--item Widget builder 
                return Container:new({
                    child = Text:new("itemBuilder"..index,{
                        textAlign = TextAlign.left,
                        style = TextStyle:new({
                            fontSize = sp(20),
                            fontWeight = FontWeight.w400,
                            color = Color('#7CFC00')
                        })
                    }),
                    margin = EdgeInsets.only({
                        top = 10,
                        left = 10,
                        bottom = 10,
                        right = 10
                    })
                })
            end,
            itemCount = 10,
            addAutomaticKeepAlives = true,
            addRepaintBoundaries = true,
            addSemanticIndexes = true,
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
return test_gridview
