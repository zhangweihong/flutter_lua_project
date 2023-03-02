test_showtimepicker = {}
function test_showtimepicker.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_showtimepicker.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_showtimepicker.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_showtimepicker.build(ctx)--进行build操作
    return Scaffold:new({
        body = ElevatedButton:new({
            child = Text:new("test_showtimepicker",{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
            }),
            onPressed = function ()
                TimePicker:show({
                    context = ctx,
                    hour = 2,
                    minute = 3,
                    cancelText = "取消",
                    confirmText = "确定",
                    helpText = "选择时间",
                    hourLabelText = "时",
                    minuteLabelText = "分",
                    callback = function(h,m)
                        print("TimePicker",h,m)
                    end
                })
            end,
            -- onLongPress = 
        }),
        appBar =  AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_showtimepicker.dispose()--widget 销毁
    
end


return test_showtimepicker
