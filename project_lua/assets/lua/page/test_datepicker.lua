test_datepicker = {}
function test_datepicker.initState(_state,_tickerProvider)--状态初始化_state是当前widget的状态，_tickerProvider是ticker
    
end

--function test_datepicker.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_datepicker.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_datepicker.build(ctx)--进行build操作
    return Scaffold:new({
        body = ElevatedButton:new({
            child = Text:new("test_datepicker",{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
            }),
            onPressed = function ()
                DatePicker:show({
                    context = ctx,
                    initialDate = 1641484800000,
                    firstDate = 1638288000000,
                    lastDate = 1677569226717,
                    cancelText = '取消',
                    confirmText = '确定',
                    helpText = '选择时间',
                    hourLabelText = '时',
                    minuteLabelText = '分',
                    callback = function(time)
                        print("DatePicker",time)
                    end
                })
            end,
            -- onLongPress = 
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_datepicker.dispose()--widget 销毁
    
end


return test_datepicker
