test_raw_mat_button = {}
function test_raw_mat_button.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_raw_mat_button.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_raw_mat_button.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_raw_mat_button.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = ClipRRect:new({
                    child = RawMaterialButton:new({
                        child = Text:new("RawMaterialButton",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),--widget 类型
                        onPressed = function()
                            print("RawMaterialButton onPressed")
                        end,
                        padding = EdgeInsets.all(10)
                    }),
                    borderRadius = BorderRadius.all(30),
                    clipBehavior = Clip.antiAlias
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

function test_raw_mat_button.dispose()--widget 销毁
    
end


return test_raw_mat_button
