test_composited_transform_target = {}
function test_composited_transform_target.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_composited_transform_target.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_composited_transform_target.postFrameCallback(time)
--	print('postFrameCallback',time)
--end
local showFollower = false;
function test_composited_transform_target.build(ctx)--进行build操作
    local layerLink = LayerLink:new();
    return Scaffold:new({
        body = Container:new({
            child = Stack:new({
                children = {
                    GestureDetector:new({
                        child = CompositedTransformTarget:new({
                            child = Text:new("target click show follower",{
                                textAlign = TextAlign.left,
                                style = TextStyle:new({
                                    fontSize = sp(20),
                                    fontWeight = FontWeight.w400,
                                    color = Color('#ff000000')
                                })
                            }),
                            link = layerLink,
                        }),
                        onTapDown = function ()
                            test_composited_transform_target.setState({
                                callback = function()
                                    showFollower = true;
                                end
                            })
                        end,
                        onTapUp = function ()
                            test_composited_transform_target.setState({
                                callback = function()
                                    showFollower = false;
                                end
                            })
                        end,
                    }),
                    Visibility:new({
                        child = CompositedTransformFollower:new({
                            child = Text:new("follower",{
                                textAlign = TextAlign.left,
                                style = TextStyle:new({
                                    fontSize = sp(10),
                                    fontWeight = FontWeight.w400,
                                    color = Color('#ff000000')
                                })
                            }),
                            link = layerLink,
                            targetAnchor = Alignment.bottomCenter,
                            -- offset = Offset({
                            --     dx = 20,
                            --     dy = 50
                            -- }),
                        }),
                        visible = showFollower
                    })
                },
                alignment = Alignment.topLeft,
                fit = StackFit.loose
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
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_composited_transform_target.dispose()--widget 销毁
end

return test_composited_transform_target
